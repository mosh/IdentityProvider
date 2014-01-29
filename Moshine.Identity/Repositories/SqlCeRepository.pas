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
    method Execute(sqlText:StringBuilder);
  end;

implementation

constructor SqlCeRepository(connection: SqlCeConnection);
begin
  _connection := connection;
end;

method SqlCeRepository.Execute(sqlText: StringBuilder);
begin
  _connection.Open();
  try
    _connection.Execute(sqlText.ToString);
  finally
    _connection.Close();
  end;

end;

end.
