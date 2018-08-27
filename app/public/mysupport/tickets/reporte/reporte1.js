$(document).ready(function(){
    
    key_producto ='13ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H'

    $.fn.dataTable.ext.errMode = 'throw';

    if(sessionStorage.getItem("ticket_status") == "ultimaSemana"){
        ultimaSemana()
    }
    
    if(sessionStorage.getItem("ticket_status") == "coladeTrabajo"){
        coladeTrabajo()
    }


});


function coladeTrabajo(){

    "use strict"; // Start of use strict
    $('#reporte').DataTable({

        "ajax": {
            "url": config.app.core_path + "router/get/data?key="+ key_producto +"&query="+ sessionStorage.getItem("ticket_status"),
            "type": "GET"
        },
        "columns": [
            { "data": "CANTIDAD", "title": "CANTIDAD" },
            { "data": "RECIBE", "title": "RECIBE" },
            { "data": "SOLICITA", "title": "SOLICITA" },
            { "data": "created_at", "title": "FECHA SOLICITUD" },
            { "data": "resolve_at", "title": "FECHA DE RESOLUCIÓN" },
            { "data": "status", "title": "ESTATUS" },
            { "data": "TIPO", "title": "TIPO" },
            { "data": "CATEGORIA", "title": "CATEGORIA" }           

            
            ],

        "language": {

            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"

        }
            ,  
        
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

}

function ultimaSemana(){
    "use strict"; // Start of use strict
    $('#reporte').DataTable({

        "ajax": {
            "url": config.app.core_path + "router/get/data?key="+ getStorage('key', false) +"&query="+ sessionStorage.getItem("ticket_status"),
            "type": "GET"
        },
        "columns": [
            { "data": "code", "title": "CÓDIGO" },
            { "data": "SOLICITA", "title": "SOLICITA" },
            { "data": "RECIBE", "title": "RECIBE" },
            { "data": "COPIA", "title": "COPIA" },
            { "data": "created_at", "title": "FECHA SOLICITUD" },
            { "data": "resolve_at", "title": "FECHA DE RESOLUCIÓN" },
            { "data": "status", "title": "ESTATUS" },
            { "data": "TIPO", "title": "TIPO" },
            { "data": "CATEGORIA", "title": "CATEGORIA" }           

            
            ],

        "language": {

            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"

        }
            ,  
        
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

}






