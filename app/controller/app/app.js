
$(document).ready(function () 
{
    user = getStorage('userdata', true)
    reloadImgProfile()
    $('.user_name').html(user[0].username)
    $('.user_role').html('Administrador')

})

function reloadImgProfile()
{
    if (user[0].img == '0') {
        $('.user_img').attr('src', '../assets/dist/img/perfil.png')
    }
    else {
        $('.user_img').attr('src', user[0].img)
    }
}

function getMenu()
 {

    $.ajax({
        url: config.app.core_path + "router/getMenu",
        data: {
            key: getStorage('key', false),
            token: getStorage('token', false),
            app: config.app.app_id
        },
        type: 'POST',
        dataType: 'json',

        success: function (response) {
            if (response.status == 'empty') {
                toastr.info('Consulte con su provedor, por qué no tiene menú asignado')
                ifempty(response)
                $('.loadMenu').hide()
            }
            else {
                if (response.status == 'success') {
                    printMenu(response.data)
                }
            }
        },
        error: function (response) {
            ajaxFail(response)
        },
        complate: function (response) {
        }
    })
}


function printMenu(menu)
 {
    htmlmenu = ''
    current = menu[0].module
    htmlmenu += `<li><a href="#" class="material-ripple"><i class="material-icons"> ${menu[0].icon}</i> ${current}<span class="fa arrow"></span></a><ul class="nav nav-second-level">`
    for (i = 0; i < menu.length; i++) {
        if (menu[i].print == 1) {
            if (menu[i].module == current) {
                htmlmenu += `<li ><a  onclick="${menu[i].function_}" >${menu[i].name}</a></li>`
            }
            else {
                htmlmenu += `</ul></li>`
                current = menu[i].module
                htmlmenu += `<li><a href="#" class="material-ripple"><i class="material-icons">  ${menu[i].icon}</i> ${current}<span class="fa arrow"></span></a><ul class="nav nav-second-level">`
                htmlmenu += `<li ><a onclick="${menu[i].function_}" > ${menu[i].name}</a></li>`
            }
        }
    }

    htmlmenu += `</ul></li>`
    $('#side-menu').append(htmlmenu)
    $('.loadMenu').hide()
    $('#side-menu').metisMenu();

}



function ajaxFail(data) {
    if (data.responseJSON) {
        toastr.error(data.responseJSON.message + '<br>' + data.statusText + ' (' + data.status + ') ')

        if (data.status == 403) {
            code403()
        }
        if (data.status == 401) {
            code401()
        }


    } else {
        toastr.error('Error al conectar al servidor')
    }
}

function code403() { //  403 
    toastr.info('No tiene para realizar esta petición')
}

function code401() { // 401 no autorizado
    console.log('código 401 No autorizado, se cerrrará la sesión!')
    logout()
}

function loadScript(url) {
    $.getScript(config.app.files_path + url, function () {
        console.log('cargado ', config.app.files_path + url)
    })
}








