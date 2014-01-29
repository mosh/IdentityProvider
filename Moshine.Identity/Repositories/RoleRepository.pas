namespace Moshine.Identity.Repositories;

interface

uses
  System.Data.SqlServerCe,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  RoleRepository = public class(SqlCeRepository)
  protected
  public
    method Create; override;
  end;

implementation


method RoleRepository.Create;
begin
  var sqlText := new StringBuilder();
  sqlText.Append('CREATE TABLE Roles (');
  sqlText.Append('    [Id] NVARCHAR (128) NOT NULL,');
  sqlText.Append('    [Name] NVARCHAR (100) NOT NULL,');
  sqlText.Append('    PRIMARY KEY NONCLUSTERED ([Id])');
  sqlText.Append(');');

  Execute(sqlText);

end;


end.
