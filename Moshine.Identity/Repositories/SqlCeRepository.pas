namespace Moshine.Identity.Repositories;

interface

uses
  Dapper,
  System.Collections.Generic,
  System.Data.SqlServerCe,
  System.Linq,
  System.Text;

type

  SqlCeRepository = public abstract class
  private
  protected
    _connection:SqlCeConnection;
  public
    constructor (connection:SqlCeConnection);
    method Create;abstract;
    method Execute(sqlText:StringBuilder;param:Object := nil);
    method Query(sqlText:StringBuilder; param:Object := nil):IEnumerable<dynamic>;
  end;

implementation

constructor SqlCeRepository(connection: SqlCeConnection);
begin
  _connection := connection;
end;

method SqlCeRepository.Execute(sqlText: StringBuilder;param:Object := nil);
begin
  _connection.Open();
  try
    _connection.Execute(sqlText.ToString,param);
  finally
    _connection.Close();
  end;

end;

method SqlCeRepository.Query(sqlText: StringBuilder; param: Object): IEnumerable<dynamic>;
begin
  _connection.Open();
  try
    exit _connection.Query(sqlText.ToString,param);
  finally
    _connection.Close();
  end;

end;

end.
