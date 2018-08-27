
request = 
{
  table: 'categories',
  key: getStorage('key', false),
  token: getStorage('token', false)
}


$(document).ready(function () {
    $('#id').val('')
    $.fn.dataTable.ext.errMode = 'throw';
    fillTable()
});


$('#form_categories').validator().on('submit', function (e) // formulario generico, regisra y actualiza campos
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
                    id_app: config.app.app_id,
                    type: module.nombre,
                    id_company: user[0].company_id,
                    name: $('#name').val(),
                    desc_: $('#desc_').val(),
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
                    name: $('#name').val(),
                    desc_: $('#desc_').val(),
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
            swal("Bien hecho!", data.message , "success")
            $('#btn_reset').click()
            $('#btn_nothing').click()
            var t = $('#categories').DataTable();
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
            var t = $('#categories').DataTable();
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

$('#categories tbody').on('click', 'tr', function () 
{
    var table = $('#categories').DataTable();
    var data = table.row(this).data();
    toastr.info('Ahora puede editar esta categoría')
    $('#name').val(data['name'])
    $('#desc_').val(data['desc_'])
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

                toastr.info('Eliminando...')

                request.url = '/update/smart/request'
                request.id = $('#id').val(),
                request.data = 
                    {
                        name: $('#name').val(),
                        desc_: $('#desc_').val(),
                        status: 'ELIMINADO',
                    }
    
                sendUpdateRequest(request, deleteCallBack)
                $('#btn_nothing').click()

            } else {
                swal("Cancelado", "Datos rescatados de forma segura :)", "error");
            }
        });
});



function fillTable() 
{
    "use strict"; // Start of use strict
    $('#categories').DataTable({

        "ajax": {
            "url": config.app.core_path + "get/data?key=" + getStorage('key', false) + "&query=getCategories&id_company=" +user[0].company_id+"&type="+module.nombre+"&id_app=" + config.app.app_id,
            "type": "GET"
        },
        "columns": [
            { "data": "name", "title": "NOMBRE" },
            { "data": "desc_", "title": "DESCRIPCIÓN" },
            { "data": "status", "title": "ESTATUS" },
        ],

        "language": {

            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"

        }
    },

    );
}



