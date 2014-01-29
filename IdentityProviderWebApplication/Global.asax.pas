namespace WebApplication5;

interface

uses
  System,
  System.Data,
  System.Configuration,
  System.Collections,
  System.Web, 
  System.Web.Http,
  System.Web.Mvc, 
  System.Web.Routing;

type
   Global_asax = public class(System.Web.HttpApplication)
   protected
     method Application_Start(sender: Object; e: EventArgs);
   end;

implementation

method Global_asax.Application_Start(sender: Object; e: EventArgs);
begin
  GlobalConfiguration.Configure(@WebApiConfig.Register);
  FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
  RouteConfig.RegisterRoutes(RouteTable.Routes);
  
end;

end.
    