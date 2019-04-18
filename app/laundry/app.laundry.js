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



/* 
    Una vez cargados los componentes de de Feengster Framework,
    se inicializa la App.
    Se establecen datos de la app en la que se trabajará y configuración de pag. de inicio.
*/
$f.app.initialize({
        id: 'ho34u98y8erh345iy898r3hrio8y39f8erphy348y5o3wr23423',
        name: 'Laundry',
        logo: 'LOGO-LAB-LIGHT.PNG',
        key: 'yg73u47324bg324kbds7f97y3iug97tsd978y973ty4932yg497ythg72372'
    }, {
        id: 0,
        name: 'INICIO',
        title: '',
        desc: '',
        url:  'laundry/inicio.html',
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
            resizeContent()
            $f.router.findMenu(printMenu)

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
