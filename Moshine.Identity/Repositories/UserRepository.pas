namespace Moshine.Identity.Repositories;

interface

uses
  System.Collections.Generic,
  System.Data.SqlServerCe,
  System.Linq,
  System.Text;

type

  UserRepository = public class(SqlCeRepository)
  protected
  public
    method Create; override;
  end;

implementation

method UserRepository.Create;
begin

  var sqlText := new StringBuilder();
  sqlText.Append('CREATE TABLE Users (');
  sqlText.Append('    [Id] NVARCHAR (128) NOT NULL,');
  sqlText.Append('    [UserName] NVARCHAR (4000) NULL,');
  sqlText.Append('    [PasswordHash] NVARCHAR (4000) NULL,');
  sqlText.Append('    [SecurityStamp] NVARCHAR (4000) NULL,');
  sqlText.Append('    PRIMARY KEY NONCLUSTERED ([Id])');
  sqlText.Append(');');

  Execute(sqlText);

end;

end.
