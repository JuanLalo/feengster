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
        printContent($f.router.getMaintMenu())
    })

        // Abre la cuenta del usuario, donde se incluyen ajustes, perfil etc.
    $('.acount').click(function(){
        openAcount()
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

    $('#fg_menu_search').focus()


    // device detection
    if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) { 
    $f.app.setTypeDevice('mobile')
    }



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
        timeOut: 2500
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
        <li onclick='openAcount()'>
        <a >
            <i class="ti-user"></i>&nbsp;${user.name} </a>
        </li>
        <li>
        <a onclick='alert('Verificar si es necesario o se coloca en cuenta')'>
            <i class="ti-settings"></i>&nbsp; Ajustes </a>
        </li>
        <li onclick='$f.session.logout()'>
        <a >
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



/** 
* Extra appearance
*/

var hide_menu = false

$('.hide_menu').click(
    function()
    {
        if(!hide_menu)
        {
        $('#sidebar-menu').hide()
        $('#page-wrapper').css("margin-left","1px")
        $('.hide_menu').html('<a><i class="material-icons">menu</i></a>')
        hide_menu = true
        }
        else
        {
            $('#sidebar-menu').show()
            $('#page-wrapper').css("margin-left","245px")
            $('.hide_menu').html('<a><i class="material-icons">keyboard_backspace</i></a>')
            hide_menu = false
        }
    }
)

function resizeContent()
{
    let w = $("body").width()
    if (w < 768) 
    {
        
     $('.header_menu').css("padding-top","5px")
     $('#page-wrapper').css("margin-left","1px")
     $('#sidebar-menu').css("position","absolute")
     $('.header_menu').css("margin-top","2px")
      return 'xs'
    }
     else if (w < 992)
    {
        $('.header_menu').css("padding-top","45px")
        $('#sidebar-menu').css("position","fixed")
        $('#sidebar-menu').show()
        $('#page-wrapper').css("margin-left","245px")
        $('.hide_menu').html('<a><i class="material-icons">keyboard_backspace</i></a>')
        hide_menu = false
        $('#sidebar-menu').css("position","fixed")
        return 'sm'
    }
     else if(w < 1200)
    {
        $('.header_menu').css("padding-top","45px")
        $('#sidebar-menu').css("position","fixed")
        $('#sidebar-menu').show()
        $('#page-wrapper').css("margin-left","245px")
        $('.hide_menu').html('<a><i class="material-icons">keyboard_backspace</i></a>')
        hide_menu = false  
      
        return 'md'
    } 
    else 
    {
        $('.header_menu').css("padding-top","45px")
        $('#sidebar-menu').css("position","fixed")
        $('#sidebar-menu').show()
        $('#page-wrapper').css("margin-left","245px")
        $('.hide_menu').html('<a><i class="material-icons">keyboard_backspace</i></a>')
        hide_menu = false
      return 'lg'
    } 
}

$(window).resize(function() 
{
    resizeContent()
})





