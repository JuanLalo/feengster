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

      menus: {}

    }

    let _forms = {}

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
     
        _forms[size] = {
              info: form.info,
              rules: form.rules,
              columns : form.columns,
              formData: {},
              optionalData: form.optionalData,

               /** EVENTS
               *  --> onEdit
               *  --> beforeSave
               *  --> afterSave
               *  --> onDelete
               *  --> beforeDelete
               *  --> afterDelete
               *  */
              events: form.events
              
             
              
          }

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

      // #region containers
          let html_containers =
              `
              <div id="html_btn_new_back" class="col-lg-12" style="margin-left: 10px; display: none">
              
              </div>

              <div id="html-form" style="display: none">
              ${$(idForm).html()}

              <div id="html-buttons" class="form-group" style= "margin-left: 10px; ">
              </div>
              </div>
              
              <div id="html-table">
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
       if(_forms[id].rules.new)
       { 
         
          html_buttons +=
            `
              <button id="bnt_save" type="submit" class="btn btn-labeled btn-info m-b-5 submit"><span class="btn-label"><i class="glyphicon glyphicon-floppy-disk"></i></span>
              Guardar
              </button>
            `
              // clear button
          html_buttons +=
          `
            <button id="btn_reset" type="reset" class="btn btn-labeled btn-purple  m-b-5"><span class="btn-label"><i class="glyphicon glyphicon-refresh"></i></span>
            Limpiar
            </button>
           `

           html_btn_new_back +=
                 ` 
                  <button  id='btn_form_new' type="button" class="btn btn-labeled btn-success m-b-5">
                  <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>Nuevo
                  </button> ` 

            $('#html_btn_new_back').show()
               
            } 

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
       html_btn_new_back +=    `
            <button id="btn-form-back" style="display: none" type="button" class="btn-labeled btn btn-inverse   w-md m-b-5">
            <span class="btn-label"><i class="glyphicon glyphicon-chevron-left"></i></span> Regresar
            </button>
            `    
        }

       
        $(idForm + ' #html_btn_new_back').append(html_btn_new_back + '<hr>')

      
          // delete button
       if(_forms[id].rules.delete)
       { 
        html_buttons += 
           `
              <button id="btn_delete" type="button" style="display: none"  class="btn btn-labeled btn-danger m-b-5"><span class="btn-label"><i class="glyphicon glyphicon-floppy-remove"></i></span>Eliminar
               </button>
           `
        }    
      

      $(idForm + ' #html-buttons').append(html_buttons)
  
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


      //#region  validator
      
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
                        console.log('Datos para guardar ')
                        console.log( formData)
                        toastr.info("", "Guardando...")
                        api.setData(
                                    _forms[id].info.table_code,
                                    formData,
                                    function(data){
                                      console.log(data)
                                      forms.reloadTable(id)
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

                        for(let i in formData)
                        {
                            if(formData[i] != _forms[id].formData[i])
                                {
                                  wasChange = true
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
                          swal('Actualizando...', "Espera un momento, por favor.")
                          $(idForm +  ' #html-buttons').hide()
                          $(idForm +  ' #html_btn_new_back').hide()

                           api.changeData(
                              _forms[id].info.table_code,
                              _forms[id].formData.id, 
                              dataToUpdate,
                              function(data){
                                console.log(data)
                                $(idForm +  ' #html_btn_new_back').show()
                                $(idForm +  ' #html-buttons').show()
                                swal("¡Listo!", "", "success")
                                
                                for(let i in dataToUpdate)
                                 {
                                   _forms[id].formData[i] = dataToUpdate[i]
                                   console.log(_forms[id].formData[i]) 
                                 }
                                 
                                let table = $(idForm + ' #fg-table').DataTable()
                                
                                table.column( 2 ).name( 'icon' );
                                var columnData = table.column( 'icon:name' ).data();
                                 alert(columnData) 
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


        //#region form events
        // ---- On new
        $(idForm + ' #btn_form_new').click(
          function()
          {
            $(idForm +  ' #html-form').show()
            $(idForm + ' #btn_form_new').hide()
            $(idForm + ' #btn-form-back').show()
            $(idForm + ' #html-table').hide()

            $(idForm + ' #btn_reset').show()
            $(idForm + ' #bnt_save').show()


            $(idForm + ' #btn_update').hide()
            $(idForm + ' #btn_delete').hide()

            
          $(idForm + ' #btn_reset').click(); 
          $(idForm + ' #btn_reset').prop("disabled", false); 
          _forms[id].action = 'new'

          if(_forms[id].events.onNew != undefined)
          {
            _forms[id].events.onNew()
          }
          

          })

        // ----- on Back
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

        
        // On only new

        if(_forms[id].rules.new && !_forms[id].rules.show && !_forms[id].rules.change && !_forms[id].rules.delete)
        {
          $(idForm + ' #btn_form_new').click()
        }

      //#endregion
      

     
      console.log('$fg :: ' +  _forms[id].info.name + ' ' + ' Creado correctamente.')

     }
   
    } catch (error) {

      // #check ver por qué da ese error
      console.log(error)
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
          

      let table = $(idTable).DataTable({
        ajax: {
            url: _app.static.core_path + 'get/smart/request',
            type: 'POST',
            data: {
                 token: _session.token,
                 key: _app.inf.key,
                data: { query: _forms[id].info.view }
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

       buttons: [
                      {extend: 'copy', className: 'btn-sm'},
                      {extend: 'csv',  title: 'ExampleFile', className: 'btn-sm'},
                      {extend: 'excel', title: 'ExampleFile', className: 'btn-sm'},
                      {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
                      {extend: 'print', className: 'btn-sm'}
                  ]
          })

          $(idTable + ' tbody').on( 'click', '.edit', function () {
            
            try {

            var data = table.row( $(this).parents('tr') ).data()
            _forms[id].index = table.row( $(this).parents('tr') ).index()
            _forms[id].action = 'change'
           
            toastr.info("", "Listo para editar...")

            $(idForm + ' #btn_reset').hide()
            $(idForm + ' #bnt_save').hide()
            $(idForm + ' #html-table').hide()
            $(idForm + ' #btn_form_new').hide()
      
            $(idForm + ' #html-form').show()
            $(idForm + ' #btn-form-back').show()
            $(idForm + ' #html_btn_new_back').show()
      
      
            $(idForm + ' #btn_update').show()
            $(idForm + ' #btn_delete').show()
      
            $(idForm + ' #btn_nothing').prop("disabled", false); 
            $(idForm + ' #btn_delete').prop("disabled", false); 

            _forms[id].formData = data
            let $this = $(idForm)
            let formHTML = $this.serializeArray()
                  
             for (let i in formHTML) {
                $( idForm + ' input[name=' + formHTML[i].name + ']').val(data[formHTML[i].name])

                if(formHTML[i].name == 'status')
                {
                  $( idForm + ' #status').val(data[formHTML[i].name]).change();
                  console.log(data[formHTML[i].name])
                }
            }

            console.log(_forms[id].formData)
            console.log(formHTML)

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

            if(_forms[id].events.onDelete != undefined)
            {
              _forms[id].events.onDelete()
            }
 
          } catch (error) {
            console.log(signature + error)              
          }
          })
          
        return table
        
      },
     onDelete: function(id)
     {
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
            forms.deleteThis(id)
        } else {
            forms.cancelDelete(id)
        }
        })

     },

     deleteThis: function(id)
     {
        swal("¡Eliminado!", "Datos eliminados con éxito " + _forms[id].formData.id, "success")
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

     loading: function(id, title, msg)
     {
      let idForm = ' #' + _forms[id].info.name

      $(idForm ).append(`
                        <div id="loader" class="text-center">
                        <br><br><br>
                        <img width="50" src="../assets/dist/js/loader.gif" alt="Cargando...">
                        <br>
                        <br>
                        <h2>
                        <p>${title}</p>
                        </h2>
                        <br><br><br><br><br><br><br><br><br><br>
                        </div>
                        `)
      
      $(idForm + ' #html-table').hide()
      $(idForm +  ' #html-form').hide()
      $(idForm +  ' #html_btn_new_back').hide()
      
      

     },

     stopLoader: function(id)
     {

      let idForm = ' #' + _forms[id].info.name
      $(idForm + ' #loader').html('')

     }

    }
    //#endregion

    //#region [NOTIFICATIONS CON TROLLERTION]
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
            _app.inf.key = '$$$L123000A8745Basdasd$fdlfhkñsdjfgjbfsdkljfgdjkfhgsdhfgjkhg'
        
          }
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