namespace Moshine.Identity;

interface

uses
  System.Data.SqlServerCe,
  System.Security.Claims,
  System.Threading.Tasks,
  Microsoft.AspNet.Identity,
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Moshine.Identity.Models;

type

  UserStore = public class(
    IUserStore<IdentityUser>,
    IUserClaimStore<IdentityUser>,
    IUserLoginStore<IdentityUser>,
    IUserRoleStore<IdentityUser>,
    IUserPasswordStore<IdentityUser>)
  private
    method GetRolesAsync(user: IdentityUser): Task<IList<dynamic>>;
    method IsInRoleAsync(user: IdentityUser; role: String): Task<dynamic>;
    method GetPasswordHashAsync(user: IdentityUser): Task<dynamic>;
    method HasPasswordAsync(user: IdentityUser): Task<dynamic>;

    _connection : SqlCeConnection;

  public
    constructor(connection: SqlCeConnection);

    method CreateAsync(user:IdentityUser):Task;
    method FindByIdAsync(userId:String):Task<IdentityUser>;
    method FindByNameAsync(userName:String):Task<IdentityUser>;
    method UpdateAsync(user:IdentityUser):Task;

    method AddClaimAsync(user:IdentityUser;claim:Claim):Task;
    method GetClaimsAsync(user:IdentityUser):Task<IList<Claim>>;
    method RemoveClaimAsync(user:IdentityUser;claim:Claim):Task;

    method AddLoginAsync(user:IdentityUser;login:UserLoginInfo):Task;
    method FindAsync(login:UserLoginInfo):Task<IdentityUser>;

    method GetLoginsAsync(user:IdentityUser):Task<IList<UserLoginInfo>>; 
    method RemoveLoginAsync(user:IdentityUser;login:UserLoginInfo):Task;
    method AddToRoleAsync(user:IdentityUser;roleName:String):Task;
    method GetRolesAsync(user:IdentityUser):Task<IList<String>>; 
    method IsInRoleAsync(user:IdentityUser;role:String):Task<Boolean>;
    method RemoveFromRoleAsync(user:IdentityUser;role:String):Task;
    method DeleteAsync(user:IdentityUser):Task;
    method GetPasswordHashAsync(user:IdentityUser):Task<String>;
    method HasPasswordAsync(user:IdentityUser):Task<Boolean>;
    method SetPasswordHashAsync(user:IdentityUser;passwordHash:String):Task;
    method Dispose;

  end;

implementation

constructor UserStore(connection: SqlCeConnection);
begin
  _connection := connection;
end;


method UserStore.CreateAsync(user: IdentityUser): Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.FindByIdAsync(userId: String): Task<IdentityUser>;
begin
  exit Task.FromResult<IdentityUser>(nil);
end;

method UserStore.FindByNameAsync(userName: String): Task<IdentityUser>;
begin
  exit Task.FromResult<IdentityUser>(nil);
end;

method UserStore.UpdateAsync(user: IdentityUser): Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.AddClaimAsync(user: IdentityUser; claim: System.Security.Claims.Claim): Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.GetClaimsAsync(user: IdentityUser): Task<IList<Claim>>;
begin
  exit Task.FromResult<IList<Claim>>(nil);
end;

method UserStore.RemoveClaimAsync(user: IdentityUser; claim: Claim): Task;
begin
  exit Task.FromResult<IList<Claim>>(nil);
end;

method UserStore.AddLoginAsync(user: IdentityUser; login: UserLoginInfo): Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.FindAsync(login: UserLoginInfo): Task<IdentityUser>;
begin
  exit Task.FromResult<IdentityUser>(nil);
end;

method UserStore.GetLoginsAsync(user:IdentityUser):Task<IList<UserLoginInfo>>; 
begin
  exit Task.FromResult<IList<UserLoginInfo>>(nil);
end;

method UserStore.RemoveLoginAsync(user:IdentityUser;login:UserLoginInfo):Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.AddToRoleAsync(user:IdentityUser;roleName:String):Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.GetRolesAsync(user:IdentityUser):Task<IList<String>>; 
begin
  exit Task.FromResult<IList<String>>(nil);
end;

method UserStore.IsInRoleAsync(user:IdentityUser;role:String):Task<Boolean>;
begin
  exit Task.FromResult<Boolean>(false);
end;

method UserStore.RemoveFromRoleAsync(user:IdentityUser;role:String):Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.DeleteAsync(user:IdentityUser):Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.GetPasswordHashAsync(user:IdentityUser):Task<String>;
begin
  exit Task.FromResult<String>(nil);
end;

method UserStore.HasPasswordAsync(user:IdentityUser):Task<Boolean>;
begin
  exit Task.FromResult<Boolean>(false);
end;

method UserStore.SetPasswordHashAsync(user:IdentityUser;passwordHash:String):Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method UserStore.Dispose;
begin

end;

method UserStore.GetRolesAsync(user: IdentityUser): Task<IList<dynamic>>;
begin

end;

method UserStore.IsInRoleAsync(user: IdentityUser; role: String): Task<dynamic>;
begin

end;

method UserStore.GetPasswordHashAsync(user: IdentityUser): Task<dynamic>;
begin

end;

method UserStore.HasPasswordAsync(user: IdentityUser): Task<dynamic>;
begin

end;



end.
