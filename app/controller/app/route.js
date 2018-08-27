
var module = {}


$(document).ready(function () {
    main()
});

function main() {
    mostrarContenido(
        null,
        config.main_page.name_module,
        config.main_page.tittle,
        config.main_page.desc,
        config.main_page.url,
        config.main_page.ico
    )
}

$('.inicio').click(function () {
    main()
});

function verPerfil() {
    mostrarContenido(
        null,
        'Perfil',
        'Perfil de Usuario',
        'Perfil general de usuario',
        'main/perfil.html',
        'person'
    );

}



function obtenerContenido(id) 
{
    loadContent()

    $.ajax({
        url: config.app.core_path + "router/getContent",
        data: {
            key: getStorage('key', false),
            token: getStorage('token', false),
            id_menu: id
        },
        type: 'POST',
        dataType: 'json',

        success: function (response) {
            mostrarContenido(
                id,
                response.data[0].module.toUpperCase(),
                response.data[0].title,
                response.data[0].title_desc,
                response.data[0].url,
                response.data[0].icon
            )
        },
        error: function (response) {
            goBack()
            ajaxFail(response)
        }
    })

}





function mostrarContenido(id_menu, nombre, titulo, desc, url, ico) {
    module.id_menu = id_menu
    module.nombre = nombre
    module.titulo = titulo
    $('.content-header').show()
    $('#nombre_modulo').html(nombre);
    $('#tittle').html(titulo);
    $('#tittle_desc').html(desc);
    $('#ico_content').html(ico);
    $('#main_content').html('');

    $.get(config.app.files_path + url, function (data) {
        $('#main_content').html(data);

        //lobipanel
        $('.lobidrag').lobiPanel({
            sortable: true,

            unpin: {
                icon: 'ti-move'
            },
            reload: {
                icon: 'ti-reload'
            },
            minimize: {
                icon: 'ti-minus',
                icon2: 'ti-plus'
            },
            close: {
                icon: 'ti-close'
            },
            expand: {
                icon: 'ti-fullscreen',
                icon2: 'ti-fullscreen'
            }
        });

    });


}

function completar(filtro) {
    alert(filtro)
}


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
    $('html, body').animate({ scrollTop: 0 }, 'fast');
    $('#nombre_modulo').html('Cargando...');
    $('#tittle').html('');
    $('#tittle_desc').html('');
    $('#ico_content').html('');
    $('#main_content').html('<center><img width="50" src="../assets/dist/js/loader.gif" alt="Cargando..."></center>');

}




// OTHER END


// componentes extras importantes! 

var route = [];

function add(id) {
    if (route[route.length - 1] != id) {
        route.push(id);
    }
}

function pop() {
    return route.pop();
}

function getLast() {

    return route[route.length - 2];
}



function getNow() {
    return route[route.length - 1];
}
function getroute() {
    return route;
}

