namespace Moshine.Identity.Repositories;

interface

uses
  System.Collections.Generic,
  System.Data.SqlServerCe,
  System.Dynamic,
  System.Linq,
  System.Text, 
  Moshine.Identity.Models;

type

  UserRepository = public class(SqlCeRepository)
  protected
  public
    method Create; override;

    method Add(user:IdentityUser);
    method FindById(userId:String):IdentityUser;
    method FindByName(name:String):IdentityUser;
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

method UserRepository.Add(user: IdentityUser);
begin

  var sql := new StringBuilder;
  sql.Append('insert into Users (Id,UserName,PasswordHash, SecurityStamp) values (@Id, @UserName, @PasswordHash, @SecurityStamp)');

  Execute(sql, user);

end;

method UserRepository.FindById(userId: String): IdentityUser;
begin
  var sql := new StringBuilder();
  sql.Append('select Id,UserName,PasswordHash,SecurityStamp from Users where Id = @UserId');
  var queryParams:dynamic := new ExpandoObject;
  queryParams.UserId := userId;

  exit QueryAs<IdentityUser>(sql, Object(queryParams)).FirstOrDefault;

end;

method UserRepository.FindByName(name: String): IdentityUser;
begin
  var sql := new StringBuilder();
  sql.Append('select Id,UserName,PasswordHash,SecurityStamp from Users where UserName = @UserName');
  var queryParams:dynamic := new ExpandoObject;
  queryParams.UserName := name;

  exit QueryAs<IdentityUser>(sql, Object(queryParams)).FirstOrDefault;

end;

end.
