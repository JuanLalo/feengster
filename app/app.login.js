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
    var signature = '\n Copyright (c) 2018 Feengster Framework. Todos los derechos reservados.\n'

    var run = function(){
        var _user =
            {
                user: undefined,
                pass: undefined
            },
           
            _session = {
                token: '1',
                status: 'non-existent', //non-existent, active, lock
                type: 'development', // development, demo, work
                dateLastStatus: undefined
            }

        var user = 
            {
              setUser: function (user, pass) {
                _user.user = user
                _user.pass = pass
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
                key: 'WER5serJHADFSJKrwer48ybteertetrw892348UKUJBewweSDFSbvnka454',
                user: _user.user,
                password: _user.pass
                },
                type: 'POST',
                dataType: 'json',
             success: function (data) {
                 console.log(data)
                if (data.status == 'empty') {
                    ifempty(data)
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
                      
                         window.location.href = 'main/'   

                    }
        
                },
                error: function (data) {
                    // $('.btn_login').html('<i class="fa fa-circle-o-notch "></i> Iniciar Sesión')
                    // $('.btn_login').prop('disabled', false);  
                        console.log(data)
            
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
    
    $f.user.setUser($('#username').val(), $('#pass').val())
    $f.session.login('j85pdf788mbt6yhp8ñpn89385jybfds89pp234jmknsfdpouuybg7iy895pi')
})

 var login =  function (app)
 {
    $('.btn_login').html('<i class="fa fa-circle-o-notch fa-spin"></i>  Cargando...')
    $('.btn_login').prop('disabled', true);

    sendloginRequest($('#username').val(), $('#pass').val(), app, false)

}

