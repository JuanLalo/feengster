$(document).ready(function () {


})


function smartRequestNew(request, callBack) {
  $.ajax({
    url: config.app.core_path + '/new/smart/request',
    data: request,
    type: 'POST',
    dataType: 'json',
    success: function (data) {
      callBack(200, data)
    },
    error: function (data) {
      callBack(data.status, data)
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

function smartRequestChange(request, callBack) {
  $.ajax({
    url: config.app.core_path + '/update/smart/request',
    data: request,
    type: 'POST',
    dataType: 'json',
    success: function (data) {
      callBack(200, data)
    },
    error: function (data) {
      callBack(data.status, data)
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

function smartRequestGet(request, callBack) {
  $.ajax({
    url: config.app.core_path + '/get/smart/request',
    data: request,
    type: "GET",
    dataType: "json",
    success: function (data) {
      callBack(200, data)
    },
    error: function (data) {
      callBack(data.status, data)
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