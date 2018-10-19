

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

    //importScripts() se importan los scripts necesarios, para que no estén en el html

    /* 
        Una vez cargados los componentes de de Feengster Framework,
        se inicializa la App.
        Se establecen datos de la app en la que se trabajará y configuración de pag. de inicio.
    */
   $f.app.initialize(
    {
        id: 'kjbsd7yuhn234ou8uuyt2jkhuhsjiujnhw78j2389h324kuh89prfweu8765',
        name: 'Panel',
        logo: 'LOGO-LAB-LIGHT.PNG',
        key: undefined,
    },
    {
       id:       0,
       name:    'Panel de control',
       title:   'Panel de control',
       desc:    'Aquí podrás administrar tus aplicaciones',
       url:     'main/inicio.html',
       icon:    'verified_user',
       m_name:  'Panel de Control',
       m_id:    0
    }
    ,
    ready
 )

    /*
        ready() función que se ejecuta una vez el framework ($f) valida licencia, token
        y configuración de la app.
    */
   function ready() {

    setTimeout(function () {
        $('#preloader').show()
        $('#loading').hide()

        /*
            Se immprime el header
        */
        // user = getStorage('userdata', true)
        // reloadImgProfile()
        // $('.user_name').html(user[0].username)
        // $('.user_role').html('Administrador')

        /*
            Se immprime el menú lateral, aspiganado al usuario
        
        $f.router.findMenu(printMenu)
        
        */

        /*
            Se immprime la página de inicio
        */

        setTimeout(function () {
            printContent($f.router.getCurrentMenu())
        }, 1500)



    }, 2000)

    /*
     [Firebase]
        Se obtienen notificaciónes
     */

}



