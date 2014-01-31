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

            var href = $(location).attr('href');

            var q = href.split('#')[1];
            var vars = [], hash;

            if (q != undefined) {
                q = q.split('&');
                for(var i = 0; i < q.length; i++){
                    hash = q[i].split('=');
                    vars.push(hash[1]);
                    vars[hash[0]] = hash[1];
                }
            }
            var accessToken = vars['access_token'];

            var headers = {};

            if (accessToken != undefined) {
                headers = {
                    "Authorization": "Bearer " + accessToken
                }
            }

            $.ajax({
                beforeSend: function (request) {

                    if (accessToken != undefined) {
                        request.setRequestHeader("Authorization", "Bearer " + accessToken);
                    }

                    request.setRequestHeader("cache", false);
                },
                url: "api/account/UserInfo"
            }).fail(function () {
            }).done(function (data) {
                if (!data.hasRegistered) {
                    $("#userName").val(data.userName);
                }
                else {
                    alert("registered..");
                }
            });

            $("#signUp").click(function () {

                var model = {
                    "userName": $("#userName").val()
                };

                $.ajax({
                    beforeSend: function (request) {

                        if (accessToken != undefined) {
                            request.setRequestHeader("Authorization", "Bearer " + accessToken);
                        }

                        request.setRequestHeader("cache", false);
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
        <table>
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
