namespace Moshine.Identity.Models;

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

  RegisterBindingModel = public class
  public
      [Required]
      [Display(Name := "User name")]
      property UserName : String;

      [Required]
      [StringLength(100, ErrorMessage := "The {0} must be at least {2} characters long.", MinimumLength := 6)]
      [DataType(DataType.Password)]
      [Display(Name := "Password")]
      property Password : String;

      [DataType(DataType.Password)]
      [Display(Name := "Confirm password")]
      [Compare("Password", ErrorMessage := "The password and confirmation password do not match.")]
      property ConfirmPassword:String;
  end;


  SetPasswordBindingModel = public class
  public

    [Required]
    [StringLength(100, ErrorMessage := "The {0} must be at least {2} characters long.", MinimumLength := 6)]
    [DataType(DataType.Password)]
    [Display(Name := "New password")]
    property NewPassword:String;

    [DataType(DataType.Password)]
    [Display(Name := "Confirm new password")]
    [Compare("NewPassword", ErrorMessage := "The new password and confirmation password do not match.")]
    property ConfirmPassword:String;
  end;

  ChangePasswordBindingModel = public class
  public  
      [Required]
      [DataType(DataType.Password)]
      [Display(Name := "Current password")]
      property OldPassword : String;

      [Required]
      [StringLength(100, ErrorMessage := "The {0} must be at least {2} characters long.", MinimumLength := 6)]
      [DataType(DataType.Password)]
      [Display(Name := "New password")]
      property NewPassword:String;

      [DataType(DataType.Password)]
      [Display(Name := "Confirm new password")]
      [Compare("NewPassword", ErrorMessage := "The new password and confirmation password do not match.")]
      property ConfirmPassword:String;
  end;

  RemoveLoginBindingModel = public class
  public
      [Required]
      [Display(Name := "Login provider")]
      property LoginProvider :String;

      [Required]
      [Display(Name := "Provider key")]
      property ProviderKey : String;
  end;




implementation

end.
