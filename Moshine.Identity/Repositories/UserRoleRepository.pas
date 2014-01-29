namespace Moshine.Identity.Repositories;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text;

type
  UserRoleRepository = public class(SqlCeRepository)
  private
  protected
  public
    method Create;override;
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

end.
