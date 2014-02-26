namespace Moshine.Identity.Helpers;

interface

uses
  Microsoft.AspNet.Identity,
  System.Collections.Generic,
  System.Linq,
  System.Security.Claims,
  System.Text;

type

  ExternalLoginData = public class
  private
  protected
  public
    property LoginProvider:String;
    property ProviderKey:String;
    property UserName:String;

    method GetClaims:List<Claim>;
    class method FromIdentity(identity:ClaimsIdentity):ExternalLoginData;
  end;

implementation

method ExternalLoginData.GetClaims: List<Claim>;
begin
  var claims := new List<Claim>;
  claims.Add(new Claim(ClaimTypes.NameIdentifier, ProviderKey, nil, LoginProvider));

  if (UserName <> nil)then
  begin
      claims.Add(new Claim(ClaimTypes.Name, UserName, nil, LoginProvider));
  end;

  exit claims;

end;

class method ExternalLoginData.FromIdentity(identity: ClaimsIdentity): ExternalLoginData;
begin
  if (identity = nil)then
  begin
      exit nil;
  end;

  var providerKeyClaim := identity.FindFirst(ClaimTypes.NameIdentifier);

  if (
      (providerKeyClaim = nil) or 
      String.IsNullOrEmpty(providerKeyClaim.Issuer) or
      String.IsNullOrEmpty(providerKeyClaim.Value)
      )then
  begin
      exit nil;
  end;

  if (providerKeyClaim.Issuer = ClaimsIdentity.DefaultIssuer)then
  begin
      exit nil;
  end;

  exit new ExternalLoginData
  (
      LoginProvider := providerKeyClaim.Issuer,
      ProviderKey := providerKeyClaim.Value,
      UserName := identity.FindFirstValue(ClaimTypes.Name)
  );

end;


end.
