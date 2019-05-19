
  /**
   * 
   *  Se inicializa formulario
   *  Asegurate que el nombre nombre del formulario sea unico id="Nombre"
   * 
   * **/

  $(document).ready(function () {

    const user = {

      idForm: '#fg_ml_users_all',

      changeValueInputs: function () {

        return true
      }
    }


    $f.forms.newMultiple({
      info:  
                {
                  name: 'fg_ml_users_all',
                  table_code: 'NN1X86VL02X984LDTPRFKBLSUNDMQHXYN7RX29VAIFC5GK85R2Q9SY26E9RT',
                  view: 'all_clients_one_app',
                  parameters: [],
                },

      rules: {
        show: true,
        new: true,
        change: true,
        delete: true
      },
      
      steps:{
        
        0:{
            
          table_code: 'NN1X86VL02X984LDTPRFKBLSUNDMQHXYN7RX29VAIFC5GK85R2Q9SY26E9RT',
          referenced: true,  
          optionalData: {
              0 : {
                    name : 'updated_at',
                    value: $f.app.getDateTime , function_: true,
                  }
            } 
          },

        
        1:{
          
          table_code: '2B26CV5S7E44X2AWDW4OQC9XM3AXIIOLOA4GPW19XKRWUBSORHVNDKIJVGEB',//address
          referenced: true,
          fk: {},
          optionalData: {},
          },
  
        2:{
          
            table_code: '3PW4PVWOEQ47E0O1W5PUVHK5PTNJFAU2LG8KS0EQ6D2YACJDZJF8L148JQSE', //companies
            fk: { 0:{name:'user_id', reference: 0 }},
            optionalData: {},
            referenced: false,
            
            },
        3:{
          
            table_code: '41MO8VE2X4K5S6ALVBO4BXDUUGGLBKKUBPDHY4ECA6QSK3K71EI4SC21QAWD', // cat user
            fk: { 0:{name:'user_id', reference: 0 }},
            optionalData: { 0 : {
                                    name : 'main',
                                    value: 15, function_: false,
                                },
                                1 : {
                                    name : 'id_cat_user',
                                    value: 36, function_: false,
                                }
                            },
            referenced: false, 
  
            },

        4:{
          
                table_code: 'GC0PA259M132SHQW2B5K06JUE7JS1MN5IUE7JUCUYXKQQ6D1TR0KF9NA5L72', //client
                fk: { 0:{name:'user_id', reference: 0 },  1:{name:'address_id', reference: 1 } },
                optionalData: {
                0 : {
                    name : 'app_id',
                    value: 15, function_: false,
                },
                1 : {
                    name : 'company_id',
                    value: 3, function_: false, // #TODO volver company_id dinamico
                }
            },
                referenced: false,
                
                }

            
          
        },
      
      db : {
          uspForShow: {section: 'USERS', name: 'all_users_apps_all', parameters: {}},
          uspForChange: { section: 'USERS', name: 'lab_user_adminUsers_SP', parameters: {}}
          },

    
      columns: [{
          "data": "id",
          "title": "ID USER"
        },
        {
          "data": "name",
          "title": "NOMBRE"
        },
        {
          "data": "surnames",
          "title": "APELLIDOS"
        },
        {
          "data": "phone",
          "title": "TEL"
        },
        {
          "data": "email",
          "title": "EMAIL"
        },
        {
          "data": "birthdate",
          "title": "BIRTHDATE"
        },
        {
          "data": "created_at",
          "title": "DESDE"
        },
        {
          "data": "updated_at",
          "title": "MODIFICADO"
        },
        {
          "data": "status",
          "title": "ESTATUS"
        }
      ],
      
      tableData: [],

       reports: {
        pdf: true,
        excel: true,
        print: true,
        copy: false,
        csv: false
      },


      dropdown: {
        0: {
          id: 'status',
          view: 'status_1_0'
        },
        1: {
          id: 'id_company',
          view: 'all_company_all_apps'
        },

        2: {
          id: 'app_id',
          view: 'app_select_option_for_new_user'
        },

        3: {
          id: 'id_cat_user',
          view: 'all_user_type_for_app_'
        },
               
        
      },


      events: {
        onEdit: undefined,
        beforeSave:  undefined,
        afterSave: undefined,
        beforeChange:  function(){
               
               return true;
               },
        afterChange: undefined,
        onDelete: undefined,
        beforeDelete: undefined,
        afterDelete: undefined,
        onNew: undefined,
      }
    },
      
      formReady

    )

function formReady(id){


    user.imgDefaul = '../assets/dist/img/perfil.png'
    user.img = '' 
    $(user.idForm + ' .phone_us').mask('000-000-00-00')
    $(user.idForm + ' #username').mask('@SSSSSSSSSSSSSSSSSSSSS')

    

    user.onNew = function ()
     {
      $(user.idForm + ' #img').attr("src", user.imgDefaul)
     }

    user.onEdit = function () 
     {

      let formData = $f.forms.get.formData(id)
      user.img = formData.img
      
      if(formData.img == '' || formData.img == null)
        {
           user.img = user.imgDefaul
        }

      $(user.idForm + ' #img').attr('src', user.img )
     
     }


    // Update Form events
    $f.forms.events.onNew(id, user.onNew)
    $f.forms.events.onEdit(id, user.onEdit)

}


  })