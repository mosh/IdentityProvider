namespace WebApplication5.Models;

interface

uses
  System.ComponentModel.DataAnnotations,
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Newtonsoft.Json;

type

  AddExternalLoginBindingModel = public class
  public
    [Required()]
    [Display(Name := 'External access token')]
    property ExternalAccessToken: System.String;
  end;

  RegisterExternalBindingModel = public class
  public
    [Required()]
    [Display(Name := 'User name')]
    property UserName:String;
  end;



implementation

end.
