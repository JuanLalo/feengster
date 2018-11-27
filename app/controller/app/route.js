
var module = {}




function openAcount() {
    loadContent()
    let data  =
     {
        menu : { 
            id : 0,
            name : '',
            title : '',
            desc :  '',
            url : 'main/perfil.html',
            ico : ''
            },

        module : {
            name : 'Perfil',
            id : 1
            }
    }

    printContent(data)
}



function obtenerContenido(id) 
{
    loadContent()
    $f.router.findMenuContent(
             id,
             function(data){
                printContent(data)
            },
            function(data){
                   goBack()
                   ajaxFail(data)
            }
    )
}





function printContent(data) {
    //$('.content-header').hide()
    if(data.menu.title != '')
    {
      $('#nombre_modulo').html(data.module.name.toUpperCase())
      $('#tittle').html(data.menu.title);
      $('#tittle_desc').html(data.menu.desc);
      $('#ico_content').html(data.menu.ico);
      $('.content-header').show()
    }else
    {
        $('.content-header').hide()
    }

    $.get($f.app.getFilesPath() + data.menu.url,
         function (data) {
             $('#main_content').html(data)
             // #TODO
             // Implentar función de reload
             
            if($f.app.getTypeDevice() == 'pc')
            { 
             $('.lobidrag').lobiPanel({
                 reload: false,
                 close: true,
                 editTitle: false,
                 sortable: false,
                 unpin: {
                     icon: 'ti-move'
                 },
                 
                close: {
                  icon: 'ti-close'
                },
                 minimize: {
                     icon: 'ti-minus',
                     icon2: 'ti-plus'
                 },
                 expand: {
                     icon: 'ti-fullscreen',
                     icon2: 'ti-fullscreen'
                 }
             })
            }

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
                                <input type="text" class="form-control" placeholder="Search for page">
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

$('.ti-move').click(function()
{
    alert()
    
})


function goBack() {
    if (undefined != getLast()) {
        obtenerContenido(getLast());
        pop();
        pop();
    } else {
        $('html, body').animate({ scrollTop: 0 }, 'fast');
        $('.inicio').click();
    }
}



// GERA!!!

function verUsuarios(filtro, id_menu) {
    sessionStorage.setItem("idUserType", filtro);
    obtenerContenido(id_menu);
}

function redirigir(dir) {
    window.location.href = dir;
}



// APP END

// ------------------------------------------- Ruteo de contenido adicional  -------------------------------------- //
// OTHER BEGIN
function nuevoTicket() {
    $(".openModal_Nuevo").trigger("click");
}



$('.newTicket').click(function () {
    $(".md-close").trigger("click");
    sessionStorage.setItem('cat_t', 'TICKET')
    setTimeout(function () {

        mostrarContenido(
            null,
            'Nuevo Ticket',
            'Nuevo Ticket',
            'Si no tienes un gestor asignado no asignes tu ticket.',
            'mysupport/tickets/nuevoticket/nuevoticket.html',
            'assignment'
        );
    },

        600);
});

$('.newProject').click(function () {
    $(".md-close").trigger("click");
    sessionStorage.setItem('cat_t', 'PROYECTO')
    setTimeout(function () {
        mostrarContenido(
            null,
            'Nuevo Proyecto',
            'Nuevo Proyecto',
            'Selecciona la persona encargada del proyecto y en las gestiones agrega los detalles',
            'mysupport/tickets/nuevoticket/nuevoticket.html',
            'business'
        );
    }, 600);
});

$('.newTask').click(function () {
    $(".md-close").trigger("click");
    sessionStorage.setItem('cat_t', 'TAREA')
    setTimeout(function () {
        mostrarContenido(
            null,
            'Nueva Tarea',
            'Nuevo Tarea',
            'Explica de forma detalla el proceso de tus actividades.',
            'mysupport/tickets/nuevoticket/nuevoticket.html',
            'playlist_add'
        );
    }, 600);
});


function verTickets(filtro, id_menu) {
    sessionStorage.setItem("ticket_status", filtro);
    obtenerContenido(id_menu);
}

function loadContent() {
    $('.content-header').hide()
    $('html, body').animate({ scrollTop: 0 }, 'fast');
    $('#main_content').html('<div class="text-center"><br><br><br><img width="50" src="../assets/dist/js/loader.gif" alt="Cargando..."></div>');

}



