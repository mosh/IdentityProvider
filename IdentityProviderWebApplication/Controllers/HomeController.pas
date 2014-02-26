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
    method Stuff:ActionResult;
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

method HomeController.Stuff: ActionResult;
begin
  var principal := self.Request.GetOwinContext().Authentication.User;
  exit  new JsonResult();
end;



end.
