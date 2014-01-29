namespace Moshine.Identity;

interface

uses
  System.Data.SqlServerCe,
  System.Threading.Tasks,
  Microsoft.AspNet.Identity,
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Moshine.Identity.Models;

type

  RoleStore = public class(IRoleStore<IdentityRole>)       
  private
    _connection:SqlCeConnection;
  protected
  public
    constructor (connection:SqlCeConnection);
    method CreateAsync(role:IdentityRole):Task;
    method DeleteAsync(role:IdentityRole):Task;
    method FindByIdAsync(roleId:String):Task<IdentityRole>;
    method FindByNameAsync(roleName:String):Task<IdentityRole>;
    method UpdateAsync(role:IdentityRole):Task;
    method Dispose();

  end;

implementation

method RoleStore.CreateAsync(role: IdentityRole): Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method RoleStore.DeleteAsync(role: IdentityRole): Task;
begin
  exit Task.FromResult<Object>(nil);
end;

method RoleStore.FindByIdAsync(roleId: String): Task<IdentityRole>;
begin
  exit Task.FromResult<IdentityRole>(nil);
end;

method RoleStore.FindByNameAsync(roleName: String): Task<IdentityRole>;
begin
  exit Task.FromResult<IdentityRole>(nil);

end;

method RoleStore.UpdateAsync(role: IdentityRole): Task;
begin
  exit Task.FromResult<Object>(nil);

end;

method RoleStore.Dispose;
begin

end;

constructor RoleStore(connection: SqlCeConnection);
begin
  _connection := connection;
end;

end.
