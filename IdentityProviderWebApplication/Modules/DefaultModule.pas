namespace WebApplication5.Modules;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Nancy, 
  Nancy.Owin;

type

  DefaultModule = public class(NancyModule)
  private
    class method GetOwinEnvironmentValue<T>(env:IDictionary<String, Object>;name : String;defaultValue:T := default(T)):T;

  protected
  public
    constructor;
  end;

implementation



constructor DefaultModule;
begin
  Get['/Nancy'] :=  method 
    begin 
      exit 'Hello World!'; 
    end;

  Get['/owin'] := method
    begin
      var env := GetOwinEnvironmentValue<IDictionary<String, Object>>(self.Context.Items, NancyOwinHost.RequestEnvironmentKey);
      if (not assigned(env))then
      begin
          exit "Not running on owin host";
      end;

      var requestMethod := GetOwinEnvironmentValue<String>(env, "owin.RequestMethod");
      var requestPath := GetOwinEnvironmentValue<String>(env, "owin.RequestPath");
      var owinVersion := GetOwinEnvironmentValue<String>(env, "owin.Version");

      exit String.Format("You made a {0} request to {1} which runs on owin {2}.", requestMethod, requestPath, owinVersion);

    end;

end;


class method DefaultModule.GetOwinEnvironmentValue<T>(env:IDictionary<String, Object>;name: String;defaultValue:T):T;
begin
  var value:Object;
  exit iif((env.TryGetValue(name, out value)) and (value is T), T(value), defaultValue);
end;


end.
