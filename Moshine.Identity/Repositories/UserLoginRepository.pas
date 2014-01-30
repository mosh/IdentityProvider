namespace Moshine.Identity.Repositories;

interface

uses
  System.Collections.Generic,
  System.Dynamic,
  System.Linq,
  System.Text, 
  Microsoft.AspNet.Identity,
  Moshine.Identity.Models;

type
  UserLoginRepository = public class(SqlCeRepository)
  private
  protected
  public
    method Create;override;
    method Add(user: IdentityUser; login: UserLoginInfo);
    method FindUserIdByLogin(login:UserLoginInfo):String;
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

method UserLoginRepository.Add(user: IdentityUser; login: UserLoginInfo);
begin
  var sqlText := new StringBuilder();
  sqlText.Append('insert into UserLogins (UserId, LoginProvider,ProviderKey) values (@UserId, @LoginProvider, @ProviderKey)');

  var executeParams:dynamic := new ExpandoObject;
  executeParams.UserId := user.Id;
  executeParams.LoginProvider := login.LoginProvider;
  executeParams.ProviderKey := login.ProviderKey;

  Execute (sqlText, Object(executeParams));
end;

method UserLoginRepository.FindUserIdByLogin(login: UserLoginInfo):String;
begin
  var sql := new StringBuilder('Select UserId from UserLogins where LoginProvider = @loginProvider and ProviderKey = @providerKey');

  var queryParams:dynamic := new ExpandoObject;
  queryParams.loginProvider := login.LoginProvider;
  queryParams.providerKey := login.ProviderKey;

  var loginRow:dynamic := Query(sql, Object(queryParams)).FirstOrDefault;

  if(not assigned(loginRow))then
  begin
    exit String.Empty;
  end
  else
  begin
    exit loginRow.UserId;
  end;


end;

end.
