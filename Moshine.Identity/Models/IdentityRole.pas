namespace Moshine.Identity.Models;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Microsoft.AspNet.Identity;

type
  IdentityRole = public class(IRole)
  private
  protected
  public
    property Id:String;
    property Name:String;
  end;

implementation

end.
