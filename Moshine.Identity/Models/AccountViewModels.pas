namespace Moshine.Identity.Models;

interface

uses
  System,
  System.Collections.Generic;

type
// Models returned by AccountController actions.

  ExternalLoginViewModel = public class
  public
    property Name: System.String;
    property Url: System.String;
    property State: System.String;
  end;


  ManageInfoViewModel = public class
  public
    property LocalLoginProvider: System.String;
    property UserName: System.String;
    property Logins: IEnumerable<UserLoginInfoViewModel>;
    property ExternalLoginProviders: IEnumerable<ExternalLoginViewModel>;
  end;


  UserInfoViewModel = public class
  public
    property UserName: System.String;
    property HasRegistered: System.Boolean;
    property LoginProvider: System.String;
  end;


  UserLoginInfoViewModel = public class
  public
    property LoginProvider: System.String;
    property ProviderKey: System.String;
  end;


implementation


end.
