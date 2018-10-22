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
  const signature = '\n Copyright (c) 2018 Feengster Framework. Todos los derechos reservados.\n'

  const run = function () {

    //#region [PRIVATE]
    const _app = {
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

    const _user = {
      birthdate:    undefined,
      created_at:   undefined,
      email:        undefined,
      id:           undefined,
      img:          _app.static.files_path + 'assets/dist/img/perfil.png',
      name:         '',
      oldpassword:  undefined,
      password:     undefined,
      phone:        undefined,
      platform:     undefined,
      status:       undefined,
      surnames:     undefined,
      updated_at:   undefined,
      username:     undefined,

    }

    let _session = {
      token: '1',
      status: 'non-existent', //non-existent, active, lock
      type: 'development', // development, demo, work
      dateLastStatus: null
    }

    const _router = {
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
    const _forms = {

    }

    const _notify = {

    }
    //#endregion

    //#region [SESSION CONFIGURATION]
    const session = {
      getSessionInformation: function () {
        return _session
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
            localStorage.clear()
            sessionStorage.clear()
            window.location.href = _app.static.login_url
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


    //#region [API CONTROLLER]r
    const api = {
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
            if(error == undefined){
                api.ajaxStatusCode(data)
            }else{
               error(data)
            }

          }
        })
      },

      getDataCallBack: function (code, data) {
        //TODO
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
          
          if (data.status == 401) {
            session.logout()
          }
            else
          {
          toastr.error(data.statusText + ' (' + data.status + ') ', data.responseJSON.message);
          }
        } else {
          if (data.status == 205) {
            toastr.error('No hemos encontrado resultados para tu solicitud', '');

            toastr.error()
          } else if (data.status == 405) {

            toastr.warning('Ruta de WS no encontrada', ' Estatus: ' + data.status)

          }  
          else if (data.status == 205) {
            toastr.error('Error al conectar al servidor ' , data.status)

          } else {
            toastr.error('Error al conectar al servidor ' ,  data.status)

          }
        }
      }

    }
    //#endregion

    //#region [USER CONTROLLER]
    const user = {

      getUserInformationFromApi: function(callBack)
      {
        api.getData('/user/getUserInformation',
            null,  
            function(data){
              data = data.data
              _user.birthdate =   data.birthdate
              _user.created_at =  data.created_at
              _user.email =       data.email
              _user.id =          data.id
              if(data.img != '' && data.img.length > 90)
              {
                _user.img =       data.img
              }
              _user.name =        data.name
              _user.oldpassword = data.oldpassword
              _user.password =    data.password
              _user.phone =       data.phone
              _user. platform =   data.platform
              _user.status =      data.status
              _user.surnames =    data.surnames
              _user.updated_at =  data.updated_at
              _user.username =    data.username
              callBack()
            }
            , 
            undefined
          )
      },

      getUser: function () {

        return _user
      },

      getUserId: function()
      {
        return _user.id_user
      }
    }
    //#endregion

    //#region [ROUTER CONTROLLER]
    const router = {

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
    const forms = {
      // TODO
    }
    //#endregion

    //#region [NOTIFICATIONS TROLLERTION]
    const notify = {
      // TODO

    }
    //#endregion

    //#region  [MAIN CONTROLLER]
    const app = {
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

          if (localStorage.getItem('_FG_SESSION_') !== null && sessionStorage.getItem('_FG_SESSION_') == null)
          {
              _session = JSON.parse(localStorage.getItem('_FG_SESSION_'))

          }
           else if (localStorage.getItem('_FG_SESSION_') == null && sessionStorage.getItem('_FG_SESSION_') !== null) 
          {
             _session = JSON.parse(sessionStorage.getItem('_FG_SESSION_'))
          }
          else
          {
            window.location.href = '../'
          }
       
         if (_session.status == 'active') {
            
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
          if(appData.key == undefined)
          {
            _app.inf.key = 'Buscar key...'
        
          }
          // Obtenemos información de usario, verfificar si aquí es la major opción para su implementación
          console.warn(signature + ' configurado para [' + _app.inf.name + ']')
          callBack()
            
          }
        } catch (error) {
          console.error(signature, error, 'Configuración no valia. \n objeto no valido ::', this.data)
        }
      }

    }
    //#endregion

    const $feengster = {
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