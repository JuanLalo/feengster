/**
 @author Feengster
   Main Feengster Lib
 
 
                         Copyright (c) 2018 Feengster
      Code written and tested by Feengster, its distribution or modification is prohibited.
      Each and every one of the functions are the property of this software. 
      It will be subject to legal proceedings for non-compliance.
      If you want to know more about legal protection or make contact visit the following link.
                       www.feengster.com/?legal

 **/

//#region 

// ver lo de Jade

(function () {
  "use strict"
  var signature = '\n Copyright (c) 2018 Feengster Framework. Todos los derechos reservados.\n'

  var run = function () {
    
    //#region [PRIVATE]
    var _app = {
      inf: {
        id: undefined,
        name: undefined,
        logo: undefined,
        key: undefined
      },

      static: {
        files_path: 'http://localhost:82/feengster/api/public/',
        main_url: 'inicio.html',
        login_url: '../',
        url_lock: ''
      }
    }

    var _user = {
      username: undefined,
      password: undefined,
      name: undefined,
      surnames: undefined,
      email: undefined,
      photo: undefined,
      permission: undefined, // root, developer, tester, admin, agent, customer

    }

    var _session = {
      token: undefined,
      status: 'non-existent', //non-existent, active, lock
      type: 'development', // development, demo, work
      dateLastStatus: null
    }

    var _router = {

    }
    var _forms = {

    }

    var _notify = {

    }
    //#endregion
                                      
    //#region [SESSION CONFIGURATION]
    var session = {

      login: function () {
        // TODO tomar datos de usuario para solicitar login
        var data = 
                  {
                    user: _user.username,
                    pass: _user.password
                  }
        //make login whith data ----> send to _api.sendRequest(data)  
        _session.dateLastStatus = ''
        _session.token = 'XXXXXXXXXXXXX'  
        _session.type =  'development'   
        _session.status = 'active'

        this.saveSession(false)          

        return true
      },

      realoadSession: function()
      {
        if(this.isLocal())
        {
          _session = JSON.parse(localStorage.getItem('_FG_SESSION_'))
        }
        else
        {
          _session = JSON.parse(sessionStorage.getItem('_FG_SESSION_'))
        }
      },

      saveSession: function (local) { // Se ejecuta solo cuando el usuario inicia session 
        if(local)
        {
         localStorage.setItem( '_FG_SESSION_' ,JSON.stringify(_session))
        }
        else
        {
         sessionStorage.setItem( '_FG_SESSION_' ,JSON.stringify(_session))
        }
      },

      updateSession: function()
      {
        if(this.isLocal())
        {
          this.saveSession(true)
        }
        else
        {
          this.saveSession(false)
        }
      },
     
      status: function () {
        return _session.status
      },
      
      authenticated: function () {
        if (_session.status == 'active') {
          return true
        } else {
          return false
        }
      },

      logout: function () {
        toastr.warning('Cerrando sesión...')
        setTimeout(function () {
            localStorage.clear();
            window.location.href = _app.static.login_urls
          },
          1000)
      },

      close: function()
      {
        this.$f = undefined
        localStorage.clear();
        window.location.href = _app.static.login_url
      },

      getToken: function () {
        return _session.token
      },

      lock: function () {
        // TODO tomar datos de sessión para realizar el bloqueo
        if(this.authenticated())
        {
        _session.status = 'lock'
        _session.dateLastStatus = '' // colocar fecha actual.
        //window.location.href = _session.url_lock
        console.log('aqui debe redirigir a pantalla de bloqueo')
        this.updateSession()
        return true
        }
        else
        {
          this.close()
        }
      },

      unlock: function (pass) {
        // TODO tomar estatus de sessión para desbloquear la sessión
        if(this.status() == 'lock')
        {
        _user.password = pass
        this.login()
        }
        else
        {
          this.close()
        }
      },

      isLocal: function()
      {
        if(localStorage.getItem('_FG_SESSION_') !== null && sessionStorage.getItem('_FG_SESSION_') == null)
        {
          return true
        }
        else if (localStorage.getItem('_FG_SESSION_') == null && sessionStorage.getItem('_FG_SESSION_') !== null)
        {
          return false
        }
        else
        {
          this.close()
        }
      }

    }

    //#endregion

    //#region [API CONTROLLER]
    var api = {
      // TODO
    }
    //#endregion

    //#region [ROUTER CONTROLLER]
    var router = {
      // TODO
    }
    //#endregion

    //#region [FORMS CONTROLLER]
    var forms = {
      // TODO
    }
    //#endregion

    //#region [NOTIFICATIONS TROLLERTION]
    var notify = {
      // TODO

    }
    //#endregion

    //#region  [MAIN CONTROLLER]
    var app = {
      getConfig: function () {
        return _app
      },

      initialize: function (id) {
        try {
          var data = {} // TODO obtener por medio del ID de la aplicación la información de DATA
          var newConfig = {
            id: data.id,
            name: data.name,
            logo: data.logo,
            key: data.key
          }
          _app.inf = newConfig
          console.warn(signature + 'Configurado para [' + _app.inf.name + ']')


        } catch (error) {
          console.error(signature + 'Configuración no valia. \n objeto no valido ::', this.data)
        }
      }

    }
    //#endregion

    var $feengster = {
      //object router
      app: app,
      api: api,
      router: router,
      session: session,
      forms: forms,
      notify: notify

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

//#endregion