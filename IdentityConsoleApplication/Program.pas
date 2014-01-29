namespace IdentityConsoleApplication;

interface

uses
  System.Data.SqlServerCe,
  System.IO,
  System.Linq, 
  Moshine.Identity.Repositories;

type
  ConsoleApp = class
  public
    class method Main(args: array of String);
  end;

implementation

class method ConsoleApp.Main(args: array of String);
begin

  var filename := 'C:\develop\IdentityProviderWebApplication\IdentityProviderWebApplication\App_Data\Identity.sdf';

  var connectionString := String.Format('Data Source={0}', filename);

  if(File.Exists(filename))then
  begin
    File.Delete(filename);
  end;

  if(not File.Exists(filename))then
  begin
    var engine := new SqlCeEngine(connectionString);
    engine.CreateDatabase;

      var connection := new SqlCeConnection(connectionString);

      (new RoleRepository(connection)).Create;
      (new UserRepository(connection)).Create;
      (new UserClaimRepository(connection)).Create;
      (new UserLoginRepository(connection)).Create;
      (new UserRoleRepository(connection)).Create;

  end;

end;

end.
