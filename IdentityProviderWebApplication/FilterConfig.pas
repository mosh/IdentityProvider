namespace WebApplication5;

interface

uses
  System.Web,
  System.Web.Mvc;

type

  FilterConfig = public class
  public
    class method RegisterGlobalFilters(filters: GlobalFilterCollection);
  end;


implementation


class method FilterConfig.RegisterGlobalFilters(filters: GlobalFilterCollection);
begin
  filters.Add(new HandleErrorAttribute())
end;

end.
