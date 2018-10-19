/*
    @author Feengster
      Main Feengster Lab

                            Copyright (c) 2018 Feengster
         Code written and tested by Feengster, its distribution or modification is prohibited.
         Each and every one of the functions are the property of this software. 
         It will be subject to legal proceedings for non-compliance.
         If you want to know more about legal protection or make contact visit the following link.
                           www.feengster.com/?legal

    Name: Feengster Lab
    Version: 1.0
    last date: 10/12/2018
    type: testing
*/


(function () {
    "use strict"
    const signature = '\n Copyright (c) 2018 Feengster Framework. Todos los derechos reservados.\n'

    const run = function(){
        const _user =
            {
                user: undefined,
                pass: undefined,
                type: undefined
            },

            _app = 
                {
                    key : 'WER5serJHADFSJKrwer48ybteertetrw892348UKUJBewweSDFSbvnka454'
                }
           
          let _session = {
                token: '1',
                status: 'non-existent', //non-existent, active, lock
                type: 'development', // development, demo, work
                dateLastStatus: undefined
            }

        const user = 
            {
              setUser: function (user, pass) {
                _user.user = user
                _user.pass = pass
            },

            setLoginMethod: function(type){
                _user.type = type
            },
           
            getUser: function (){
                    return _user.user
            }
        },
        session = 
            {
                authenticated: function () {
                    if (_session.status == 'active') {
                      return true
                    } else {
                      return false
                    }
                  },   

            login: function () {
                $.ajax({
                url: 'http://localhost:82/feengster/api/public/login',
                data: {
                     key: _app.key,
                     user: _user.user,
                     password: _user.pass,
                     type: _user.type
                   },
                type: 'POST',
                dataType: 'json',
             success: function (data) {
                 console.log(data)
                if (data.status == 'empty') {
                    toastr.warning(data.message, 'Inaccesible' )  
                    $('.btn_login').html('<i class="fa fa-circle-o-notch "></i> Iniciar Sesión')
                    $('.btn_login').prop('disabled', false); 

                } else if (data.status == 'success') {
                        
                        _session.dateLastStatus = data.data.fecha[0]['now()']
                        _session.token = data.data.token
                        _session.type = 'development'
                        _session.status = 'active'
                        
                        if ($('#checkbox3').prop('checked')) {
                            
                            localStorage.setItem('_FG_SESSION_', JSON.stringify(_session))

                        } else {
                            
                            sessionStorage.setItem('_FG_SESSION_', JSON.stringify(_session))
                        
                        }
                      
                         window.location.href =  data.data.app_url;  

                    }
        
                },
                error: function (data) {
                    $('.btn_login').html('<i class="fa fa-circle-o-notch "></i> Iniciar Sesión')
                    $('.btn_login').prop('disabled', false);  
                    console.log(data)
                    app.ajaxStatusCode(data)
                     }                    
                    })
                 }
            },
            app = {
                initialize : function() {
                    
                    if (localStorage.getItem('_FG_SESSION_') !== null && sessionStorage.getItem('_FG_SESSION_') == null)
                     {
                         _session = JSON.parse(localStorage.getItem('_FG_SESSION_'))
                     } else if (localStorage.getItem('_FG_SESSION_') == null && sessionStorage.getItem('_FG_SESSION_') !== null) 
                     {
                        _session = JSON.parse(sessionStorage.getItem('_FG_SESSION_'))
                     }
                  
                    if (_session.status == 'active') {
                          window.location.href = 'main/'
                       } else {
                        setTimeout(function () {
                            $('#loader').show()
                            $('#loading').hide()
                            }, 1500)
                       }
                      
                },
                
                ajaxStatusCode: function (data) {
        
                    if (data.responseJSON) {
                      toastr.error(data.statusText + ' (' + data.status + ') ', data.responseJSON.message);
            
                    } else {
                      if (data.status == 205) {
                        toastr.error('No hemos encontrado resultados para tu solicitud', '');
            
                        toastr.error()
                      } else if (data.status == 405) {
            
                        toastr.warning('Ruta de WS no encontrada', ' Estatus: ' + data.status)
            
                      } else if (data.status == 205) {
                        toastr.error('Error al conectar al servidor ' , data.status)
            
                      } else {
                        toastr.error('Error al conectar al servidor ' ,  data.status)
            
                      }
                    }
                  }
            }
        
        var $feengster = {
            session : session,
            user: user,
            app : app
        }

        return $feengster
    }

 if (typeof window.$f === 'undefined') {
       console.log(signature + '[Loaded]')
       window.$feengster = window.$f = run()
   } else {
      console.warn(signature + 'Loaded again')
  }
    
})(window)

/**
 *  
 * Se inicia la aplicación  
 * */

$f.app.initialize()



$('.btn_login').click(function(){

    $('.btn_login').html('<i class="fa fa-circle-o-notch fa-spin"></i>  Cargando...')
    $('.btn_login').prop('disabled', true)
    let user = $('#username').val().trim()
    let pass = $('#pass').val().trim()
    let type = undefined

    $f.user.setUser(user, pass)

    if($.isNumeric($f.user.getUser()))
    {
        // #TODO validar que sea un número valido 
        type = 'phone'
    }else if(isEmail())
    {
             // #TODO validar que sea un emial valido 
        type = 'email'
    }
        else
    {
        // #TODO validar el nombre de usuario
        type = 'username'
    }

    $f.user.setLoginMethod(type)
    $f.session.login('j85pdf788mbt6yhp8ñpn89385jybfds89pp234jmknsfdpouuybg7iy895pi')
})

 var login =  function (app)
 {
    $('.btn_login').html('<i class="fa fa-circle-o-notch fa-spin"></i>  Cargando...')
    $('.btn_login').prop('disabled', true);

    sendloginRequest($('#username').val(), $('#pass').val(), app, false)

}


function isEmail() 
{
 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($f.user.getUser()))
  {
    return (true)
  }

   return (false)
}