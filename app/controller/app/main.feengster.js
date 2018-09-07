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
  var signature = '\n [Copyright (c) 2018 Feengster Framework] \n'

  var run = function () {
    var config = {
      id: '98hjk2348yhkjjhd8y32hjklh7isdfhhjh',
      name: 'Cargando...',
      logo: '',
      key: 'sd0mwer78fyhjfsd78jsdf3278ghsdfjt',
      files_path: 'http://localhost:82/feengster/api/public/',
      main_url: 'inicio.html',
      login_url: '../',
      theme: ''
    }


    //#region [SESSION CONFIGURATION]
    var session = {
      // TODO

        authenticated: function ()
        {
          if (localStorage.getItem("token") === null && sessionStorage.getItem("token") === null) 
           {
            return false
           }
           else
           {
             return true
           }
        },

        logout: function()
        {
         toastr.warning('Cerrando sesión...')  
         setTimeout(function () 
           {
             sessionStorage.clear();
             localStorage.clear();
             window.location.href = config.login_url
             },
           1000)
        },

        getToken: function ()
        {
          if (this.isLocal()) 
          {
             return localStorage.getItem("token") 
          }
          else
          {
            return sessionStorage.getItem("token")
          }

        },

        saveStorage: function (name, value, isJson) {
           try {

             if (isJson) {
                   value = JSON.stringify(value)
             }
             if (this.isLocal()) {
               localStorage.setItem(name, value)
             } else {
               sessionStorage.setItem(name, value)
             }

           } catch (e) {
             return false
           }
         },

        isLocal: function()
         {
          if (localStorage.getItem("token") !== null && sessionStorage.getItem("token") === null) 
          {
              return true;
          } else if (localStorage.getItem("token") === null && sessionStorage.getItem("token") !== null) 
          {
              return false;
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
        return config;
      },

      initialize: function (data) {
        try {

              var newConfig = 
              {
              id: data.id,
              name: data.name,
              logo: data.logo,
              key: data.key,
              files_path: data.files_path,
              main_url: data.main_url,
              login_url: data.login_url,
              theme: data.theme
              }
              config = newConfig
            console.warn(signature + 'Configurado para [' + conf.name + ']')
          

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


