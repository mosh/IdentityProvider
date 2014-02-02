namespace Moshine.Identity.Repositories;

interface

uses
  System.Data,
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
    _transaction:SqlCeTransaction;
  public
    constructor (connection:SqlCeConnection);
    constructor (connection:SqlCeConnection;transaction:SqlCeTransaction);
    method Create;abstract;
    method Execute(sqlText:StringBuilder;param:Object := nil);
    method Query(sqlText:StringBuilder; param:Object := nil):IEnumerable<dynamic>;
    method QueryAs<T>(sqlText:StringBuilder; param:Object := nil):IEnumerable<T>;

  end;

implementation

constructor SqlCeRepository(connection: SqlCeConnection);
begin
  _connection := connection;
end;

constructor SqlCeRepository(connection:SqlCeConnection;transaction:SqlCeTransaction);
begin
  _connection := connection;
  _transaction := transaction;
end;


method SqlCeRepository.Execute(sqlText: StringBuilder;param:Object := nil);
begin
  var alreadyOpen := _connection.State = ConnectionState.Open;
  if(not alreadyOpen)then
  begin
    _connection.Open();
  end;
  try
    _connection.Execute(sqlText.ToString,param, _transaction);
  finally
    if(not alreadyOpen)then
    begin
      _connection.Close();
    end
  end;

end;

method SqlCeRepository.Query(sqlText: StringBuilder; param: Object): IEnumerable<dynamic>;
begin
  var alreadyOpen := _connection.State = ConnectionState.Open;
  if(not alreadyOpen)then
  begin
    _connection.Open();
  end;
  try
      exit _connection.Query(sqlText.ToString,param,_transaction);
  finally
    if(not alreadyOpen)then
    begin
      _connection.Close();
    end
  end;

end;

method SqlCeRepository.QueryAs<T>(sqlText:StringBuilder; param:Object := nil):IEnumerable<T>;
begin
  var alreadyOpen := _connection.State = ConnectionState.Open;
  if(not alreadyOpen)then
  begin
    _connection.Open();
  end;
  try
    exit _connection.Query<T>(sqlText.ToString,param, _transaction);
  finally
    if(not alreadyOpen)then
    begin
      _connection.Close();
    end
  end;

end;


end.
