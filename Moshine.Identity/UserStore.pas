namespace Moshine.Identity;

interface

uses
  System.Data,
  System.Data.SqlServerCe,
  System.Security.Claims,
  System.Threading.Tasks,
  System.Transactions,
  Microsoft.AspNet.Identity,
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Moshine.Identity.Models, 
  Moshine.Identity.Repositories;

type

  UserStore = public class(
    IUserStore<IdentityUser>,
    IUserClaimStore<IdentityUser>,
    IUserLoginStore<IdentityUser>,
    IUserRoleStore<IdentityUser>,
    IUserPasswordStore<IdentityUser>)
  private


    _connection : SqlCeConnection;
    _userRepository : UserRepository;
    _claimRepository : UserClaimRepository;
    _loginRepository : UserLoginRepository;
    _rolesRepository : UserRoleRepository;

    method FindUser(getter:func<IdentityUser>):IdentityUser;

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
  _userRepository := new UserRepository(_connection);
  _claimRepository := new UserClaimRepository(_connection);
  _loginRepository := new UserLoginRepository(_connection);
  _rolesRepository := new UserRoleRepository(_connection);
end;


method UserStore.CreateAsync(user: IdentityUser): Task;
begin
  var alreadyOpen := (_connection.State = ConnectionState.Open);

  if(not alreadyOpen)then
  begin
    _connection.Open;
  end;
  try


    var transaction := _connection.BeginTransaction;

    var userRepository := new UserRepository(_connection, transaction);
    var loginRepository := new UserLoginRepository(_connection, transaction);

    userRepository.Add(user);

    for each login in user.Logins do
    begin
      loginRepository.Add(user, login); 
    end;

    transaction.Commit;
  finally
    if(not alreadyOpen)then
    begin
      _connection.Close;
    end;
  end;

  exit Task.FromResult<Object>(nil);
end;

method UserStore.FindByIdAsync(userId: String): Task<IdentityUser>;
begin
  exit Task.FromResult<IdentityUser>(FindUser(() -> _userRepository.FindById(userId)));
end;

method UserStore.FindByNameAsync(userName: String): Task<IdentityUser>;
begin
  exit Task.FromResult<IdentityUser>(FindUser(() -> _userRepository.FindByName(userName)));
end;

method UserStore.FindUser(getter:func<IdentityUser>):IdentityUser;
begin
  var user := getter();
  if(assigned(user))then
  begin
    user.Logins.AddRange(_loginRepository.Find(user));
  end;
  exit user;
end;


method UserStore.UpdateAsync(user: IdentityUser): Task;
begin
  raise new NotImplementedException;
  exit Task.FromResult<Object>(nil);
end;

method UserStore.AddClaimAsync(user: IdentityUser; claim: Claim): Task;
begin
  _claimRepository.Add(claim, user.Id);
  exit Task.FromResult<Object>(nil);
end;

method UserStore.GetClaimsAsync(user: IdentityUser): Task<IList<Claim>>;
begin
  exit Task.FromResult<IList<Claim>>(_claimRepository.Get(user));
end;

method UserStore.RemoveClaimAsync(user: IdentityUser; claim: Claim): Task;
begin
  raise new NotImplementedException;
  exit Task.FromResult<IList<Claim>>(nil);
end;

method UserStore.AddLoginAsync(user: IdentityUser; login: UserLoginInfo): Task;
begin

  _loginRepository.Add(user,login);

  exit Task.FromResult<Object>(nil);
end;

method UserStore.FindAsync(login: UserLoginInfo): Task<IdentityUser>;
begin
  var userId := _loginRepository.FindUserIdByLogin(login);

  if(String.IsNullOrEmpty(userId))then
  begin
    exit Task.FromResult<IdentityUser>(nil);
  end
  else
  begin
    exit Task.FromResult<IdentityUser>(_userRepository.FindById(userId));
  end;
end;

method UserStore.GetLoginsAsync(user:IdentityUser):Task<IList<UserLoginInfo>>; 
begin
  raise new NotImplementedException;
  exit Task.FromResult<IList<UserLoginInfo>>(nil);
end;

method UserStore.RemoveLoginAsync(user:IdentityUser;login:UserLoginInfo):Task;
begin
  raise new NotImplementedException;
  exit Task.FromResult<Object>(nil);
end;

method UserStore.AddToRoleAsync(user:IdentityUser;roleName:String):Task;
begin
  raise new NotImplementedException;
  exit Task.FromResult<Object>(nil);
end;

method UserStore.GetRolesAsync(user:IdentityUser):Task<IList<String>>; 
begin
  exit Task.FromResult<IList<String>>(_rolesRepository.Get(user).Select(r -> r.Name).ToList);
end;

method UserStore.IsInRoleAsync(user:IdentityUser;role:String):Task<Boolean>;
begin
  raise new NotImplementedException;
  exit Task.FromResult<Boolean>(false);
end;

method UserStore.RemoveFromRoleAsync(user:IdentityUser;role:String):Task;
begin
  raise new NotImplementedException;
  exit Task.FromResult<Object>(nil);
end;

method UserStore.DeleteAsync(user:IdentityUser):Task;
begin
  raise new NotImplementedException;
  exit Task.FromResult<Object>(nil);
end;

method UserStore.GetPasswordHashAsync(user:IdentityUser):Task<String>;
begin
  raise new NotImplementedException;
  exit Task.FromResult<String>(nil);
end;

method UserStore.HasPasswordAsync(user:IdentityUser):Task<Boolean>;
begin
  raise new NotImplementedException;
  exit Task.FromResult<Boolean>(false);
end;

method UserStore.SetPasswordHashAsync(user:IdentityUser;passwordHash:String):Task;
begin
  raise new NotImplementedException;
  exit Task.FromResult<Object>(nil);
end;

method UserStore.Dispose;
begin

end;

end.
