namespace Moshine.Identity.Repositories;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text;

type
  UserClaimRepository = public class(SqlCeRepository)
  private
  protected
  public
    method Create;override;
  end;

implementation

method UserClaimRepository.Create;
begin
  var sqlText := new StringBuilder();

//  sqlText.Append('CREATE TABLE UserClaims (');
//  sqlText.Append('    [Id] INT IDENTITY (1, 1) NOT NULL,');
//  sqlText.Append('    [ClaimType] NVARCHAR (4000) NULL,');
//  sqlText.Append('    [ClaimValue] NVARCHAR (4000) NULL,');
//  sqlText.Append('    [User_Id] NVARCHAR (128) NOT NULL,');
//  sqlText.Append('    CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED ([Id]),');
//  sqlText.Append('    CONSTRAINT [FK_UserClaims.Users_User_Id] FOREIGN KEY ([User_Id]) REFERENCES Users ([Id]) ON DELETE CASCADE');
//  sqlText.Append(');');

  sqlText.Append('CREATE TABLE UserClaims (');
  sqlText.Append('    [Id] INT IDENTITY (1, 1) NOT NULL constraint PK_UserClaims Primary Key,');
  sqlText.Append('    [ClaimType] NVARCHAR (4000) NULL,');
  sqlText.Append('    [ClaimValue] NVARCHAR (4000) NULL,');
  sqlText.Append('    [User_Id] NVARCHAR (128) NOT NULL References Users(Id) ON Delete Cascade');
  sqlText.Append(');');


  Execute(sqlText);

end;

end.
