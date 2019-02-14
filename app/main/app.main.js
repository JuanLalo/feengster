

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

$(document).ready(function(){
    
    $f.app.initialize(
        {
            id: 'kjbsd7yuhn234ou8uuyt2jkhuhsjiujnhw78j2389h324kuh89prfweu8765',
            name: 'Panel',
            logo: 'LOGO-LAB-LIGHT.PNG',
            key: 'POOLMUUJ78DFSJKrwer48ybteertetrw892348UKUJBewweSD5845kijnt'
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
})

    /*
        ready() función que se ejecuta una vez el framework ($f) valida licencia, token
        y configuración de la app.
    */
   function ready() {

        /*
            Efecto de preloadder...
        */

       $f.user.getUserInformationFromApi(function(){
        
        /**
         * Efecto de preloader...
         * Se immprime información de usuario en el header.
         *  -> Foto de perfil
         *  -> Opciones de usuario. 
         */

        reloadUserInformation()
        
        /**
         * Efecto de preloader...
         */
        
        setTimeout(function () {
          
          /**
           * 
           * Se detiene  efecto de preloader.
           * 
          */

          $('#preloader').show()
          $('#loading').hide()

            
          
        /**
         *  Se mandan a llmar los  demás componetes:
         */
         
         /**
          *  #TODO (hacer dinamico el menú del panel de control)
          * Menú lateral asignado.
          * 
          */
        
            // $f.router.findMenu(printMenu)

         /**
          * 
          * Página principal
          * 
          */
        
            setTimeout(function () {
                printContent($f.router.getCurrentMenu())
            }, 1500)


        }, 1000)

     })

}



