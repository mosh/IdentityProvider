<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>

    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/knockout/knockout-3.0.0.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {


            $.get("api/account/ExternalLogins?returnUrl=/&generateState=true", function (data) {
                ko.applyBindings(new LoginsViewModel(data));
            });
        });

        function LoginsViewModel(externalLogins)
        {
            var self = this;
            self.logins = ko.observableArray(externalLogins);

            self.performLogin = function (login) {
                window.location.href = login.url;
            };
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <thead>
                <tr><th>Login With</th></tr>
            </thead>
            <tbody data-bind="foreach: logins">
                <tr>
                    <td><input type="button" class="loginButton" data-bind="value: name, click: $parent.performLogin"/></td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
