<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>

    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/knockout/knockout-3.0.0.js"></script>
    <script type="text/javascript" src="/scripts/site.js"></script>

    <script type="text/javascript">
        function showLogin() {
            $("#loginContainer").css("visibility", "visible");
        }

        $(document).ready(function () {

            Site.init();

            $.get("api/account/ExternalLogins?returnUrl=/&generateState=true", function (data) {
                ko.applyBindings(new LoginsViewModel(data));
            });

            if (Site.accessToken == undefined) {
                showLogin();
            }

            $.ajax({
                beforeSend: function (request) {
                    Site.setHeaders(request);
                },
                url: "api/account/UserInfo"
            }).fail(function (data) {
                if ((Site.accessToken != undefined) && (data.status == 401)) {
                    showLogin();
                    Site.clear();

                }
            }).done(function (data) {
                if (!data.hasRegistered) {
                    $("#registerTable").css("visibility", "visible");
                    $("#userName").val(data.userName);
                }
                else {
                    $("#usernameContainer").html(data.userName);
                    $("#userContainer").css("visibility", "visible");
                }
            });

            $("#logout").click(function () {
                Site.clear();
                $("#usernameContainer").html("");
                $("#userContainer").css("visibility", "hidden");
            });

            $("#signUp").click(function () {

                var model = {
                    "userName": $("#userName").val()
                };

                $.ajax({
                    beforeSend: function (request) {
                        Site.setHeaders(request);
                    },
                    url: "api/account/RegisterExternal",
                    type: "POST",
                    data: model
                }).fail(function () {
                }).done(function (data) {
                    alert("registered..");
                });


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
        <div id="userContainer" style="float:right;visibility:hidden">Hello<span style="padding-left:5px;padding-right:5px" id="usernameContainer"></span><span id="logout" style="text-decoration:underline;cursor:pointer">Logout</span></div>
        <table id="loginContainer" style="visibility:hidden">
            <thead>
                <tr><th>Login With</th></tr>
            </thead>
            <tbody data-bind="foreach: logins">
                <tr>
                    <td><input type="button" class="loginButton" data-bind="value: name, click: $parent.performLogin"/></td>
                </tr>
            </tbody>
        </table>
        <table id="registerTable" style="visibility:hidden">
            <tr>
                <td colspan="2">Register your google account</td>
            </tr>
            <tr>
                <td colspan="2">You've successfully authenticated with Google. Please enter a user name for this site below and click the Register button to finish logging in. </td>
            </tr>
            <tr>
                <td>User name</td><td><input id="userName" type="text"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" id="signUp" value="Sign up"/></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
