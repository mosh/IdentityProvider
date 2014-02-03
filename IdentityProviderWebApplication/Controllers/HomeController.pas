namespace WebApplication5.Controllers;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  System.Web.Http, 
  System.Web.Mvc;

type

  HomeController = public class(Controller)
  private
  protected
  public
    method &Index:ActionResult;
    method List:ActionResult;
  end;

implementation

method HomeController.Index:ActionResult;
begin
  exit View;
end;

method HomeController.List: ActionResult;
begin
  exit View;
end;



end.
