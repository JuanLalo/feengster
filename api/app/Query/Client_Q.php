<?php

namespace App\Query;
use Illuminate\Support\Facades\DB;

class client_Q {
       
 static function getDataByUsp($Usp, $parameters)
        {
                /**
                 * Por motivos de seguridad en el front-end se establece un nombre para cada USP y en el siguiente switch es donde se hace la relacion
                 * entre cada uno. Dentro de cada case se encuentra o se debe de establecer el nombre real del USP de la base de datos
                 * Ejemplo en el front en el menú de Usuario se utiliza un USP para obtener la información completa de un usuario para poder mostrar a detall
                 * y para poder editar cualquier dato en el fron se llama lab_user_adminUsers_SP y en los datos se llama usp_lab_users_get 
                 * Para mayor información revisa la documentación.
                 */
                
                // foreach ($parameters as $key => $value) { // Descomentar si se genera algún error porque el SP solicite parametros de tipo String
                //         $parameters[$key] = (string)$value;
                // }    


                switch($Usp)
                {
                 #region  APP:::LAUNDRY   
                    case 'laundry_client_adminClients_SP':
                        $query = 'CALL usp_laundry_clients_get(?)';
                        return DB::select($query, $parameters);
                   break;
                  #endregion
                }

               
        }    

static function getData($query, $parameters)
{
        switch($query)
        {
           case 'all_users_apps_all':
                $query =
                        ' SELECT 
                                u.id , u.username , u.name, u.surnames, u.phone,
                                u.email , u.img , u.password, u.oldpassword,
                                u.birthdate , u.platform, u.updated_at, u.created_at ,
                                u.status,
                                
                                a.app_id,
                                
                                cu.id_cat_user,
                                
                                c.id_company 
                          FROM users u
                                JOIN user_app a ON u.id = a.user_id  AND a.main = 1
                                JOIN user_cat_user cu ON u.id = cu.user_id AND cu.main = 1
                                JOIN user_companies c ON u.id = c.user_id
                         where u.status <> "ELIMINADO"
                               order by u.created_at';

                return DB::select($query, $parameters);
           break;

           case 'all_clients_one_app':
                $query =
                        ' SELECT 
                                u.id , u.name, u.surnames, u.phone,
                                u.email , u.img ,  u.birthdate , u.updated_at, u.created_at ,
                                u.status
                          FROM users u
                                JOIN user_client uc ON u.id = uc.user_id  AND uc.company_id = 3
                               
                         where u.status <> "ELIMINADO"
                               order by u.created_at';

                return DB::select($query, $parameters);
           break;

           
          
        }
}        


}