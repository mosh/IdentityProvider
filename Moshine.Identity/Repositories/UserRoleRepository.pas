namespace Moshine.Identity.Repositories;

interface

uses
  System.Collections.Generic,
  System.Dynamic,
  System.Linq,
  System.Text, 
  Moshine.Identity.Models;

type
  UserRoleRepository = public class(SqlCeRepository)
  private
  protected
  public
    method Create;override;
    method Get(user:IdentityUser):List<IdentityRole>;
  end;

implementation

method UserRoleRepository.Create;
begin
  var sqlText := new StringBuilder();

  sqlText.Append('CREATE TABLE UserRoles ( ');
  sqlText.Append('    [UserId] NVARCHAR (128) NOT NULL, ');
  sqlText.Append('    [RoleId] NVARCHAR (128) NOT NULL, ');
  sqlText.Append('    CONSTRAINT [PK_UserRoles] PRIMARY KEY ([UserId], [RoleId]), ');
  sqlText.Append('    CONSTRAINT [FK_UserRoles.Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES Roles ([Id]) ON DELETE CASCADE, ');
  sqlText.Append('    CONSTRAINT [FK_UserRoles.Users_UserId] FOREIGN KEY ([UserId]) REFERENCES Users ([Id]) ON DELETE CASCADE ');
  sqlText.Append('); ');

  Execute(sqlText);

end;

method UserRoleRepository.Get(user: IdentityUser): List<IdentityRole>;
begin
  var sqlText := new StringBuilder('select Roles.Id, Roles.Name from userroles join roles on userroles.roleid = roles.id where userroles.userid=@UserId');

  var queryParams:dynamic := new ExpandoObject;
  queryParams.UserId := user.Id;

  exit QueryAs<IdentityRole>(sqlText, Object(queryParams)).ToList;
end;

end.
