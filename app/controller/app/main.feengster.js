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
        files_path: '../',
        core_path: 'http://localhost:82/feengster/api/public/',
        main_url: 'localhost:82/feengster/app/lab/?#mainPage',
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
      token: '1',
      status: 'non-existent', //non-existent, active, lock
      type: 'development', // development, demo, work
      dateLastStatus: null
    }

    var _router = {
      current: 
      {
        module: {
          id: undefined,
          nombre: undefined
        },
        menu: {
          id: undefined,
          name: undefined,
          title: undefined,
          desc: undefined,
          url: undefined,
          ico: undefined,
          permission: {}
        },
      },

      menus: {}

    }
    var _forms = {

    }

    var _notify = {

    }
    //#endregion

    //#region [SESSION CONFIGURATION]
    var session = {
      login: function (callBack, msgs = true) {
        api.login(callBack, msgs)
      },

      realoadSession: function () {
        if (this.isLocal()) {
          _session = JSON.parse(localStorage.getItem('_FG_SESSION_'))
        } else {
          _session = JSON.parse(sessionStorage.getItem('_FG_SESSION_'))
        }
      },

      saveSession: function (local) { // Se ejecuta solo cuando el usuario inicia session 
        if (local) {
          localStorage.setItem('_FG_SESSION_', JSON.stringify(_session))
        } else {
          sessionStorage.setItem('_FG_SESSION_', JSON.stringify(_session))
        }
      },

      updateSession: function () {
        if (this.isLocal()) {
          this.saveSession(true)
        } else {
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

      close: function () {
        this.$f = undefined
        localStorage.clear();
        window.location.href = _app.static.login_url
      },

      getToken: function () {
        return _session.token
      },

      lock: function () {
        // TODO tomar datos de sessión para realizar el bloqueo
        if (this.authenticated()) {
          _session.status = 'lock'
          _session.dateLastStatus = '' // colocar fecha actual.
          //window.location.href = _session.url_lock
          console.log('aqui debe redirigir a pantalla de bloqueo')
          this.updateSession()
          return true
        } else {
          this.close()
        }
      },

      unlock: function (pass) {
        // TODO tomar estatus de sessión para desbloquear la sessión
        if (this.status() == 'lock') {
          _user.password = pass
          this.login()
        } else {
          this.close()
        }
      },

      isLocal: function () {
        if (localStorage.getItem('_FG_SESSION_') !== null && sessionStorage.getItem('_FG_SESSION_') == null) {
          return true
        } else if (localStorage.getItem('_FG_SESSION_') == null && sessionStorage.getItem('_FG_SESSION_') !== null) {
          return false
        }
      }

    }

    //#endregion


    //#region [API CONTROLLER]
    var api = {
      getData: function (url, data, success, error) {
        $.ajax({
          url: _app.static.core_path + url,
          data: {
            token: _session.token,
            key: _app.inf.key,
            data: data
          },
          type: "POST",
          dataType: "json",
          success: function (data) {
            success(data)
          },
          error: function (data) {
            error(data)
            api.ajaxStatusCode(data)


          }
        })
      },

      getDataCallBack: function (code, data) {

      },

      setData: function (data) {
        // recibe la key de la tabla, campos y valores.

      },

      changeData: function (data) {
        // recibe la key de la tabla, campos y valores. (id del registro)
      },

      deleteData: function (data) {
        // recibe la key de la tabla, campos y valores. (id del registro)
      },

      ajaxStatusCode: function (data) {
        if (data.responseJSON) {
          toastr.error(data.responseJSON.message + '<br>' + data.statusText + ' (' + data.status + ') ');
        } else {
          if (data.status == 205) {
            toastr.error('No hemos encontrado resultados para tu solicitud')
          } else if (data.status == 405) {

            toastr.warning('Ruta de WS no encontrada. Estatus: ' + data.status)

          } else if (data.status == 205) {
            toastr.error('Error al conectar al servidor ' + data.status)

          } else {
            toastr.error('Error al conectar al servidor ' + data.status)

          }
        }
      },

      login: function (callBack, msgs) {
        $.ajax({
          url: config.app.core_path + "login",
          data: {
            key: _app.inf.key,
            username: _user.username,
            password: _user.password
          },
          type: 'POST',
          dataType: 'json',

          success: function (data) {
            _session.dateLastStatus = data.data.fecha[0]['now()']
            _session.token = data.data.token
            _session.type = 'development'
            _session.status = 'active'
            console.log(data)
            session.saveSession(session.isLocal())
            // callBack(data)
          },
          error: function (data) {
            console.log(data)
            //callBack(data)
            if (msgs) {
              api.ajaxStatusCode(data)
            }
          }
        })
      }

    }
    //#endregion

    //#region [USER CONTROLLER]
    var user = {
      setUser: function (username, password) {
        _user.username = username,
          _user.password = password
      },

      getUser: function () {
        _user.password = 'XXXXXXXXXXXXXX'
        return _user
      }
    }
    //#endregion

    //#region [ROUTER CONTROLLER]
    var router = {

      findMenu: function (callBack) {
        api.getData('router/getMenu', undefined,
          function (data) {
            console.log(data)
            if (data.status == 'empty') {
              toastr.info('Consulte con su provedor, por qué no tiene menú asignado')
            } else if (data.status == 'success') {
              _router.menus = data.data
              callBack(_router.menus)
            }
          },
          function (data) {
            console.log('error ->', data)
          }
        )
      },

      getMenu: function () {
        return _router.menus
      },

      getCurrentMenu: function () {
        return _router.current
      },

      findMenuContent: function (id, success, error) {
        api.getData('router/getContent',
        {
           id_menu: id
        },
        function (data) {
            console.log(data)
            if (data.status == 'empty') {
              toastr.info('Consulte con su provedor, por qué no tiene menú asignado')
            } else if (data.status == 'success') {
              var menu = data.data[0]
              _router.current.menu.id = id
              _router.current.menu.name = menu.name
              _router.current.menu.title = menu.title
              _router.current.menu.desc = menu.title_desc
              _router.current.menu.url = menu.url
              _router.current.menu.ico = menu.icon
              _router.current.module.name = menu.m_name
              _router.current.module.id = menu.m_id
                          
              success(_router.current)
            }
        },

        function (data) {
          error(data)
            console.log('error ->', data)
          }
        )
      },

      setIdMenu: function(id){
        if(Number(id)){
          _router.current.menu.id = id
          return true
        }  
      }
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
      getAppId: function () {
        return _app.inf.id
      },
      getFilesPath: function () {
        return _app.static.files_path
      },

      initialize: function (appData, mainPage, callBack) {
        try {

          _app.inf = appData
          _router.current.menu.id = mainPage.id
          _router.current.menu.name = mainPage.name
          _router.current.menu.title = mainPage.title
          _router.current.menu.desc = mainPage.desc
          _router.current.menu.url = mainPage.url
          _router.current.menu.ico = mainPage.icon
          _router.current.module.name = mainPage.m_name
          _router.current.module.id = mainPage.m_id

          document.title = 'Feengster ' + _app.inf.name

          // hacer un getData para verificar si este usuario tiene un key para esta app
          //en este punto el usuario ya se ha logeado.
          _app.inf.key = 'uyt15sxcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rr87859'
          console.warn(signature + ' configurado para [' + _app.inf.name + ']')
          callBack()

        } catch (error) {
          console.error(signature, error, 'Configuración no valia. \n objeto no valido ::', this.data)
        }
      }

    }
    //#endregion

    var $feengster = {
      //object router
      user: user,
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