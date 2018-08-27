var t_files = {}

$(document).ready(function () {
    key_producto = '13ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H'
    printUsers();
    t_files.number = 0
});

function saveTicket(status)
{

    if ($('#esequipo').prop('checked'))
    {
        equipo = "1";
        id_equipo = $('#recibe_equipo').val();

    }
    else
    {
        equipo = "0";
        id_equipo = 0;
        recibe = $('#recibe').val();
    }

    t_json =
        {
            key: key_producto,
            solicita: $('#solicita').val(),
            recibe: null,
            copia: $('#copia').val(),
            nombre: $('#nombre_ticket').val(),
            producto: $('#producto').val(),
            categoria: sessionStorage.getItem('cat_t'),
            equipo: equipo,
            id_equipo: id_equipo,
            des: $('.trumbowyg-editor').html(),
            tipo: $('#tipo').val(),
            prioridad: $('#prioridad').val(),
            status: status,
            files: t_files
        }

    $.ajax({
        url: config.app.core_path + 'ticket/createTicket',
        data: t_json,
        type: 'POST',
        dataType: 'json',

        success: function (data) {
            swal("Bien hecho!", data.message, "success")
            clean()

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


        },
        complate: function () {

        }
    })

}

function clean()
{
    $("#solicita").val($("#solicita option:first").val());
    $("#recibe").val($("#recibe option:first").val());
    $("#copia").val($("#copia option:first").val());
    $("#producto").val($("#producto option:first").val());
    $('#nombre_ticket').val('')
    // considerar si es en equipo
    $('.trumbowyg-editor').html(''),
    $("#tipo").val($("#tipo option:first").val());
    $("#prioridad").val($("#prioridad option:first").val());
    t_files = {}
    $('#limpiar_archivos').click()

}

function printUsers()
 {
    $.ajax({
        // la URL para la petición
        url: config.app.core_path + "get/data?query=userByTypeAll&key=" + key_producto + "&company_id=" + 1,
        data: null,
        type: "GET",
        dataType: "json",
        success: function (data) {

            $('#solicita').append('<option value="0">--</option>');
            $('#recibe').append('<option value="0">Sin asignar</option>');
            $('#copia').append('<option value="0">Sin copia</option>');
            data = data.data
            for (i = 0; i < data.length; i++) {
                $('#solicita').append('<option value="' + data[i]['id'] + '">' + data[i]['username'] + '</option>');
                $('#recibe').append('<option value="' + data[i]['id'] + '">' + data[i]['username'] + '</option>');
                $('#copia').append('<option value="' + data[i]['id'] + '">' + data[i]['username'] + '</option>');
            }
        },
        error: function (data) {
            console.log(data)
            if (data.responseJSON) {
                toastr.error(data.responseJSON.message + '<br>' + data.statusText + ' (' + data.status + ') ');
            } else {
                toastr.error('Error al conectar al servidor');
            }
        }
    })
}

function printUsers2() {
    var settings = {
        "async": true,
        "crossDomain": true,
        "url": config.app.core_path + "router/get/data?key=" + key_producto + "&query=test&id=2",
        "method": "GET",
        "processData": false,
    }

    $.ajax(settings).done(function (response) {


    })
        .fail(function (data) {

            console.log(data)
            if (data.responseJSON) {
                toastr.error(data.responseJSON.message + '<br>' + data.statusText + ' (' + data.status + ') ');
            } else {
                toastr.error('Error al conectar al servidor');
            }

        });
}

function imprimirEquipos() {
    var settings = {
        "async": true,
        "crossDomain": true,
        "url": config.app.core_path + "user/getTeams",
        "method": "POST",
        "headers": {
            "Content-Type": "application/json"
        },
        "processData": false,
        "data": "{\n\t\"key\": \"" + key_producto + "\",\n\t\"token\": \"1\"\n}"
    }

    $.ajax(settings).done(function (response) {

        $('#recibe_equipo').html();
        $('#recibe_equipo').append('<option value="">Sin asignar</option>');

        data = response.data;
        for (i = 0; i < data.length; i++) {
            $('#recibe_equipo').append('<option value="' + data[i]['id'] + '"><b>' + data[i]['name'] + '</b><br> (' + data[i]['des'] + ')' + '</option>');
        }

    }).fail(function (data) {

        console.log(data)
        if (data.responseJSON) {
            toastr.error(data.responseJSON.message + '<br>' + data.statusText + ' (' + data.status + ') ');
        } else {
            toastr.error('Error al conectar al servidor');
        }

    });
}

$('#esequipo').click(function () {
    setTimeout(function () {
        if ($('#esequipo').prop('checked')) {
            imprimirEquipos()
            $('#pnl_equipo').show();
            $('#pnl_individual').hide();
        } else {
            $('#pnl_equipo').hide()
            $('#pnl_individual').show()
        }
    }, 200);




});
