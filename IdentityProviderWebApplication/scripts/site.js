var Site = {

    init: function () {

        this.accessToken = undefined;

        if (typeof (Storage) !== "undefined") {

            this.accessToken = localStorage.getItem('access_token');

            if (this.accessToken == undefined) {

                var href = $(location).attr('href');

                var q = href.split('#')[1];
                var vars = [], hash;

                if (q != undefined) {
                    q = q.split('&');
                    for (var i = 0; i < q.length; i++) {
                        hash = q[i].split('=');
                        vars.push(hash[1]);
                        vars[hash[0]] = hash[1];
                    }
                }
                this.accessToken = vars['access_token'];

                if (this.accessToken != undefined) {
                    localStorage.setItem('access_token', this.accessToken);
                }

            }
            else {
            }
        }
        else {
            alert('Browser doesn\'t support webstorage');
        }
        
    },
    clear: function () {
        localStorage.removeItem("access_token");
    },
    setHeaders: function (request) {

        if (this.accessToken != undefined) {
            request.setRequestHeader("Authorization", "Bearer " + this.accessToken);
        }
        request.setRequestHeader("cache", false);

    }

};

