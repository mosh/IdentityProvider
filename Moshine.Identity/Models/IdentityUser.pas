namespace Moshine.Identity.Models;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Microsoft.AspNet.Identity;

type

  IdentityUser = public class(IUser)
  private
  protected
  public
    constructor;
    constructor(userName:String);
    property Id:String;
    property UserName:String;
    property PasswordHash:String;
    property SecurityStamp:String;
  end;

implementation

constructor IdentityUser;
begin
  Id:=Guid.NewGuid.ToString;
end;

constructor IdentityUser(userName: String);
begin
  self.UserName := userName;
end;

end.
