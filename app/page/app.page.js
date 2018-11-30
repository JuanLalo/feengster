/*
    @author Feengster
      Main Feengster Lab

                            Copyright (c) 2018 Feengster
         Code written and tested by Feengster, its distribution or modification is prohibited.
         Each and every one of the functions are the property of this software. 
         It will be subject to legal proceedings for non-compliance.
         If you want to know more about legal protection or make contact visit the following link.
                           www.feengster.com/?legal

    Name: Feengster Page
    Version: 1.0
    last date: 10/12/2018
    type: testing
*/




$f.app.initialize(
        {
        id: 'DPLo7oU7sdFsqXcbvdfgd87sdF7fSDF87FSD7fsd7sdfSD7fSEeUIOPA78A8',
        name: 'web',
        logo: 'LOGO-LAB-LIGHT.PNG',
        static: {
            files_path: 'app/',
            core_path: 'api/public/',
            main_url: 'localhost:82/',
            login_url: 'app/index.html'
        }    

        },   
        {
        id: 0,
        name: '',
        title: '',
        desc: '',
        url:  'page/inicio.html',
        icon: 'insert_emoticon',
        m_name: 'Inicio',
        m_id: 0
    },
    ready
)

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

        $('.userfullname').html($f.user.getFullName())
        
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
            }, 0)


        }, 0)

     })

}
