namespace Moshine.Identity.Repositories;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text;

type
  UserLoginRepository = public class(SqlCeRepository)
  private
  protected
  public
    method Create;override;
  end;

implementation

method UserLoginRepository.Create;
begin
  var sqlText := new StringBuilder();

  sqlText.Append('CREATE TABLE UserLogins (');
  sqlText.Append('    [UserId] NVARCHAR (128) NOT NULL References Users(Id) on Delete Cascade,');
  sqlText.Append('    [LoginProvider] NVARCHAR (128) NOT NULL,');
  sqlText.Append('    [ProviderKey] NVARCHAR (128) NOT NULL,');
  sqlText.Append('    CONSTRAINT PK_UserLogins PRIMARY KEY (UserId, LoginProvider, ProviderKey) ');
  sqlText.Append('); ');

  Execute(sqlText);

end;

end.
