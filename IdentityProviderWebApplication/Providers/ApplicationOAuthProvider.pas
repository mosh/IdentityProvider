namespace WebApplication5.Providers;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Security.Claims,
  System.Threading.Tasks,
  Microsoft.AspNet.Identity,
  Microsoft.Owin.Security,
  Microsoft.Owin.Security.Cookies,
  Microsoft.Owin.Security.OAuth, 
  Moshine.Identity.Models,
  WebApplication5;

type

  ApplicationOAuthProvider = public class(OAuthAuthorizationServerProvider)
  private
    var     _publicClientId: System.String; readonly;
    var     _userManagerFactory: Func<UserManager<IdentityUser>>; readonly;

  public
    constructor(publicClientId: System.String; userManagerFactory: Func<UserManager<IdentityUser>>);

    method GrantResourceOwnerCredentials(context: OAuthGrantResourceOwnerCredentialsContext): Task; override;

    method TokenEndpoint(context: OAuthTokenEndpointContext): Task; override;

    method ValidateClientAuthentication(context: OAuthValidateClientAuthenticationContext): Task; override;

    method ValidateClientRedirectUri(context: OAuthValidateClientRedirectUriContext): Task; override;

    class method CreateProperties(userName: System.String): AuthenticationProperties;
  end;


implementation


constructor ApplicationOAuthProvider(publicClientId: System.String; userManagerFactory: Func<UserManager<IdentityUser>>);
begin
  if String.IsNullOrEmpty(publicClientId) then 
  begin
    raise new ArgumentNullException('publicClientId')
  end;

  if userManagerFactory = nil then begin
    raise new ArgumentNullException('userManagerFactory')
  end;

  _publicClientId := publicClientId;
  _userManagerFactory := userManagerFactory
end;

method ApplicationOAuthProvider.GrantResourceOwnerCredentials(context: OAuthGrantResourceOwnerCredentialsContext): Task;
begin
  using userManager: UserManager<IdentityUser> := _userManagerFactory() do 
  begin
    var user: IdentityUser := await userManager.FindAsync(context.UserName, context.Password);

    if user = nil then 
    begin
      context.SetError('invalid_grant', 'The user name or password is incorrect.');
      exit
    end;

    var oAuthIdentity: ClaimsIdentity := await userManager.CreateIdentityAsync(user, context.Options.AuthenticationType);
    var cookiesIdentity: ClaimsIdentity := await userManager.CreateIdentityAsync(user, CookieAuthenticationDefaults.AuthenticationType);
    var properties: AuthenticationProperties := CreateProperties(user.UserName);
    var ticket: AuthenticationTicket := new AuthenticationTicket(oAuthIdentity, properties);
    context.Validated(ticket);
    context.Request.Context.Authentication.SignIn(cookiesIdentity)
  end
end;

method ApplicationOAuthProvider.TokenEndpoint(context: OAuthTokenEndpointContext): Task;
begin
  for each &property: KeyValuePair<System.String, System.String> in context.Properties.Dictionary do begin
    context.AdditionalResponseParameters.Add(&property.Key, &property.Value)
  end;

  exit Task.FromResult<System.Object>(nil)
end;

method ApplicationOAuthProvider.ValidateClientAuthentication(context: OAuthValidateClientAuthenticationContext): Task;
begin
  // Resource owner password credentials does not provide a client ID.
  if context.ClientId = nil then 
  begin
    context.Validated()
  end;
  exit Task.FromResult<System.Object>(nil);
end;

method ApplicationOAuthProvider.ValidateClientRedirectUri(context: OAuthValidateClientRedirectUriContext): Task;
begin
  if context.ClientId = _publicClientId then 
  begin
    var expectedRootUri: Uri := new Uri(context.Request.Uri, '/');

    if expectedRootUri.AbsoluteUri = context.RedirectUri then 
    begin
      context.Validated()
    end
  end;

  exit Task.FromResult<System.Object>(nil)
end;

class method ApplicationOAuthProvider.CreateProperties(userName: System.String): AuthenticationProperties;
begin

  var data := new Dictionary<String,String>();
  data.Add('userName',userName);

  exit new AuthenticationProperties(data);
end;

end.
