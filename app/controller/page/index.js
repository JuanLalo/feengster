$(document).ready(function () {
    
    //    getNotifications()
    setTimeout(function () {
    $('#preloader').show()
    $('#loading').hide()
    }, 1500)

});


function welcome()
{
    //#pendiente
    // automatizar las notificaciones para que se manden automaticamente

            setTimeout(function () {
                data = [{
                        desc:'Primer mes gratis al suscribirte en cualquiera de nuestros productos',
                        estatus:0,
                        id:-1,
                        img:"fa-bullhorn",
                        titulo:"¡Promoción!",
                        url:""
                    }]
                    sendNotification_(data)
            }, 4000)


            setTimeout(function () {
                data = [  {
                        desc:'De 10% a 20 de descuento al promocionar alguno de nustros porductos',
                        estatus:0,
                        id:-1,
                        img:"fa-bomb",
                        titulo:"¡Descuentos!",
                        url:""
                    }]
                printNotification(data)
            }, 30000)
            

   
    
}

