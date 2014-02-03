<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>

    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/knockout/knockout-3.0.0.js"></script>

    <script type="text/javascript">


        $(document).ready(function () {


            var accessToken = undefined;

            if (typeof (Storage) !== "undefined") {

                accessToken = localStorage.getItem('access_token');

                if (accessToken == undefined) {
                    alert("undefined");
                }
                else {
                    alert("defined");
                }
            }
            else {
                alert('Browser doesn\'t support webstorage');
            }



        });



    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
</body>
</html>
