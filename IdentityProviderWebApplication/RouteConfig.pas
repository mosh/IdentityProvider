namespace WebApplication5;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Web,
  System.Web.Mvc,
  System.Web.Routing;

type
  RouteConfig = public class
  public
    class method RegisterRoutes(routes: RouteCollection);
  end;


implementation


class method RouteConfig.RegisterRoutes(routes: RouteCollection);
begin
  routes.IgnoreRoute('{resource}.axd/{*pathInfo}');

  routes.MapRoute('Default', '{controller}/{action}/{id}',
      new class (controller := 'Home', action := 'Index', id := UrlParameter.Optional ));
end;

end.
