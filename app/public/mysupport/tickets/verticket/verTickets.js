$(document).ready(function(){

    user = getStorage('userdata', true)
    key_producto ='13ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H'

    $.fn.dataTable.ext.errMode = 'throw';
    "use strict"; // Start of use strict
    $('#tickets').DataTable({

        "ajax": {
            "url": config.app.core_path + "ticket/getTickets?key="+ key_producto +"&user_id=" + user[0].id + "&status="+sessionStorage.getItem("ticket_status"),
            "type": "GET"
        },
        "columns": [
            { "data": "code", "title": "CÓDIGO" },
            { "data": "name", "title": "NOMBRE" },
            { "data": "category", "title": "CATEGORIA" },
            { "data": "type", "title": "TIPO" },
            { "data": "priority", "title": "PRIORIDAD" },
            { "data": "resolve_at", "title": "RESOLVER" },
            {
                "data": "", "title": "ACCIÓN",
                "targets": -1,
                "defaultContent": '<button type="button" onclick="seleccionar(this)" class="btn btn-primary w-md m-b-5">Seleccionar</button>'
            }],

        "language": {

            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"

        }
            


    },

);



});

// ,  para reportes
        
//                 dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
//                 "lengthMenu": [[10, 25, 50, -1], [10, 25, 55, "All"]],
//                 buttons: [
//                     {extend: 'copy', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'},
//                     {extend: 'csv', title: 'tickets', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'},
//                     {extend: 'excel', title: 'tickets', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'},
//                     {extend: 'pdf', title: 'tickets', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'},
//                     {extend: 'print', className: 'btn btn-sm btn-primary btn-outline btn-rounded w-md m-b-5'}
//                 ]




var seleccionar = function(button){
  
     t_pr = $('#tickets').DataTable();
     tr = $(button).closest("tr");
     data = t_pr.row(tr).data();
     x = data.id
     
    sessionStorage.setItem("id_ticket_gestion", x);
     obtenerContenido(19)
    
    
}




