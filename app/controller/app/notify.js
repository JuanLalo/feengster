
function sendNotification_(data) {
    if(typeof user === 'undefined')
    {
        to = 'all'
    }
    else
    {
        to = user[0].id
    }

    firebase.database().ref(config.app.name + "/notification/" + to + "/" + data.id).set({
        id: data.id,
        titulo: data.titulo,
        desc: data.desc,
        url: data.url,
        img: data.img,
        estatus: data.estatus,
        global: data.global
    })
}



function getNotifications()
 {
    var notifyRef = firebase.database().ref(config.app.name + "/notification/" + user[0].id)
    notifyRef.on('value', function (data) {
        if(data.val() != null)
        {
        printNotification(data.val())
        console.log('Notificaciones: ', data.val())
        }
        else
        {
            html = `<li class="rad-dropmenu-header"><a>Notificaciones</a></li>` 
            html += `<li class="rad-dropmenu-header"><br><br><br><center>Sin notificaciones</center><br><br><br></li>` 
            $('#notifications').html(html)
        }
    })
}

function printNotification(data) {
    html = '<li class="rad-dropmenu-header"><a>Notificaciones</a></li>'
    data.forEach(element => {
        html += `<li>
        <a class="rad-content" href="#">
            <div class="pull-left"><i class="fa ${element.img} fa-2x color-red"></i>
            </div>
            <div class="rad-notification-body">
                <div class="lg-text">${element.titulo}</div>
                <div class="sm-text">${element.desc}</div>
            </div>
        </a>
    </li>`

    if(element.estatus == 0)
    {
        effectNotification(element)
    }
    })

    
        html += '<li class="rad-dropmenu-footer"><a href="#">Ver todas</a></li>'
    


    $('#notifications').html(html)

}



function effectNotification(data) 
{
        setTimeout(function () {
            var notification = new NotificationFx({
                message: `<div class="ns-thumb"><center><i class="fa ${data.img} fa-2x color-red"></i></center>
                </div><div class="ns-content"><p><a href="${data.url}">${data.titulo}</a>${data.desc}</p></div>`,
                layout: 'other',
                ttl: 6000,
                effect: 'thumbslider',
                type: 'notice', // notice, warning, error or success
                onClose: function () {
                }
            });
            // show the notification
            notification.show();
        }, 1200)

}
