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
    _logins:List<UserLoginInfo>;
  protected
  public
    constructor;
    constructor(userName:String);
    property Id:String;
    property UserName:String;
    property PasswordHash:String;
    property SecurityStamp:String;

    property Logins:List<UserLoginInfo> read _logins private write _logins;

  end;

implementation

constructor IdentityUser;
begin
  self.Logins := new List<UserLoginInfo>;
  Id:=Guid.NewGuid.ToString;
end;

constructor IdentityUser(userName: String);
begin
  constructor;
  self.UserName := userName;
end;

end.
