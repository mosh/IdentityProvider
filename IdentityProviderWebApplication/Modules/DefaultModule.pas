namespace WebApplication5.Modules;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Nancy;

type

  DefaultModule = public class(NancyModule)
  private
  protected
  public
    constructor;
  end;

implementation

constructor DefaultModule;
begin
  Get['/Nancy'] := _ -> 'Hello World!';
end;

end.
