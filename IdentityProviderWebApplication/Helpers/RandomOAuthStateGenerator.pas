namespace WebApplication5.Helpers;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Security.Cryptography,
  System.Text, 
  System.Web;

type

  RandomOAuthStateGenerator = public static class
  private
    class _random:RandomNumberGenerator := new RNGCryptoServiceProvider();
  protected
  public
    class method Generate(strengthInBits:Integer):String;
  end;

implementation

class method RandomOAuthStateGenerator.Generate(strengthInBits: Integer): String;
begin
  var bitsPerByte:Integer := 8;

  if ((strengthInBits mod bitsPerByte) <> 0)then
  begin
      raise new ArgumentException('strengthInBits must be evenly divisible by 8.', 'strengthInBits');
  end;

  var strengthInBytes := strengthInBits / bitsPerByte;

  var data := new Byte[strengthInBytes];
  _random.GetBytes(data);
  exit HttpServerUtility.UrlTokenEncode(data);

end;

end.
