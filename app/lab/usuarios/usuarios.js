
request = 
{
  table: 'users',
  key: getStorage('key', false),
  token: getStorage('token', false)
}


$(document).ready(function () {
    $('#id').val('')
    $.fn.dataTable.ext.errMode = 'throw';
   fillTable()
    filldropdownCatUsers()
});


function filldropdownCatUsers() 
{

        $.ajax({
            // la URL para la petición
            url: config.app.core_path + "get/data?query=getCatUser&key=" + getStorage('key', false) + "&id_company=" + user[0].company_id + "&id_app=" + config.app.app_id,
            data: null,
            type: "GET",
            dataType: "json",
            success: function (data) {
                var $dropdown = $("#type_default");

               $.each(data.data, function () {
                    $dropdown.append($("<option />").val(this.id).text(this.name.toUpperCase() + '     (' + this.desc_ +')'));
                })
            },
            error: function (data) {
                toastr.error('Error al cargar los tipos de usuarios, intentelo más tarde. Por favor')
            }
        })
}

$('#form_usuarios').validator().on('submit', function (e) // formulario generico, regisra y actualiza campos
 {
    if (e.isDefaultPrevented())
    {
        toastr.warning(user[0].username + ' ' + ' Parece que el formulario no está listo')
    }
    else
    {
        activo = 'ACTIVO'
        $('.submit').addClass('disabled')
        $('.load').addClass('fa-spin')

        if(!$('#activo').is(':checked'))
        {
            activo = 'NO ACTIVO'
        } 

        if($('#id').val() == '')
           {
            toastr.info('Guardando...')
            request.url = '/new/smart/request'
            request.data =
                {
                    app_id: config.app.app_id,
                    company_id: user[0].company_id,
                    company_controlled_id: user[0].company_id,
                    username: $('#username').val(),
                    email: $('#email').val(),
                    password: $('#password').val(),
                    type_default: $('#type_default').val(),
                    status: activo,
                }
             
            sendRequest(request, CallBack)
        }
        else
        {
            toastr.info('Actualizando...')
            request.url = '/update/smart/request'
            request.id = $('#id').val(),
            request.data = 
                {
                    username: $('#username').val(),
                    password: $('#password').val(),
                    email: $('#email').val(),
                    type_default: $('#type_default').val(),
                    status: activo,
                }

            sendUpdateRequest(request, CallBack)
        }



        return false;
    }
})

function sendUpdateRequest(request, callBack) 
{
    $.ajax({
        url: config.app.core_path + request.url,
        data: request,
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            callBack(200, data)
        },
        error: function (data) {
            callBack(null, null)
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
        },
        complate: function (data) {
        }
    })
}

function CallBack(code, data)
 {

    $('.load').removeClass('fa-spin')
    if (code == 200) {
        if (data.status == 'error') {
            iferror(data)
        }
        else if (data.status == 'success') {
            swal("Bien hecho!", data.message, "success")
            $('#btn_nothing').click()
            $('#btn_reset').click()
            var t = $('#usuarios').DataTable();
            t.destroy();
            fillTable()
        }
    }
}


function deleteCallBack(code, data) 
{
    $('.load').removeClass('fa-spin')
    if (code == 200) {
        if (data.status == 'error') {
            iferror(data)
        }
        else if (data.status == 'success') {
            swal("Bien hecho!", 'Se ha elimando correctamente', "success")
            $('#btn_reset').click()
            var t = $('#usuarios').DataTable();
            t.destroy();
            fillTable()
        }
    }
}

// Mover a controller -------->
function sendRequest(request, callBack) 
{
    $.ajax({
        url: config.app.core_path + request.url,
        data: request,
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            callBack(200, data)
        },
        error: function (data) {
            callBack(null, null)
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
        },
        complate: function (data) {
        }
    })
}

$('#usuarios tbody').on('click', 'tr', function () 
{
    var table = $('#usuarios').DataTable();
    var data = table.row(this).data();
    toastr.info('Ahora puede editar esta categoría')


    $('#username').val(data['username'])
    $('#email').val(data['email'])
    $('#password').val(data['password'])
    $('#type_default').val(data['type_default'])
    $('#id').val(data['id'])

    if(data['status'] == 'ACTIVO')
    {
        $("#activo").prop('checked', true)
    }
    else
    {
        $("#activo").prop('checked', false);
    }
    

    $('#bnt_save').hide()
    $('#btn_reset').hide()
    $('#btn_nothing').show()
    $('#btn_delete').show()
    $('#btn_update').show()
    window.scroll(0, 0);
});

$('#btn_nothing').click(function ()
 {
    $('#id').val('')
    $('#btn_reset').click()
    $('#bnt_save').show()
    $('#btn_reset').show()
    $('#btn_nothing').hide()
    $('#btn_delete').hide()
    $('#btn_update').hide()
    window.scroll(0, 0);
});

$('#btn_delete').click(function ()
 {
    swal({
        title: "¿Estas seguro?",
        text: "Si esta categoría tiene servicios activos, no se podrá eliminar",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, no eliminar!",
        closeOnConfirm: true,
        closeOnCancel: false
    },
        function (isConfirm) {

            if (isConfirm) {
                if(parseInt(user[0].id) ==  parseInt($('#id').val()))
                {
                    alert('¡Lo sentimos! No podemos elminar tu propia cuenta.')
                    $('#btn_nothing').click()
           
                }
                else
                {
                toastr.info('Eliminando...')

                request.url = '/update/smart/request'
                request.id = $('#id').val(),
                request.data = 
                    {
                        status: 'ELIMINADO',
                    }
    
                sendUpdateRequest(request, deleteCallBack)
                $('#btn_nothing').click()
                }

            } else {
                swal("Cancelado", "Datos rescatados de forma segura :)", "error");
            }
        });
});



function fillTable() 
{
    "use strict"; // Start of use strict
    $('#usuarios').DataTable({

        "ajax": {
            "url": config.app.core_path + "get/data?key=" + getStorage('key', false) + "&query=getUsersAllAdmin&company_id=" +user[0].company_id+"&app_id=" + config.app.app_id,
            "type": "GET"
        },
        "columns": [

            { "data": "tipo", "title": "TIPO DE USUARIO" },
            { "data": "username", "title": "NOMBRE DE USUARIO" },
            { "data": "email", "title": "EMAIL" },
            { "data": "status", "title": "ESTATUS" },
        ],

        "language": {

            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"

        }
    },

    );
}



