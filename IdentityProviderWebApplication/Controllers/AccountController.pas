namespace WebApplication5.Controllers;

interface

uses
  System.Security.Claims,
  System.Threading.Tasks,
  Microsoft.Owin.Security,
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  System.Web.Http, 
  Microsoft.AspNet.Identity, 
  System.Web.Http,
  Microsoft.Owin.Security.OAuth,
  Moshine.Identity.Models,
  WebApplication5, 
  WebApplication5.Helpers,
  Microsoft.Owin.Security.Cookies,
  WebApplication5.Models, 
  Moshine.Identity.Results,
  WebApplication5.Providers;

type

  [Authorize]
  [RoutePrefix("api/Account")]
  AccountController = public class(ApiController)
  private
    const LocalLoginProvider:String = 'Local';

    property Authentication:IAuthenticationManager read get_Authentication;
    method get_Authentication:IAuthenticationManager;

    method GetErrorResult(&result:IdentityResult):IHttpActionResult; 

  protected
    method Dispose(disposing:Boolean);override;

  public
    constructor;
    constructor (userManager:UserManager<IdentityUser>; accessToken:ISecureDataFormat<AuthenticationTicket>);

    property UserManager:UserManager<IdentityUser>;
    property AccessTokenFormat: ISecureDataFormat<AuthenticationTicket>;

    [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
    [Route('UserInfo')]
    method GetUserInfo:UserInfoViewModel;

    [Route('Logout')]
    method Logout():IHttpActionResult;

    [Route('ManageInfo')]
    method GetManageInfo(returnUrl:String; generateState:Boolean):Task<ManageInfoViewModel>;

    [OverrideAuthentication]
    [HostAuthentication(DefaultAuthenticationTypes.ExternalCookie)]
    [AllowAnonymous]
    [Route('ExternalLogin', Name := 'ExternalLogin')]
    method  GetExternalLogin(provider:String;error:String := nil):Task<IHttpActionResult>; 

    [Route('AddExternalLogin')]
    method AddExternalLogin(model:AddExternalLoginBindingModel):Task<IHttpActionResult>;    

    [OverrideAuthentication]
    [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
    [Route('RegisterExternal')]
    method RegisterExternal(model:RegisterExternalBindingModel):Task<IHttpActionResult>;

    /// <summary>
    /// returnUrl=/&generateState=true
    /// returns list of supported external logins
    /// </summary>
    /// <param name="returnUrl"></param>
    /// <param name="generateState"></param>
    /// <returns></returns>
    [AllowAnonymous]
    [Route("ExternalLogins")]
    method GetExternalLogins(returnUrl:String; generateState:Boolean):IEnumerable<ExternalLoginViewModel>;

    // POST api/Account/SetPassword
    [Route("SetPassword")]
    method SetPassword(model:SetPasswordBindingModel):Task<IHttpActionResult>;

    // POST api/Account/ChangePassword
    [Route("ChangePassword")]
    method ChangePassword(model:ChangePasswordBindingModel):Task<IHttpActionResult>;

    // POST api/Account/RemoveLogin
    [Route("RemoveLogin")]
    method RemoveLogin(model:RemoveLoginBindingModel):Task<IHttpActionResult>;

    // POST api/Account/Register
    [AllowAnonymous]
    [Route("Register")]
    method Register(model:RegisterBindingModel):Task<IHttpActionResult>;

  end;

implementation

constructor AccountController;
begin
  constructor(Startup.UserManagerFactory(), Startup.OAuthOptions.AccessTokenFormat);
end;

constructor AccountController(userManager: UserManager<IdentityUser>; accessToken: ISecureDataFormat<AuthenticationTicket>);
begin
  self.UserManager := userManager;
  self.AccessTokenFormat := AccessTokenFormat;
end;

method AccountController.GetUserInfo:UserInfoViewModel;
begin
  var externalLogin := ExternalLoginData.FromIdentity(User.Identity as ClaimsIdentity);

  exit new UserInfoViewModel
  (
      UserName := User.Identity.GetUserName(),
      HasRegistered := (externalLogin = nil),
      LoginProvider := iif(externalLogin <> nil, externalLogin.LoginProvider, nil)
  );
end;

method AccountController.Logout: IHttpActionResult;
begin
  Authentication.SignOut(CookieAuthenticationDefaults.AuthenticationType);
  exit Ok();

end;

method AccountController.get_Authentication: IAuthenticationManager;
begin
  exit Request.GetOwinContext.Authentication;
end;

method AccountController.GetManageInfo(returnUrl:String; generateState:Boolean):Task<ManageInfoViewModel>;
begin
  var user := await UserManager.FindByIdAsync(User.Identity.GetUserId());

  if (not assigned(user))then
  begin
      exit nil;
  end;

  var logins := new List<UserLoginInfoViewModel>();

  for each linkedAccount in user.Logins do
  begin
      logins.Add(new UserLoginInfoViewModel
      (
          LoginProvider := linkedAccount.LoginProvider,
          ProviderKey := linkedAccount.ProviderKey
      ));
  end;

  if (user.PasswordHash <> nil)then
  begin
      logins.Add(new UserLoginInfoViewModel
      (
          LoginProvider := LocalLoginProvider,
          ProviderKey := user.UserName
      ));
  end;

  Task.FromResult<ManageInfoViewModel>(
  new ManageInfoViewModel
  (
      LocalLoginProvider := LocalLoginProvider,
      UserName := user.UserName,
      Logins := logins,
      ExternalLoginProviders := GetExternalLogins(returnUrl, generateState)
  ));

end;

method AccountController.GetExternalLogin(provider: String; error: String := nil): Task<IHttpActionResult>;
begin
  if (assigned(error))then
  begin
      exit (Redirect(Url.Content('~/') + '#error=' + Uri.EscapeDataString(error)));
  end;

  if (not User.Identity.IsAuthenticated)then
  begin
      exit new ChallengeResult(provider, self);
  end;

  var externalLogin := ExternalLoginData.FromIdentity(User.Identity as ClaimsIdentity);

  if (not assigned(externalLogin))then
  begin
      exit InternalServerError();
  end;

  if (externalLogin.LoginProvider <> provider) then
  begin
      Authentication.SignOut(DefaultAuthenticationTypes.ExternalCookie);
      exit new ChallengeResult(provider, self);
  end;

  var user := await UserManager.FindAsync(new UserLoginInfo(externalLogin.LoginProvider,
      externalLogin.ProviderKey));

  var hasRegistered := (user <> nil);

  if (hasRegistered)then
  begin
      Authentication.SignOut(DefaultAuthenticationTypes.ExternalCookie);
      var oAuthIdentity := await UserManager.CreateIdentityAsync(user, OAuthDefaults.AuthenticationType);
      var cookieIdentity := await UserManager.CreateIdentityAsync(user, CookieAuthenticationDefaults.AuthenticationType);

      var properties := ApplicationOAuthProvider.CreateProperties(user.UserName);

      Authentication.SignIn(properties, oAuthIdentity, cookieIdentity);
  end
  else
  begin
     var claims := externalLogin.GetClaims();
      var identity := new ClaimsIdentity(claims, OAuthDefaults.AuthenticationType);
      Authentication.SignIn(identity);
  end;

  exit Ok();

end;

method AccountController.AddExternalLogin(model: AddExternalLoginBindingModel): Task<IHttpActionResult>;
begin
  if (not ModelState.IsValid)then
  begin
      exit BadRequest(ModelState);
  end;

  Authentication.SignOut(DefaultAuthenticationTypes.ExternalCookie);

  var ticket := AccessTokenFormat.Unprotect(model.ExternalAccessToken);


  if (
      (ticket = nil) or (ticket.Identity = nil) or (ticket.Properties <> nil)
      and (assigned(ticket.Properties.ExpiresUtc) and (ticket.Properties.ExpiresUtc < DateTimeOffset.UtcNow))
      )
      then
  begin
      exit BadRequest('External login failure.');
  end;

  var externalData := ExternalLoginData.FromIdentity(ticket.Identity);

  if (externalData = nil)then
  begin
      exit BadRequest('The external login is already associated with an account.');
  end;

  var &result := await UserManager.AddLoginAsync(User.Identity.GetUserId(), new UserLoginInfo(externalData.LoginProvider, externalData.ProviderKey));
  var errorResult := GetErrorResult(&result);

  if (errorResult <> nil)then
  begin
      exit errorResult;
  end;

  exit Ok();

end;

method AccountController.GetErrorResult(&result:IdentityResult):IHttpActionResult; 
begin
  if (&result = nil)then
  begin
      exit InternalServerError();
  end;

  if (not &result.Succeeded)then
  begin
      if (&result.Errors <> nil)then
      begin
          for each error in &result.Errors do
          begin
              ModelState.AddModelError("", error);
          end;
      end;

      if (ModelState.IsValid)then
      begin
          // No ModelState errors are available to send, so just return an empty BadRequest.
          exit BadRequest();
      end;

      exit BadRequest(ModelState);
  end;

  exit nil;

end;

method AccountController.RegisterExternal(model:RegisterExternalBindingModel):Task<IHttpActionResult>;
begin
  if (not ModelState.IsValid)then
  begin
      exit BadRequest(ModelState);
  end;

  var externalLogin := ExternalLoginData.FromIdentity(User.Identity as ClaimsIdentity);

  if (not assigned(externalLogin))then
  begin
      exit InternalServerError();
  end;

  var user := new IdentityUser
  (
      UserName := model.UserName
  );
  user.Logins.Add(new UserLoginInfo(externalLogin.LoginProvider,externalLogin.ProviderKey));

  var &create := await UserManager.CreateAsync(user);
  var errorResult := GetErrorResult(&create);

  if (assigned(errorResult))then
  begin
      exit errorResult;
  end;

  exit Ok();

end;

method AccountController.GetExternalLogins(returnUrl:String; generateState:Boolean):IEnumerable<ExternalLoginViewModel>;
begin
  var descriptions := Authentication.GetExternalAuthenticationTypes();
  var logins := new List<ExternalLoginViewModel>();

  var state:String;

  if (generateState)then
  begin
      var strengthInBits := 256;
      state := RandomOAuthStateGenerator.Generate(strengthInBits);
  end
  else
  begin
      state := nil;
  end;

  for each description in descriptions do
  begin
      var login := new ExternalLoginViewModel();
      login.Name := description.Caption;
      login.Url := Url.Route("ExternalLogin", new class
          (
              provider := description.AuthenticationType,
              response_type := "token",
              client_id  := Startup.PublicClientId,
              redirect_uri := new Uri(Request.RequestUri, returnUrl).AbsoluteUri,
              state := state
          ));

      login.State := state;

      logins.Add(login);
  end;

  exit logins;

end;


method AccountController.Dispose(disposing:Boolean);
begin
  if (disposing)then
  begin
      UserManager.Dispose();
  end;

  inherited Dispose(disposing);

end;

method AccountController.SetPassword(model:SetPasswordBindingModel):Task<IHttpActionResult>;
begin
  if (not ModelState.IsValid)then
  begin
      exit BadRequest(ModelState);
  end;

  var &result := await UserManager.AddPasswordAsync(User.Identity.GetUserId(), model.NewPassword);
  var errorResult := GetErrorResult(&result);

  if (assigned(errorResult))then
  begin
      exit errorResult;
  end;

  exit Ok();

end;

method AccountController.ChangePassword(model:ChangePasswordBindingModel):Task<IHttpActionResult>;
begin

  if (not ModelState.IsValid)then
  begin
      exit BadRequest(ModelState);
  end;

  var &result := await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
  var errorResult := GetErrorResult(&result);

  if (assigned(errorResult))then
  begin
      exit errorResult;
  end;

  exit Ok();
end;

method AccountController.RemoveLogin(model:RemoveLoginBindingModel):Task<IHttpActionResult>;
begin

  if (not ModelState.IsValid)then
  begin
      exit BadRequest(ModelState);
  end;

  var &result:IdentityResult;

  if (model.LoginProvider = LocalLoginProvider)then
  begin
      &result := await UserManager.RemovePasswordAsync(User.Identity.GetUserId());
  end
  else
  begin
      &result := await UserManager.RemoveLoginAsync(User.Identity.GetUserId(),
          new UserLoginInfo(model.LoginProvider, model.ProviderKey));
  end;

  var errorResult := GetErrorResult(&result);

  if (assigned(errorResult))then
  begin
      exit errorResult;
  end;

  exit Ok();
end;

method AccountController.Register(model:RegisterBindingModel):Task<IHttpActionResult>;
begin

  if (not ModelState.IsValid)then
  begin
      exit BadRequest(ModelState);
  end;

  var user := new IdentityUser (UserName := model.UserName);

  var &result := await UserManager.CreateAsync(user, model.Password);
  var errorResult := GetErrorResult(&result);

  if (assigned(errorResult))then
  begin
      exit errorResult;
  end;

  exit Ok();
end;

end.
