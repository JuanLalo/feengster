$(document).ready(function () {
    
    //    getNotifications()
    // setTimeout(function () {
    // $('#preloader').show()
    // $('#loading').hide()
    // }, 1500)

});


let reloadUserInformation =  function()
 {
    user = $f.user.getUser()

     // Foto de perfíl
     $('.user_img').attr('src', user.img)
    
     // Opciones de usuario, disponible, sólo para usuarios que se han logeado.
     $('.user_options').html(
        `
        <li>
        <a href="app/main/">
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


function printContent(data) {
    
    $.get($f.app.getFilesPath() + data.menu.url,
         function (data) {
             $('#main_content').html(data)

    })
    .fail(function() 
    {
        let html = 
                    `
                    <div class="middle-box">
            <div class="row">
                <div class="col-sm-12">
                    <div class="error-text">
                        <h1>4<span class="error bounce">0</span><span class="m-l-90">4</span></h1>
                        <h3><span>Page</span><br class="hidden-xs"> Not Found</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="error-desc">
                        <p>Lo sentimos, pero la página que estás buscando no ha sido encontrada. Intente verificar la URL para ver si hay errores, luego presione el botón de actualización en su navegador o intente encontrar algo más en nuestra aplicación.</p>
                        <form class="navbar-form" role="search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Buscar">
                                <div class="input-group-btn">
                                    <button class="btn btn-success" type="submit">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                    `

        $('#main_content').html(html)
    })
}

function welcome()
{
    //#pendiente
    // automatizar las notificaciones para que se manden automaticamente

            setTimeout(function () {
                data = [{
                        desc:'Primer mes gratis al suscribirte en cualquiera de nuestros productos',
                        estatus:0,
                        id:-1,
                        img:"fa-bullhorn",
                        titulo:"¡Promoción!",
                        url:""
                    }]
                    sendNotification_(data)
            }, 4000)


            setTimeout(function () {
                data = [  {
                        desc:'De 10% a 20 de descuento al promocionar alguno de nustros porductos',
                        estatus:0,
                        id:-1,
                        img:"fa-bomb",
                        titulo:"¡Descuentos!",
                        url:""
                    }]
                printNotification(data)
            }, 30000)
            

   
    
}

