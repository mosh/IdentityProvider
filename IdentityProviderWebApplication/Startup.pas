namespace WebApplication5;

interface

uses
  System.Collections.Generic,
  System.Data.SqlServerCe,
  System.Linq,
  System.Text, 
  System.Web.Http,
  System.Web.Mvc,
  Microsoft.Owin,
  Microsoft.Owin.Security.Cookies,
  Microsoft.Owin.Security.OAuth,
  Microsoft.AspNet.Identity,
  Moshine.Identity,
  Moshine.Identity.Models,
  Owin, 
  WebApplication5.Providers;

type

  [assembly: OwinStartup(typeOf(WebApplication5.Startup))]
  Startup = public class
  private
  protected
  public
    class constructor;
    method Configuration(app:IAppBuilder);

    class property OAuthOptions:OAuthAuthorizationServerOptions;  
    class property UserManagerFactory:Func<UserManager<IdentityUser>>;
    class property PublicClientId:String;

  end;

implementation

method Startup.Configuration(app: IAppBuilder);
begin

  var config := new HttpConfiguration();

  //WebApiConfig.Register(config);
  //app.UseWebApi(config);

  //app.UseNancy;

  app.Map('/site',siteBuilder -> siteBuilder.UseNancy);
  //app.Map('/api',apiBuilder -> apiBuilder.UseWebApi(config));


  app.UseCookieAuthentication(new CookieAuthenticationOptions());
  app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

  // Enable the application to use bearer tokens to authenticate users
  app.UseOAuthBearerTokens(OAuthOptions);
  app.UseGoogleAuthentication();

end;

class constructor Startup;
begin
  PublicClientId := 'self';


  UserManagerFactory := () -> new UserManager<IdentityUser>(new UserStore(new SqlCeConnection('data source=|DataDirectory|\Identity.sdf')));

  OAuthOptions := new Microsoft.Owin.Security.OAuth.OAuthAuthorizationServerOptions
  (
    TokenEndpointPath := new PathString('/Token'),
    Provider := new ApplicationOAuthProvider(PublicClientId, UserManagerFactory),
    AuthorizeEndpointPath := new PathString('/API/Account/ExternalLogin'),
    AccessTokenExpireTimeSpan := TimeSpan.FromDays(14),
    AllowInsecureHttp := true
  );


end;

end.
