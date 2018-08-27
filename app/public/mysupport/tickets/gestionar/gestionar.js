

$(document).ready(function () {
    key_producto ='13ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H'

    id_ticket_gestion = sessionStorage.getItem('id_ticket_gestion');
    
    printUsers()
    getTicket()
    
    $.fn.dataTable.ext.errMode = 'throw';
    "use strict"; // Start of use strict
    $('#gestiones').DataTable({
    
        "ajax": {
            "url": config.app.core_path + "router/get/data?key="+ key_producto +"&query=getLogTickets&id_ticket=" + id_ticket_gestion,
           "type": "GET"
        },
        "columns": [
            { "data": "id_user", "title": "ID USUARIO" },
            { "data": "desc", "title": "GESTIÓN" },
            { "data": "time", "title": "HORAS" },
            { "data": "crated_at", "title": "FECHA REGISTRO" },
        ],
    
        "language": {
    
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
    
        }, 
        
                    dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 55, "All"]],
                    buttons: [
                        {extend: 'copy', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'},
                        {extend: 'csv', title: 'tickets', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'},
                        {extend: 'excel', title: 'tickets', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'},
                        {extend: 'pdf', title: 'tickets', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'},
                        {extend: 'print', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'}
                    ]
    
    },
    
    );

});


function printUsers() {
    var settings = {
        "async": true,
        "crossDomain": true,
        "url": config.app.core_path + "user/getByType",
        "method": "POST",
        "headers": {
            "Content-Type": "application/json"
        },
        "processData": false,
        "data": "{\n\t\"key\": \""+ key_producto+"\",\n\t\"usertype\": \"all\"\n}"
    }

    $.ajax(settings).done(function (response) {
        $('#solicita').append('<option value="0">--</option>');
        $('#recibe').append('<option value="0">Sin asignar</option>');
        $('#copia').append('<option value="0">Sin copia</option>');

        data = response.data;
        for (i = 0; i < data.length; i++) {
            $('#solicita').append('<option value="' + data[i]['id'] + '">' + data[i]['username'] + '</option>');
            $('#recibe').append('<option value="' + data[i]['id'] + '">' + data[i]['username'] + '</option>');
            $('#copia').append('<option value="' + data[i]['id'] + '">' + data[i]['username'] + '</option>');
        }

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


// get ticket
function getTicket(){

    var settings = {
        "async": true,
        "crossDomain": true,
        "url": config.app.core_path + "ticket/getTicketById?key="+ key_producto +"&token="+ getStorage("token", false) +"&id="+ id_ticket_gestion,
        "method": "GET",
        "headers": {
            "Content-Type": "application/json"
        }
    }
    
    $.ajax(settings).done(function (response) {
        console.log(response.data[0]);
        ticket = response.data[0];
        categoria = ticket.category;
        $("#eliminarTicket").append('Eliminar '+ categoria)
    
        $('#tittle').html("Gestionar "+ categoria);
        $('#solicita').val(ticket.id_user_created);
        $('#recibe').val()
        $('#copia').val(ticket.id_user_cc);
        $('#nombre_ticket').val(ticket.name);
        $('#producto').val(ticket.id_product);
        $('#tipo').val(ticket.type);
        $('#prioridad').val(ticket.priority);
        $('#desc').html(ticket.des);

     

    
    })
}



$("#eliminarTicket").click(function(){ 
    swal({
        title: "¿Esta seguro?",
        text: "Sólo puede eliminar este ticket, si cuenta con los permisos requeridos!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, no eliminar!",
        closeOnConfirm: false,
        closeOnCancel: false
      },
      function(isConfirm){
        if (isConfirm) {
         
            swal("Imposible", "No podemos eliminar este ticket consulta los detalles con tu supervisor", "error");
        } else {
              swal("Cancelado", "El ticket no se ha eliminado :)", "error");
        }
      });
});

$("#ingresarGestion").click(function(){ 
    $('#pnl_gestionar').show()
    $("#ingresarGestion").hide()
});

function cancelarGestion(){
    $('#pnl_gestionar').hide();
    $("#ingresarGestion").show()
}

function guardarGestion(){
    user = getStorage('userdata', true)
    id_actual = user.id
    if(validarGestion()){
    
     var settings = {
    "async": true,
    "crossDomain": true,
    "url":  config.app.core_path + "router/set/data",
    "method": "POST",
    "headers": {
        "Content-Type": "application/json"
    },
    "processData": false,
    "data": JSON.stringify({
        key: key_producto,
        query : "newLogTicket",
        id_ticket: id_ticket_gestion,
        id_user: id_actual,
        time: $('#tiempo').val(),
        desc: $('#nueva_gestion').val()
    }
    )

}
$.ajax(settings).done(function (response) {
    
    
    swal("¡Bien hecho!", response.message, "success")
    obtenerContenido(19)
    

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

}


function validarGestion(){
    if($('#tiempo').val()== "0"){
        toastr.warning('Debe seleccionar el tiempo de gestión');
        return false;
    }
    if($('#nueva_gestion').val()== ""){
        toastr.warning('Debe ingresar sus gestión');
        return false;
    }

    return true
}



