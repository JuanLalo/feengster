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
        core_path: '../../api/public/',
        main_url: 'localhost:82/feengster/app/main/',
        login_url: '../',
        url_lock: '',
        device: 'pc',  // mobile | pc
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

      main: {},

      menus: {}

    }

    let _forms = {}

    const _notify = {
      mp3: '',
      
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

      getSmartData: function (data, success, error) {
        $.ajax({
          url: _app.static.core_path + 'get/smart/request',
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

      setData: function (table, data, success, error) {
        $.ajax({
          url: _app.static.core_path + 'new/smart/request',
          data: {
            token: _session.token,
            key: _app.inf.key,
            table_code: table,
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

      setMultipleData: function (data, success, error) {
        $.ajax({
          url: _app.static.core_path + 'newMultiple/smart/request',
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

      changeData: function (table, id, data, success, error) {
        $.ajax({
          url: _app.static.core_path + 'update/smart/request',
          data: {
            token: _session.token,
            key: _app.inf.key,
            table_code: table,
            id: id,
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
      

      deleteData: function (table, id,  success, error) {
        $.ajax({
          url: _app.static.core_path + 'delete/smart/request',
          data: {
            token: _session.token,
            key: _app.inf.key,
            table_code: table,
            id: id
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
      },

      messageByHttpCode: function (data) {
        
        if (data.responseJSON) {

            if(data.status == 409)
            {
              swal(  data.responseJSON.message, data.responseJSON.detail , data.responseJSON.status)
            }
            else if (data.status == 403) {
              alert('BYE')
              session.logout()
            }
            else if (data.status == 401) {
              swal("Error" , "Licencia no activa" , "error")
              session.logout()
            }
            else
          {
            swal("Error" , data.responseJSON.message , "error")
          }

        } else {
          
         if (data.status == 205) {
            swal("Error - " + data.statusText , 'No hemos encontrado resultados para tu solicitud' , "error")
            
          } else if (data.status == 405) {
            swal("Error - " + data.statusText, 'Ruta de WS no encontrada' , "error")
          }  
          else if (data.status == 404) {

            swal("Error - " + data.statusText, 'El servidor no pudo encontrar el contenido solicitado' , "error")

          }else if (data.status == 408) {

              swal("Error - " + data.statusText, 'El tiempo de espera se ha agotado, intentelo más tarde. Por favor.' , "error")
  
          } else {
            swal("Error - " + data.statusText, 'Error al conextar con el servidor' , "error")
  
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
              // #check
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
      getFullName: function () {

        return _user.name + ' ' + _user.surnames 
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

      getMaintMenu: function(){
        return _router.main
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
      add: function(form)
      {
        try {
          
        let size = Object.keys(_forms).length
        _forms[size] = {}

        if(undefined != form.info)
         {
          _forms[size].info = {}  
          _forms[size].info.name = form.info.name
          _forms[size].info.view = form.info.view
          _forms[size].info.parameters = []

          if(undefined != form.info.parameters)
          {
            _forms[size].info.parameters = form.info.parameters
          }else{
            console.log(signature + 'No se especificaron parametros para la vista [' +  form.info.view + ']')
          } 
          
          if(undefined != form.info.table_code)
          {
            _forms[size].info.table_code = form.info.table_code
          }    
         }
         else
         {
          console.error(signature,'\ Se requiere el objeto [info] : \n nombre (id del formulario), \n table_code (código incriptado de la tablo principal donde harán las peticiones insert, update y delete), \n view (view o consulta por default sino se establece un tableData en [tableData]) ') 
          return false
         }

         if(undefined != form.steps)
         {
          _forms[size].steps = form.steps
         }

        _forms[size].rules = form.rules
        _forms[size].columns = form.columns
        _forms[size].tableData = form.tableData
        _forms[size].formData = {}

        if(undefined != form.optionalData)
         {
          _forms[size].optionalData = form.optionalData
         }

        _forms[size].dropdown = form.dropdown
        _forms[size].reports = form.reports

        _forms[size].events =  {
                onEdit: undefined,
                beforeSave:  undefined,
                afterSave: undefined,
                beforeChange: undefined,
                afterChange: undefined,
                onDelete: undefined,
                beforeDelete: undefined,
                afterDelete: undefined,
                onNew: undefined,
        }

        _forms[size].events = form.events
              
        
        if(form.rules.new)
        {
          _forms[size].action = 'new'
        }
        else if(form.rules.change)
        {
          _forms[size].action = 'change'
        }
        else
        {
          _forms[size].action = 'nothing'
        }
        
       

      return size
      
    } catch (error) {
     console.error(
       signature,
       'Error al intentar agragar un nuevo formulario. Detalle:',
       error
       )     
    }
    },

    new: function(data){
      
    try {
      
     let id = this.add(data)
     if(Number.isInteger(id))
     {

      let idForm = ' #' + _forms[id].info.name
      _forms[id].type = 'one'
      forms.html(id)
          
      //#region  Guargar / Actualizar
      
          $(idForm).validator().on("submit", function (e) 
           {
            
           if (e.isDefaultPrevented())
                    {
                      toastr.warning("Al parecer el furmulario no está listo", "Atención" )
         
                  }
                    else
                  {

                    try {
                      
                      // Se toaman los datos del formulario
                      var $this = $(idForm)
                      , formHTML = $this.serializeArray()
                      , formData = {};

                       // add optionalData
                      for(let y in _forms[id].optionalData)
                      {
                        if(_forms[id].optionalData[y].function_)
                        {
                          let newValue = _forms[id].optionalData[y].value() 
                          let optional = {
                                          name: _forms[id].optionalData[y].name, 
                                          value: newValue 
                                        }

                          formHTML.push(optional)
                        }
                        else
                        {
                          let optional = {
                            name: _forms[id].optionalData[y].name, 
                            value: _forms[id].optionalData[y].value,
                          }

                         formHTML.push(optional)
                        }
                       
                      }

                  
                      for (var i in formHTML) {
                        formData[formHTML[i].name] = formHTML[i].value;
                      }
                      
                      delete formData['fg-table_length']

                     if(_forms[id].action == 'new')
                     {
                      let save = true

                      if(_forms[id].events.beforeSave != undefined)
                      {
                       save = _forms[id].events.beforeSave()
                      }
                      if(save){

                        forms.loading('Guardando', 'Espera un momento por favor.')
                        $(idForm +  ' #html-buttons').hide()

                        api.setData(
                                    _forms[id].info.table_code,
                                    formData,
                                    function(data)
                                      {
                                        swal("¡Listo!", "", "success")
                                        notify.sound('success')
                                        $(idForm + ' #btn-form-back').click()
                                        forms.reloadTable(id)

                                        if(_forms[id].events.afterSave != undefined)
                                        {
                                          _forms[id].events.afterSave()
                                        }
                                      },

                                    function(data)
                                       {
                                          api.messageByHttpCode(data)     
                                          $(idForm +  ' #html-buttons').show()
                                
                                      }
                                  )

                      }
                      

                    }
                    else if(_forms[id].action == 'change')
                    {
                      let change = true
                      
                      if(_forms[id].events.beforeChange != undefined)
                      {
                        change = _forms[id].events.beforeChange()
                      }

                      if(change){
                        
                        console.log('Datos para editar ')
                        console.log(_forms[id].formData)
                        

                        let dataToUpdate = {}
                        let wasChange = false
                        let change = false
                        let isOptional = false
                        for(let i in formData)
                        {
                            if(formData[i] != _forms[id].formData[i]) 
                                {
                                  for(let y in _forms[id].optionalData)
                                  {
                                    if( i  == _forms[id].optionalData[y].name ){
                                        isOptional = true
                                    }
                                  }

                                  if(!isOptional)
                                    {
                                      wasChange = true
                                    }
                                  
                                }

                           if(wasChange)
                           {
                             dataToUpdate[i] = formData[i]
                             wasChange = false
                             change= true
                           }
                        }
                        
                        console.log('Datos modificados ' )
                        console.log(dataToUpdate)

                        if(change)
                        {
                          
                          forms.loading('Actualizando', 'Espera un momento por favor.')
                          $(idForm +  ' #html-buttons').hide()

                           api.changeData(
                            _forms[id].info.table_code,
                            _forms[id].formData.id, 
                            dataToUpdate,
                            function(data){
                              
                              notify.sound('success')
                               swal("¡Listo!", "", "success")
                               // #TODO aptimizar. (Actualizar solo el row amodificado). El código de abajo lo hacer, pero surgen errores al encontrarse campos como fecha de modificación 
                               //let table = $(idForm + ' #fg-table').DataTable()
                               //formData['id'] = _forms[id].formData.id
                               //table.row( _forms[id].index ).data( formData).draw()
                               forms.reloadTable(id)
                               $(idForm + ' #btn-form-back').click()
                               
                              },

                              function(data)
                              {
                                api.messageByHttpCode(data)     
                                $(idForm +  ' #html-buttons').show()
                                
                              }
                          )
                        }
                        else
                        {
                          toastr.warning("", "No se detectaron cambios.")
                        }

                      }

                    }

                } catch (error) {
                  console.error(signature + error)   
                }
                    return false

              }
           
          })

      //#endregion validator
       
      
      forms.eventsButtons(id)
          
      console.log('Individual $fg :: ' +  _forms[id].info.name + ' ' + ' Creado correctamente.')
      return id

     }
   
    } catch (error) {

      // #check ver por qué da ese error
      console.log(error)
    }
    },

    newMultiple: function(data, callBack){
      try {
      
        let id = this.add(data)
        if(Number.isInteger(id))
        {
          _forms[id].type = 'multiple'
          forms.html(id)
          forms.eventsButtons(id)

          let idForm = ' #' + _forms[id].info.name


          //#region  Guargar / Actualizar
      
          $(idForm).validator().on("submit", function (e) 
           {
            
           if (e.isDefaultPrevented())
                    {
               notify.sound('warning')
               toastr.warning("Al parecer el furmulario no está listo", "Atención" )
         
                  }
                    else
                  {

                    try {
                      
                      // Se toaman los datos del formulario
                      let formHTML = []
                      let formData = {}
                      for(let s in _forms[id].steps)
                      {
                        let n = Number(s) + Number(1) 
                        let step = ' #step-' + n.toString()
                        let clasStep = idForm + step + ' * '
                        console.log(clasStep)
                        formHTML[s] = $( clasStep ).serializeArray()
                        formData[s] = {}
                      }
                      
                     

                       // add optionalData 

                       for(let od in _forms[id].steps)
                       {

                        for(let y in _forms[id].steps[od].optionalData)
                         {

                          if(_forms[id].steps[od].optionalData[y].function_)
                          {
                            let newValue = _forms[id].steps[od].optionalData[y].value() 
                            let optional = {
                                          name: _forms[id].steps[od].optionalData[y].name, 
                                          value: newValue 
                                        }

                              formHTML[od].push(optional)
                           }
                            else
                          {
                              let optional = {
                              name: _forms[id].steps[od].optionalData[y].name, 
                              value: _forms[id].steps[od].optionalData[y].value,
                          }

                          formHTML[od].push(optional)
                          }
                      }
                    
                  }


                 for(let index in formData)
                  {
                    var detail = { 
                      table_code : _forms[id].steps[index].table_code,
                      fk: _forms[id].steps[index].fk,
                      referenced: _forms[id].steps[index].referenced,
                      data: {}
                  }
                    for(var f in formHTML[index])
                       {
                        detail.data[formHTML[index][f].name] =  formHTML[index][f].value
                       }

                
                   if (_forms[id].action == 'change')
                    {
                      detail.id = 11
                    }

                      formData[index] = detail

                    }

                  delete formData['fg-table_length']
                   

                     if(_forms[id].action == 'new')
                     {
                      let save = true

                      if(_forms[id].events.beforeSave != undefined)
                      {
                       save = _forms[id].events.beforeSave()
                      }
                      if(save){

                        forms.loading('Guardando', 'aqui se manda el multiple')
                        

                        api.setMultipleData(
                                    formData,
                                    function(data)
                                      {
                                        swal("¡Listo!", "", "success")
                                        notify.sound('success')
                                        $(idForm + ' #btn-form-back').click()
                                        forms.reloadTable(id)
                                        console.log(data)
                                        if(_forms[id].events.afterSave != undefined)
                                        {
                                          _forms[id].events.afterSave()
                                        }
                                      },

                                    function(data)
                                       {
                                          api.messageByHttpCode(data)     
                                      }
                                  )

                      }
                      

                    
                     }
                     else if(_forms[id].action == 'change')
                    {
                      let change = true
                      
                      if(_forms[id].events.beforeChange != undefined)
                      {
                        change = _forms[id].events.beforeChange()
                      }

                      if(change){
                        
                        console.log('Datos para editar ')
                        console.log(_forms[id].formData)
                        

                        let dataToUpdate = {}
                        let wasChange = false
                        let change = false
                        let isOptional = false
                        for(let i in formData)
                        {
                            if(formData[i] != _forms[id].formData[i]) 
                                {
                                  for(let y in _forms[id].optionalData)
                                  {
                                    if( i  == _forms[id].optionalData[y].name ){
                                        isOptional = true
                                    }
                                  }

                                  if(!isOptional)
                                    {
                                      wasChange = true
                                    }
                                  
                                }

                           if(wasChange)
                           {
                             dataToUpdate[i] = formData[i]
                             wasChange = false
                             change= true
                           }
                        }
                        
                        console.log('Datos modificados ' )
                        console.log(dataToUpdate)

                        if(change)
                        {
                          
                          forms.loading('Actualizando', 'Espera un momento por favor.')
                          $(idForm +  ' #html-buttons').hide()

                           api.changeData(
                            _forms[id].info.table_code,
                            _forms[id].formData.id, 
                            dataToUpdate,
                            function(data){
                              
                              notify.sound('success')
                               swal("¡Listo!", "", "success")
                               // #TODO aptimizar. (Actualizar solo el row amodificado). El código de abajo lo hacer, pero surgen errores al encontrarse campos como fecha de modificación 
                               //let table = $(idForm + ' #fg-table').DataTable()
                               //formData['id'] = _forms[id].formData.id
                               //table.row( _forms[id].index ).data( formData).draw()
                               forms.reloadTable(id)
                               $(idForm + ' #btn-form-back').click()
                               
                              },

                              function(data)
                              {
                                api.messageByHttpCode(data)     
                                $(idForm +  ' #html-buttons').show()
                                
                              }
                          )
                        }
                        else
                        {
                          toastr.warning("", "No se detectaron cambios.")
                        }

                      }
                     }

                } catch (error) {
                  console.error(signature + error)   
                }
                    return false

              }
           
          })

      //#endregion validator

          console.log(' Multiple $fg :: ' +  _forms[id].info.name + ' ' + ' Creado correctamente.')
          callBack(id)
          return id
        }
   
      } catch (error) {
  
        // #check ver por qué da ese error
        console.log(error)
      }

    },

    html: function(id){
      
      let idForm = ' #' + _forms[id].info.name

      // #region containers
          let html_containers =
              `
              <div id="html_btn_new_back" class="col-lg-12" style="margin-left: 10px; display: none">
              
              </div>
              <br>
              <div id="html-form" style="display: none">
              ${$(idForm).html()}

              <br>
              <div id="html-buttons" class="col-lg-12  text-center" >
              </div>
              </div>
              
              <div id="html-table" >
              <table id="fg-table" class="display nowrap table" style="width:100%">
              <tbody>
              </tbody>
              </table>
              
              </div>

              `

              $(idForm).html(html_containers)
              $(idForm).show()

             
      //#endregion
   
      //#region html injection
          // div button 
      let html_buttons = ` `
      let html_btn_new_back = ``

          // save button

          if(_forms[id].rules.change || _forms[id].rules.new )
          {
           html_btn_new_back +=    `
           <button id="btn-form-back" style="display: none" type="button" class="btn-labeled btn btn-inverse   w-md m-b-5">
           <span class="btn-label"><i class="glyphicon glyphicon-chevron-left"></i></span> Regresar
           </button>
           `    
          }

          

       if(_forms[id].rules.new)
       { 
     
         if(_forms[id].type == 'one')
         {
          html_buttons +=
            `
              <button id="bnt_save" type="submit" class="btn btn-labeled btn-info m-b-5 submit"><span class="btn-label"><i class="glyphicon glyphicon-floppy-disk"></i></span>
              Guardar
              </button>
            `
          }

                html_buttons +=
                `
                  <button id="btn_reset" type="reset" class="btn btn-labeled btn-purple  m-b-5"><span class="btn-label"><i class="glyphicon glyphicon-refresh"></i></span>
                  Limpiar
                  </button>
                 `

           html_btn_new_back +=
                 ` 
                  <button  id='btn_form_new' type="button" class="btn btn-labeled btn-primary m-b-5">
                  <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>Nuevo
                  </button> ` 

            $('#html_btn_new_back').show()
               
            }

            $(idForm + ' #html_btn_new_back').append(html_btn_new_back + ' ') // <hr>
           
   
          // not update button
       if(_forms[id].rules.change)
       {
             // update button
        html_buttons += 
        `
         <button id="btn_update"  type="submit" style="display: none" type="submit" class="btn btn-labeled btn-info m-b-5 submit">
         <span class="btn-label"><i class="glyphicon glyphicon-floppy-saved"></i>
         </span>
         Actualizar
          </button>
       `
      
        }

      
          // delete button
       if(_forms[id].rules.delete)
       { 
        html_buttons += 
           `
              <button id="btn_delete" type="button" style="display: none"  class="btn btn-labeled btn-danger m-b-5"><span class="btn-label"><i class="glyphicon glyphicon-floppy-remove"></i></span>Eliminar
               </button>
           `
        }    
      

      $(idForm + ' #html-buttons').append(' <hr>' + html_buttons + '') // <hr>
  
      //#endregion

      //#region DatTable

      if(_forms[id].rules.show)
      {
        forms.fillTable(id)
      }
      else
      {
        $(idForm + ' #html-table').hide()
      }

      //endregion Dattable

    },

    eventsButtons: function(id){

      let idForm = ' #' + _forms[id].info.name

      // --- Form Animation
      
  function bar_progress(progress_line_object, direction) 
    {
      let number_of_steps = progress_line_object.data('number-of-steps')
      let now_value = progress_line_object.data('now-value')
      let new_value = 0
      
      if (direction === 'right') {
        new_value = now_value + (100 / number_of_steps)
      }
       else if (direction === 'left')
      {
        new_value = now_value - (100 / number_of_steps)
      }
      
      progress_line_object.attr('style', 'width: ' + new_value + '%;').data('now-value', new_value)
    
    }


  $(  idForm + ' fieldset:first').fadeIn('slow');
  let progress_line = $( idForm + ' .btn-next').parents(idForm).find('.f1-progress-line')
  let number_of_steps = progress_line.data('number-of-steps')
  
  $(idForm + ' .f1-step').css('width', (100 / number_of_steps) + '%')
  

  // next step
  $(idForm + ' .btn-next').on('click', function () {
      var parent_fieldset = $(this).parents('fieldset');
      var next_step = true;
      // navigation steps / progress steps
      var current_active_step = $(this).parents(idForm).find('.f1-step.active');
      var progress_line = $(this).parents(idForm).find('.f1-progress-line');

     

      if (next_step) {
          parent_fieldset.fadeOut(400, function () {
              // change icons
              current_active_step.removeClass('active').addClass('activated').next().addClass('active');
              // progress bar
              bar_progress(progress_line, 'right');
              // show next step
              $(this).next().fadeIn()
          });
      }

  });

  // previous step
  $(idForm + ' .btn-previous').on('click', function () {
      // navigation steps / progress steps
      var current_active_step = $(this).parents(idForm).find('.f1-step.active');
      var progress_line = $(this).parents(idForm).find('.f1-progress-line');

      $(this).parents('fieldset').fadeOut(400, function () {
          // change icons
          current_active_step.removeClass('active').prev().removeClass('activated').addClass('active');
          // progress bar
          bar_progress(progress_line, 'left');
          // show previous step
          $(this).prev().fadeIn()
      });
  });





        $(idForm + ' #btn_form_new').click(
          function()
          {
            _forms[id].action = 'new'

            if(_forms[id].events.onNew != undefined)
            {
              _forms[id].events.onNew()
            }
            
            $(idForm +  ' #html-buttons').show()
            $(idForm +  ' #html-form').show()
            $(idForm + ' #btn_form_new').hide()
            $(idForm + ' #btn-form-back').show()
            $(idForm + ' #html-table').hide()
            
            $(idForm + ' #btn_reset').prop("disabled", false); 
            $(idForm + ' #btn_reset').click(); 

            if(_forms[id].type == 'one')
              {
                $(idForm + ' #btn_reset').show()
                $(idForm + ' #bnt_save').show()
              }
              else
              {
                $(idForm + ' #btn_reset').hide()
                $(idForm + ' #btn_reset').prop("disabled", true); 
              }

            

            $(idForm + ' #btn_update').hide()
            $(idForm + ' #btn_delete').hide()

            
          

          
          /**
           * fill <SELECT>
           */
          
           for(let i in _forms[id].dropdown)
           {
              let current = _forms[id].dropdown[i]

              if(_forms[id].dropdown[i].printed == undefined)
              {
                
                forms.fillDropdown(current, i,  id, '')
              }
              else if(_forms[id].dropdown[i].printed)
              {
                forms.selectOption(idForm + ' #' + current.id , '')
              }
           }
           
           
          })

          $(idForm + ' #btn-form-back').click(
           function()
           {

            $(idForm +  ' #html-form').hide()

            $(idForm + ' #btn_form_new').show()
            $(idForm + ' #btn-form-back').hide()

            // #TODO validar si se han hecho cambios para regrescar la tabla antes de mostrarla...
            $(idForm + ' #html-table').show()
            _forms[id].action = 'new'
           }
          )

       
          $(idForm + ' #btn_delete').click(
            function()
              {

                forms.onDelete(id)
              }
            
          )

        //  $(idForm + ' select').change( 
        //     function(){
        //       if($(this).val() == '')
        //       {
        //         $(this).css('font-style', 'italic')
        //         $(this).css('font-weight', 'bold') 
        //       }
        //       else
        //       {
        //         $(this).css('font-style', 'normal')
        //         $(this).css('font-weight', 'normal') 
        //       }
        //     }
        //   )

        if(_forms[id].rules.new && !_forms[id].rules.show && !_forms[id].rules.change && !_forms[id].rules.delete)
        {
          $(idForm + ' #btn_form_new').click()
        }
      
    },

    fillTable: function (id) 
    {
      
      let idForm = ' #' + _forms[id].info.name
      let idTable = idForm + ' #fg-table'
      let btn_edit = ``
      let btn_delete = ``
      let columns = [
                      {
                      data: null, "title": "",
                      defaultContent: ""
                      }
                    ]
      
      if(_forms[id].rules.change)
      {
        btn_edit = `
                <button type="button" class="edit btn btn-info btn-xs" data-toggle="tooltip" data-placement="left" title="Update"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                 `
      }

      if(_forms[id].rules.delete)
      {
        btn_delete = `
                <button type="button" class="btn btn-danger  btn-xs delete" data-toggle="tooltip" data-placement="right" title="Delete "><i class="fa fa-trash-o" aria-hidden="true"></i>
                </button>
                 `
      }

      if(_forms[id].rules.change || _forms[id].rules.delete)
      {
      columns.push(
              {
                data: null, "title": "",
                defaultContent: `
                    <td>
                      ${btn_edit}${btn_delete}
                    </td>
                `
              }
          )
      }
          
          for (let i = 0; i< _forms[id].columns.length; i++) {
            columns.push(_forms[id].columns[i])
          }
          
      // reports
       
      let reports = []
      if(_forms[id].reports.pdf){
        reports.push({extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'})
      }
      if(_forms[id].reports.excel){
        reports.push({extend: 'excel', title: 'ExampleFile', className: 'btn-sm'})
      }
      if(_forms[id].reports.print){
        reports.push({extend: 'print', className: 'btn-sm'})
      }
      if(_forms[id].reports.copy){
        reports.push({extend: 'copy', className: 'btn-sm'})
      }
      if(_forms[id].reports.copy){
        reports.push({extend: 'csv',  title: 'ExampleFile', className: 'btn-sm'})
      }


      let table = $(idTable).DataTable({
        ajax: {
            url: _app.static.core_path + 'get/smart/request',
            type: 'POST',
            data: {
                 token: _session.token,
                 key: _app.inf.key,
                data: { query: _forms[id].info.view, parameters: _forms[id].info.parameters }
            }
        },

        columns: columns,

      responsive: {
          details: {
              type: 'column'
          }
      },

      columnDefs: [ 
        {
          className: 'control',
          orderable: true,
          targets:   0
      } ],

      order: [ 1, 'asc' ],

      dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",

       buttons: reports
          })

          $(idTable + ' tbody').on( 'click', '.edit', function () {
            
            try {

            var data = table.row( $(this).parents('tr') ).data()
            
           _forms[id].formData = data
           
             // #TODO
             // hacer un WS por medio de data.id para obtener los detalles para
             // la edición de los datos. La Query deve venir especificada en el config
             // del form para que sea dinamico. Aplicará para los formularios individuales y multiples
             //  

            console.log(_forms[id].formData)
            _forms[id].index = table.row( $(this).parents('tr') ).index()
            _forms[id].action = 'change'
           
            toastr.info("", "Listo para editar...")

                if(_forms[id].type == 'multiple')
            {
              $(idForm + ' #bnt_save_multiple').hide()
            }
              
             
            $(idForm + ' #btn_reset').hide()
            $(idForm + ' #bnt_save').hide()
            $(idForm + ' #html-table').hide()
            $(idForm + ' #btn_form_new').hide()
              
            $(idForm +  ' #html-buttons').show()
            $(idForm + ' #html-form').show()
            $(idForm + ' #btn-form-back').show()
            $(idForm + ' #html_btn_new_back').show()
      
      
            $(idForm + ' #btn_update').show()
            $(idForm + ' #btn_delete').show()
      
            $(idForm + ' #btn_nothing').prop("disabled", false); 
            $(idForm + ' #btn_delete').prop("disabled", false); 
            $(idForm + ' #btn_reset').click() 

            
            let $this = $(idForm)
            let formHTML = $this.serializeArray()
                             
             for (let i in formHTML) {

                let type =  $(idForm + ' #' + formHTML[i].name).prop("tagName")
              //  console.log(formHTML[i].name + ' - ' + type + ' :' + data[formHTML[i].name]) 

                switch (type) {

                  case 'INPUT':
                  $( idForm + ' #' + formHTML[i].name).val(data[formHTML[i].name])

                  break;

                  case 'SELECT':
                  
                        $( idForm + ' #' + formHTML[i].name).val(data[formHTML[i].name])
                         
                        // Se llenan los dropdown de todo el formulario y se seleciona uno por default
                         
                        for(let y in _forms[id].dropdown)
                            {
                               let current = _forms[id].dropdown[y]

                               if(formHTML[i].name == current.id)
                                {

                                  if(_forms[id].dropdown[y].printed == undefined)
                                    {
                                      forms.fillDropdown(current, y,  id, data[formHTML[i].name])
                                    }
                                    else if(_forms[id].dropdown[y].printed)
                                    {
                                      forms.selectOption(idForm + ' #' + current.id , data[formHTML[i].name])
                                    }
                              }
                            }

                   
                  break;

                  case 'TEXTAREA':
                    $( idForm + ' #' + formHTML[i].name).val(data[formHTML[i].name])
                  break;
                }

            }



            if(_forms[id].events.onEdit != undefined)
            {
              _forms[id].events.onEdit()
            }

          } catch (error) {
           console.error(signature + error)     
          }
                        
            
          })
          
          $(idTable + ' tbody').on( 'click', '.delete', function () {
            try {
              
            var data = table.row( $(this).parents('tr') ).data()
            _forms[id].formData = data

              forms.onDelete(id)

          } catch (error) {
            console.log(signature + error)              
          }
          })
          
        return table
        
      },
     onDelete: function(id)
     {

      _forms[id].action = 'delete'
      if(_forms[id].events.onDelete != undefined)
       {
            _forms[id].events.onDelete()
       }
            
       swal(
               {
               title: "¿Estás seguro?",
               text: "Los datos serán eliminados difinitivamente.",
               type: "warning",
               showCancelButton: true,
               confirmButtonColor: "#DD6B55",
               confirmButtonText: "¡Sí, eliminar!",
               cancelButtonText: "¡No, cancelar!",
               closeOnConfirm: false,
               closeOnCancel: false
              },
              function(isConfirm){
                  if (isConfirm) {
                    let beforeDelete = true

                    if(_forms[id].events.beforeDelete != undefined)
                    {
                      beforeDelete = _forms[id].events.beforeDelete()
                    }
        
                    if(beforeDelete)
                    {
                    forms.deleteThis(id)
                    }
                  }
                  else
                  {
                   forms.cancelDelete(id)
                  }
              })
        

     },

     deleteThis: function(id)
     {

      let idForm = ' #' + _forms[id].info.name
      forms.loading('Eliminando', 'Espera un momento por favor.')
      api.deleteData(
        _forms[id].info.table_code,
        _forms[id].formData.id,
        function(data)
          {
            swal("¡Listo!", "" , 'success')
            $(idForm + ' #btn-form-back').click()
            forms.reloadTable(id)

            if(_forms[id].events.afterDelete != undefined)
            {
              _forms[id].events.afterDelete()
            }
          },

        function(data)
           {
            api.messageByHttpCode(data)
          }
      )

     },

     cancelDelete: function(id)
     {
      swal("¡Cancelado!", "Tus datos estan seguros", "error")
     },

     reloadTable: function(id)
     {
      let idForm = ' #' + _forms[id].info.name
      let idTable = idForm + ' #fg-table'

      let table = $(idTable).DataTable();
      table.ajax.reload();
     },

     loading: function( title, msg)
     {
      swal({
        title: title,
        text: msg,
        imageUrl: '../assets/dist/js/loader.gif'
        })      
        $('.confirm').hide()

     },

     stopLoader: function(id)
     {

      let idForm = ' #' + _forms[id].info.name
      $(idForm + ' #loader').html('')

     },

     fillDropdown:  function(dropdown, n, id, val) 
     {
      
      let $dropdown = '#' + _forms[id].info.name + ' #' + dropdown.id
      $($dropdown).html( `<option value="">Cargando...</option>`)
       api.getSmartData({query : dropdown.view},
             function(data)
                {
                  let option = data.data
                  let html_options = `<option value="">-- Seleccionar --</option>`
                  for(let i in option)
                  {
                    html_options += `<option value="${option[i].id}">${option[i].name}</option>`
                  }
                  $($dropdown).html( html_options)
                  _forms[id].dropdown[n].printed = true
                  forms.selectOption($dropdown, val)
       },
            function()
            {
              swal("¡Error!", "Tuvimos un error al cargar algunas opciones. Revise se conexión a internet o reporte este error", "error")
              $($dropdown).html( `<option value="error">¡Error al cargar las opciones!</option>`)
            }
       )

      },

     selectOption:  function($dropdown, val)
      {
        $($dropdown).val(val)
        // if( val == '')
        // {
        //   $($dropdown).css('font-style', 'italic')
        //   $($dropdown).css('font-weight', 'bold') 
        // }
     },

     get:
     {
       index: function(id)
       {
          return _forms[id].index
       },

       formData: function(id)
       {
        return _forms[id].formData
       },

       formDataHtml: function(id){
        let $this = $(idForm)
        let formHTML = $this.serializeArray()
        return formHTML
       },

       rules: function(id){
         return _forms[id].rules
       },

       optionalData: function(id)
       {
        return _forms[id].optionalData
       }

     },

     events:{
      onNew: function(id, onNew)
      {
        _forms[id].events.onNew = onNew
        return true
      },

      onEdit: function(id, onEdit)
        {
          _forms[id].events.onEdit = onEdit
          return true
        },
      
      beforeSave: function(id, beforeSave)
        {
           _forms[id].events.beforeSave = beforeSave
          return true
        },

      afterSave: function(id, afterSave)
        {
          _forms[id].events.afterSave = afterSave
          return true
        },

      onDelete: function(id, onDelete)
        {
         _forms[id].events.onDelete = onDelete
          return true
        },

      beforeDelete: function(id, beforeDelete)
        { 
        _forms[id].events.beforeDelete = beforeDelete
          return true
        },

      afterDelete: function(id, afterDelete)
        {
          _forms[id].events.afterDelete = afterDelete
          return true
        }
     },

  }
    //#endregion

    //#region [NOTIFICATIONS CON TROLLERTION]
    const notify = {
      sound: function(type)
      {
        _notify.mp3 = ''
        switch (type) {
          case 'message':
            
          break;

          case 'message':
            
          break;

          // forms
          case 'success':
          _notify.mp3 = _app.static.files_path + 'assets/dist/sounds/success.mp3'

          break;

          case 'error':

          break;

          case 'warning':
          _notify.mp3 = _app.static.files_path + 'assets/dist/sounds/warning.wav'

          break;

          default:
          _notify.mp3 = ''
          break
        }
        
        if( _notify.mp3 != '')
        {
        let sound = new Audio(_notify.mp3)
        sound.play()
        }
        else
        {
          console.error(signature + ' No se ha seleccionado un tipo de audio. [type]: message, message, success, error o warning')
        }
      }

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
      getAppname: function () {
        return _app.inf.name
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
            if(appData.static.login_url != undefined){
              _app.static.login_url = appData.static.login_url
            }

            window.location.href = appData.static.login_url
          }
       
         if (_session.status == 'active') {
           
          _app.inf.id = appData.id
          _app.inf.name = appData.name
          _app.inf.logo = appData.logo

         if(typeof appData.static === 'undefined'){
          console.log('No se especificaron los datos estáticos, se tomarán los default.')
         }else{
          if(typeof appData.static.core_path !== 'undefined'){
            _app.static.core_path = appData.static.core_path
          }

          if(typeof appData.static.files_path !== 'undefined'){
            _app.static.files_path = appData.static.files_path
          }
          
          if(typeof appData.static.main_url !== 'undefined'){
            _app.static.main_url = appData.static.main_url
          }
         
          if(typeof appData.static.login_url !== 'undefined'){
            _app.static.login_url = appData.static.login_url
          }

          if(typeof appData.static.url_lock !== 'undefined'){
            _app.static.url_lock = appData.static.url_lock
          }

          if(typeof appData.static.device !== 'undefined'){
            _app.static.device = appData.static.device
          }
        }

          _router.current.menu.id = mainPage.id
          _router.current.menu.name = mainPage.name
          _router.current.menu.title = mainPage.title
          _router.current.menu.desc = mainPage.desc
          _router.current.menu.url = mainPage.url
          _router.current.menu.ico = mainPage.icon
          _router.current.module.name = mainPage.m_name
          _router.current.module.id = mainPage.m_id

          _router.main = {}
          _router.main.menu = {}
          _router.main.menu.id = mainPage.id
          _router.main.menu.name = mainPage.name
          _router.main.menu.title = ''
          _router.main.menu.url = mainPage.url

          document.title = 'Feengster ' + _app.inf.name

          // hacer un getData para verificar si este usuario tiene un key para esta app
          //en este punto el usuario ya se ha logeado.
         
          if(appData.key == undefined)
          {

            //_app.inf.key = '$$$L123000A8745Basdasd$fdlfhkñsdjfgjbfsdkljfgdjkfhgsdhfgjkhg'
            _app.inf.key = ''
        
          }
          else
          {
            _app.inf.key = appData.key
        
          }
          console.log(_app)
          // Obtenemos información de usario, verfificar si aquí es la major opción para su implementación
          console.warn(signature + ' configurado para [' + _app.inf.name + ']')
          callBack()
            
          }
        } catch (error) {
          console.error(signature, error, 'Configuración no valia. \n objeto no valido ::', this.data)
        }
      },

      setTypeDevice: function(type)
      {
        if(type != '' | type == 'mobile' | type == 'pc')
        {
        _app.static.device = type
        }
      },
      getTypeDevice: function(type)
      {
        return _app.static.device  
      },

      getDateTime: function(){
        let fecha = new Date()
          return fecha.getFullYear() + '-'  + (fecha.getMonth() + 1 ) + '-' + fecha.getDate() + ' '+ fecha.getHours() + ':' + fecha.getMinutes() + ':' + fecha.getSeconds()
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




