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


(function () {
  "use strict"
  var signature = 'Copyright (c) 2018 Feengster Framework \n'

  var run = function () {
    var conf = {
        id: 0,
        name: 'Feengster App',
        logo: '',
        key: '',
        files_path: 'http://localhost:82/feengster/api/public/',
        main_url: 'inicio.html',
        login_url: '../',
        theme: ''
      },

      api = {},
      session = {},
      user = {},
      router = {},
      forms = {},
      notify = {},

      framework = {
          getConfig: function () {
            return conf;          
          },
 
          Config: function(data)
          {
            if(typeof data === 'undefined' || data == null){
              console.error(signature + 'Datos de configuración no validos')
            }
            else
            {
              this.newConfig = {
                id: data.id,
                name: data.name,
                logo: data.logo,
                key: data.key,
                files_path: data.files_path,
                main_url: data.main_url,
                login_url: data.login_url,
                theme: data.theme
              }
  
              conf = this.newConfig
              console.warn(signature + 'Configurado para [' + conf.name + ']')
            }
            
          },
          
      }



    return framework
  }

  if (typeof window.$f === 'undefined') {
    console.log(signature + '[Loaded]')
    window.feengster = window.$f = run()
  } else {
    console.warn(signature + 'Loaded again')
  }



})(window, document)