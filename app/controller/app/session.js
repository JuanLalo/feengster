/* 
Juan Eduardo Rosales Rosales
Controlador principal de la sesión del usuario actual.
*/

(function(){
    user = {}
}())


function goToApp(app_id)
 {
    user = getStorage('userdata', true)
    console.log(user.apps)
    url = null
    for (i = 0; i < user.apps.length; i++) {
        if (user.apps[i].app_id == app_id) {
            url = '../' + user.apps[i].url
            saveStorage('key', user.apps[i].key_, false)
        }
    }

    if (url != null)
    {
        window.location.href = url
        console.log()
    }
    else
    {
        toastr.warning('No tiene permisos para ingresar a ' + config.app.name)
    }
}


function isDemo()
{
    (function ($) {
        $.get = function (key) {
            key = key.replace(/[\[]/, '\\[');
            key = key.replace(/[\]]/, '\\]');
            var pattern = "[\\?&]" + key + "=([^&#]*)";
            var regex = new RegExp(pattern);
            var url = unescape(window.location.href);
            var results = regex.exec(url);
            if (results === null) {
                return null;
            } else {
                return results[1];
            }
        }
    })(jQuery);

    if($.get("user") != null & $.get("pass") != null & $.get("app") != null)
    {
        $('#username').val($.get("user"))
        $('#pass').val($.get("pass"))
        login($.get("app"))
    }
}
