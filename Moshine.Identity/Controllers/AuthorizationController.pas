namespace Moshine.Identity.Controllers;

interface

uses
  System.Security.Claims,
  System.Threading.Tasks,
  Microsoft.AspNet.Identity,
  Microsoft.Owin.Security,
  Microsoft.Owin.Security.OAuth,
  Moshine.Identity.Models,
  Moshine.Identity.Helpers,
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  System.Web.Http, 
  Microsoft.Owin.Security.Cookies,
  Moshine.Identity.Providers,
  Moshine.Identity.Results;

type

  AuthorizationController = public abstract class(ApiController)
  private
  protected
    property Authentication:IAuthenticationManager read get_Authentication;
    method get_Authentication:IAuthenticationManager;

  protected
    method GetPublicClientId:String;abstract;

    property UserManager:UserManager<IdentityUser>;

  public



  end;

implementation

method AuthorizationController.get_Authentication: IAuthenticationManager;
begin
  exit Request.GetOwinContext.Authentication;
end;


end.
