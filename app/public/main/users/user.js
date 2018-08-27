
$(document).ready(function() {  
    
    userData =getStorage('userdata', true)
    


    $.fn.dataTable.ext.errMode = 'throw';
obtenerUsuarios();

if(sessionStorage.getItem("idUserType") == 1){
    $('#type_default').val('ADMINISTRADOR')
    $('#tipo').html('Gestionar Administradores')
    tipo
}else if(sessionStorage.getItem("idUserType") == 2){
    $('#type_default').val('SUPERVISOR')
    $('#tipo').html('Gestionar Supervisores')
}else if(sessionStorage.getItem("idUserType") == 3){
    $('#type_default').val('GESTOR')
    $('#tipo').html('Gestionar Gestores')
}else{
    $('#type_default').val('CLIENTE')
    $('#tipo').html('Gestionar Clientes')
}

} );


 
$('#usuarios tbody').on('click', 'tr', function () {
    var table = $('#usuarios').DataTable();
    var data = table.row( this ).data();
    toastr.info('Ahora puede editar las credenciales de ' + data['username'] );
     $('#username').val(data['username']),
     $('#email').val(data['email']),
     $('#password').val('')
     $('#limpiar').hide()
     $('#u_guargar').hide()
     $('#u_no_hacer_n').show()
     $('#u_eliminar').show()
     $('#u_actualizar').show()
     sessionStorage.setItem('userToUpdate', data['id'])
     
     
     

} );

$('#u_no_hacer_n').click( function(){  
    
    $('#limpiar').click()
    $('#limpiar').show()
    $('#u_guargar').show()
    $('#u_no_hacer_n').hide()
    $('#u_eliminar').hide()
    $('#u_actualizar').hide()
});

$('#u_eliminar').click( function(){  
swal({
    title: "¿Estas seguro?",
    text: "Si el usuario tiene tareas pendientes no se podrá eliminar!",
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
        eliminarUsuario()
      
    $('#u_no_hacer_n').click()
    
    $("#usuarios").dataTable().fnDestroy();
    obtenerUsuarios();

    } else {
          swal("Cancelado", "Datos rescatados de forma segura :)", "error");
    }
  });
});

$('#u_actualizar').click( function(){  
    if(validarUsuario()){

        $.ajax({
            url : config.app.core_path + "router/set/data",
            data :{    
                key: getStorage('key', false),
                username:$('#username').val(),
                email: $('#email').val(),
                password: $('#password').val(),
                id: sessionStorage.getItem('userToUpdate'),
                query : "newUser"
                },
            type : 'POST',
            dataType : 'json',
    
            success : function(response) {
                
    swal("¡Bien hecho!", "Actualizado con éxito", "success")
    $('#u_no_hacer_n').click()
    $("#usuarios").dataTable().fnDestroy();
    obtenerUsuarios();
          
            },
            error : function(response) {
                ajaxFail(response)
            },
            complate: function (response){
            }
        })  
    }
});

function obtenerUsuarios(){
    "use strict"; // Start of use strict
    $('#usuarios').DataTable({

        "ajax": {
            "url": config.app.core_path + "router/get/data?key="+ getStorage('key', false) +"&query=userByType&company_id="+ userData[0].company_id +"&idUserType="+sessionStorage.getItem("idUserType"),
            "type": "GET"
        },
        "columns": [
            { "data": "id", "title": "ID" },
            { "data": "username", "title": "NOMBRE" },
            { "data": "email", "title": "CORREO" },
            { "data": "date", "title": "FECHA DE REGISTRO" },
            ],

        "language": {

            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"

        }          
    },

);
}

function nuevoUsuario(){

    if(validarUsuario()){
        $.ajax({
            url : config.app.core_path + "user/create",
            data :{    
                key: getStorage('key', false),
            type: sessionStorage.getItem("idUserType"),
            platform: "Web",
            username:$('#username').val(),
            email: $('#email').val(),
            password: $('#password').val()
                },
            type : 'POST',
            dataType : 'json',
    
            success : function(response) {
                $('#limpiar').click()
                swal("¡Bien hecho!", response.message, "success")
                $("#usuarios").dataTable().fnDestroy();
                obtenerUsuarios();
            },
            error : function(response) {
                ajaxFail(response)
            },
            complate: function (response){
            }
        })  
    }

}

function validarUsuario(){
    if($('#username').val() == ""){
        toastr.warning('Nombre de usuario requerido')
        $('#username').focus()
        return false
    }
    if($('#email').val() == ""){
        toastr.warning('Correo electronico requerido')
        return false
    }
    if($('#password').val() == ""){
        toastr.warning('Se requiere una ontraseña para este usuario')
        return false
    }

    return true
}

function eliminarUsuario(){
    id_elim = sessionStorage.getItem('userToUpdate')
    if(user[0].id == id_elim ){
        swal("No autorizado!", "Lo sentimos, no puedes eliminar tu propia cuenta :/", "error");
        return false
    }

    $.ajax({
        url : config.app.core_path + "router/set/data",
        data :{    
            key: getStorage('key', false),
            id: sessionStorage.getItem('userToUpdate'),
            query : "deleteAsUpdate",
            tb: "users"
            },
        type : 'POST',
        dataType : 'json',

        success : function(response) {
            swal("Eliminado!", "Se ha eliminado correctamente.", "success");
        },
        error : function(response) {
            ajaxFail(response)
        },
        complate: function (response){
        }
    })  


}