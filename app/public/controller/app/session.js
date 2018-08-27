/* 
Juan Eduardo Rosales Rosales
Controlador principal de la sesión del usuario actual.
*/

user = {}

function show()
 {
    if (localStorage.getItem("token") !== null && sessionStorage.getItem("token") !== null)
    {
        window.location.href = config.app.main_url;
    }
    else
    {
        document.title = config.app.name;
    }

}

function run_()
 {
    if (Session()) 
    {
        user = getStorage('userdata', true)
        bloqueado()
        permission = false
        for (i = 0; i < user.apps.length; i++) {
            if (user.apps[i].app_id == config.app.app_id) {
                permission = true
                saveStorage('key', user.apps[i].key_, false)
            }
        }

        if (permission)
         {
            document.title = config.app.name + ' - ' + user[0].username
            $('#app_name').html(config.app.name)
            $('#company_name').html(user.company[0].company)
            getMenu()
         //   getNotifications()
        }
        else 
        {
            toastr.warning('No tiene permiso para ingresar a esta aplicación')
            logout()
        }


    }
}

function open_app()
 {
    run_()
 }

function Session()
 {
    if (localStorage.getItem("token") === null && sessionStorage.getItem("token") === null) 
    {
        window.location.href = config.app.login_url
    }
    else
    {
        return true
    }
}

function isLocalStorage()
 {
    if (localStorage.getItem("token") !== null && sessionStorage.getItem("token") === null) 
    {
        return true;
    } else if (localStorage.getItem("token") === null && sessionStorage.getItem("token") !== null) 
    {
        return false;
    } else 
    {
        Session()
    }
}

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

    if (url != null) {
        window.location.href = url
        console.log()
    }
    else {
        toastr.warning('No tiene permisos para ingresar a esta Aplicación')
    }


}

function login(app) 
{
    $('.btn_login').html('<i class="fa fa-circle-o-notch fa-spin"></i>  Espere...')
    $('.btn_login').prop('disabled', true);

    sendloginRequest($('#username').val(), $('#pass').val(), app, false)

}


function sendloginRequest(user, pass, app, unlock)
{

    $.ajax({
        url: config.app.core_path + "login",
        data: {
            key: config.licence.key_,
            username: user,
            password: pass
        },
        type: 'POST',
        dataType: 'json',

        success: function (data) {
            if (data.status == 'empty') {
                ifempty(data)
            }
            else {
                if (!unlock) {
                    if ($('#checkbox3').prop('checked')) {
                        localStorage.setItem('key', config.licence.key_)
                        localStorage.setItem('token', '1');
                        localStorage.setItem('userdata', JSON.stringify(data.data))
                    } else {
                        sessionStorage.setItem('key', config.licence.key_)
                        sessionStorage.setItem('token', '1');
                        sessionStorage.setItem('userdata', JSON.stringify(data.data))
                    }
                    window.location.href = config.app.main_url + '?app=' + app

                }
                else {
                    window.location.href = config.app.main_url
                }
            }

            $('.btn_login').html('<i class="fa fa-circle-o-notch "></i> Iniciar Sesión')
            $('.btn_login').prop('disabled', false);
        },
        error: function (data) {
            console.log(data)
            if (data.responseJSON) {
                toastr.error(data.responseJSON.message + '<br>' + data.statusText + ' (' + data.status + ') ');
            } else {
                if (data.status == 205) {
                    toastr.error('No hemos encontrado resultados para tu solicitud')
                }
                else if (data.status == 405) {

                    toastr.warning('Ruta de WS no encontrada. Estatus: ' + data.status)

                }
                else if (data.status == 205) {
                    toastr.error('Error al conectar al servidor ' + data.status)

                }
                else {
                    toastr.error('Error al conectar al servidor ' + data.status)

                }
            }

            $('.btn_login').html('<i class="fa fa-circle-o-notch "></i> Iniciar Sesión')
            $('.btn_login').prop('disabled', false);


        },
        complate: function () {
            $('.btn_login').prop('disabled', false);
        }
    })
}

function ifempty(data)
{
    toastr.warning(data.message)
}

function bloqueado()
 {
    if (getStorage('bloqueado', false))
    {
        logout()
    }

 }

function logout() 
{

    toastr.warning('Cerrando sesión...');
    setTimeout(function () {
        sessionStorage.clear();
        localStorage.clear();
        window.location.href = config.app.login_url
    }, 1000)

}

