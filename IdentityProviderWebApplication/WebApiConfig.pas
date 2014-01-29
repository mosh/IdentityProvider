namespace WebApplication5;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Net.Http,
  System.Web.Http,
  Microsoft.Owin.Security.OAuth,
  Newtonsoft.Json.Serialization;

type

  WebApiConfig = public static class
  public
    class method Register(config: HttpConfiguration);
  end;


implementation


class method WebApiConfig.Register(config: HttpConfiguration);
begin
  // Web API configuration and services
  // Configure Web API to use only bearer token authentication.
  config.SuppressDefaultHostAuthentication();
  config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));

  // Use camel case for JSON data.
  config.Formatters.JsonFormatter.SerializerSettings.ContractResolver := new CamelCasePropertyNamesContractResolver();

  // Web API routes
  config.MapHttpAttributeRoutes();

  config.Routes.MapHttpRoute( 'DefaultApi', 'api/{controller}/{id}', new class ( id := RouteParameter.Optional ));
end;

end.
