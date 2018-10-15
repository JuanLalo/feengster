
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

config = { 
    app: 
            { 
              login_url: "../",   
              main_url: "inicio.html",
              name: "Lab",
              logo:  "",
              version: "1.0",
              theme: "",
              core_path: "http://localhost:82/feengster/api/public/",
              files_path: "",
              app_id: 11
            },
    licence : 
            {
                key_: "12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H",
                fecha_ini: "0000-00-00 00:00:00",
                fecha_fin: "0000-00-00 00:00:00"            
            },
            main_page : 
            {
                name_module: "Lab",
                tittle: "Feengster Lab",
                desc: "Descripción ...",
                url: "inicio.html",
                ico: "home"           
            }
    }

      $f.app.initialize(
        {
            id: 'kjbsd7yuhn234ou8uuyt2jkhuhsjiujnhw78j2389h324kuh89prfweu8765',
            name: 'Lab',
            logo: 'LOGO-LAB-LIGHT.PNG',
            key: undefined,
        },
        ready
     )


     function ready(){
        user = getStorage('userdata', true)
        reloadImgProfile()
        $('.user_name').html(user[0].username)
        $('.user_role').html('Administrador')

        $f.router.findMenu(
          //CallBack
            printMenu
        )
        

     }