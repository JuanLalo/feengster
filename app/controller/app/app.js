/*
    @author Feengster
      Main Feengster Lab

                            Copyright (c) 2018 Feengster
         Code written and tested by Feengster, its distribution or modification is prohibited.
         Each and every one of the functions are the property of this software. 
         It will be subject to legal proceedings for non-compliance.
         If you want to know more about legal protection or make contact visit the following link.
                           www.feengster.com/?legal

    Name: app.jss
    Version: 1.0
    last date: 10/12/2018
    type: testing
*/

/** 
 *  Event listeners Begin
 *  Jquery and feengster Framweork
*/

        // Cambia a la página de inicio configurada en los ajustes de cada app
    $('.mian').click(function(){
        //TODO
    })

        // Abre la cuenta del usuario, donde se incluyen ajustes, perfil etc.
    $('.acount').click(function(){
        // TODO
    })

        // Se ejecuta un log out, donde se borran las variables de sesión y se redirege a //app/index.html
    $('.logout').click(function(){
        //TODO
    })

        // Se abre la ventana de configuración de ajustes
    $('.settings').click(function(){
        //TODO
    })

        // Se abre el panel de ayuda.
    $('.help').click(function(){
        //TODO
    })

        // Se abre el panel para crear un ticket expres.
     $('.newTicket').click(function(){
        //TODO
    })


/**
 * Event listeners End
 */


/**
 * Notifications Begin
 */

    toastr.options = {
        closeButton: true,
        progressBar: true,
        showMethod: 'slideDown',
        timeOut: 4000
        // positionClass: "toast-top-left"
  }
  
 /**
  * Notifications END
  */



/**
 *  Event funtions Begin
 */


 


let reloadUserInformation =  function()
 {
    user = $f.user.getUser()

     // Foto de perfíl
     $('.user_img').attr('src', user.img)
    
     // Opciones de usuario, disponible, sólo para usuarios que se han logeado.
     $('.user_options').html(
        `
        <li>
        <a onclick='verPerfil(20)'>
            <i class="ti-user"></i>&nbsp;${user.name} </a>
        </li>
        <li>
        <a onclick='alert('Verificar si es necesario o se coloca en cuenta')'>
            <i class="ti-settings"></i>&nbsp; Ajustes </a>
        </li>
        <li>
        <a onclick='$f.session.logout()'>
            <i class="ti-close"></i>&nbsp; Cerrar sesión </a>
        </li>

        `
     )

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
            } else {
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

// migrando a $FG
// function ajaxFail(data) {
//     if (data.responseJSON) {
//         toastr.error(data.responseJSON.message + '<br>' + data.statusText + ' (' + data.status + ') ')

//         if (data.status == 403) {
//             code403()
//         }
//         if (data.status == 401) {
//             code401()
//         }


//     } else {
//         toastr.error('Error al conectar al servidor')
//     }
// }

// function code403() { //  403 
//     toastr.info('No tiene para realizar esta petición')
// }

// function code401() { // 401 no autorizado
//     console.log('código 401 No autorizado, se cerrrará la sesión!')
//     logout()
// }

// function loadScript(url) {
//     $.getScript(config.app.files_path + url, function () {
//         console.log('cargado ', config.app.files_path + url)
//     })
// }