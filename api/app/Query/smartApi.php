<?php

/* Archivo donde se almacenan los metodos necesarios para  */

namespace App\Query;
use App\Query\User_Q;
use App\Query\Client_Q;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
class smartApi {


static function getData($bd, $data)
 {
     $query = "";
     $arr = [];

   switch($data['query'])
   {  

   #region User

        case 'all_users_apps_all': 
             return user_Q::getData('all_users_apps_all', []);
        break;

        case 'all_clients_one_app': 
             return user_Q::getData('all_clients_one_app', []);
        break;

   #endregion   
   
   #region Router
         case 'all_menus': 
                $query = "SELECT *, (SELECT name FROM {$bd}.cat_module m WHERE  m.id = cm.id_module ) as 'module_name' FROM {$bd}.cat_menus cm";
         break; 

         case 'modules': 
                $query = "SELECT * FROM {$bd}.cat_module ";
         break;

         case 'all_app_menus': 
                $query = "SELECT am.id, am.id_menu, am.id_app, ca.name 'app_name', cm.name 'menu_name' , cmo.name                          'module_name', am.`status`,  am.updated_at
               FROM app_menus am
               INNER JOIN cat_apps ca ON  ca.id = am.id_app AND ca.`status` <> 'NO ACTIVO'
               INNER JOIN cat_menus cm ON cm.id = am.id_menu AND cm.`status` = 'ACTIVO'
               INNER JOIN cat_module cmo ON cmo.id = cm.id_module AND cmo.`status` = 'ACTIVO' 
                WHERE am.`status` = 'ACTIVO'";
        break;


   #endregion

   #region Options
        case 'all_options_all_apps':
                   $query = "SELECT * FROM $bd.cat_options ";
        break;

        case 'all_apps':
                   $query = "SELECT * FROM $bd.cat_apps ";
        break; 
        
        case 'modules_select_option': 
                   $query = "SELECT id , name  FROM {$bd}.cat_module WHERE status = 'ACTIVO'";
        break;

        case 'menus_select_option': 
                   $query = "SELECT id , name  FROM {$bd}.cat_menus WHERE status = 'ACTIVO'";
         break;

         case 'app_select_option': 
                   $query = "SELECT id , name  FROM {$bd}.cat_apps WHERE status <> 'NO ACTIVO'";
         break;

         case 'app_select_option_for_new_user': 
                $query = "SELECT id , name  FROM {$bd}.cat_apps WHERE (type = 'tool' OR type = 'rent') AND  status <> 'NO ACTIVO'";
         break;
        
         case 'all_company_all_apps':
                $query = "SELECT id, name FROM $bd.cat_company WHERE status <> 'ELIMINADO' ";
         break;
                
         case 'all_user_type_for_app_':
                $query = "SELECT id, name FROM $bd.cat_users WHERE status = 'ACTIVO' ";
         break;
                    
         case 'status_1_0': 
                 $query = "SELECT c.value 'id' , c.option 'name'  FROM {$bd}.cat_options c WHERE c.status = 'ACTIVO' and c.type = 'status_1_0' ";
         break;
        
         case 'status_apps': 
                 $query = "SELECT c.value 'id' , c.option 'name'  FROM {$bd}.cat_options c WHERE c.status = 'ACTIVO' and c.type = 'status_apps' ";
         break;
        
         case 'yes_no_binary': 
                $query = "SELECT c.value 'id' , c.option 'name'  FROM {$bd}.cat_options c WHERE c.status = 'ACTIVO' and c.type = 'yes_no_binary' ";
         break;
         
   #endregion
   
   #region Licenses
        case 'all_licenses_company_all_app_all':
        $query = "SELECT l.id, l.status, l.bd, l.key_, l.app_id, l.company_id, l.fecha_fin, l.fecha_ini, c.name 'company', ca.name 'app' FROM $bd.licenses l
                   INNER JOIN $bd.cat_company c ON l.company_id = c.id 
                   INNER JOIN cat_apps ca ON  ca.id = l.app_id ";
        break; 
   #endregion
   
   #region Logins
        case 'all_logins_app_all': 
                $query = "SELECT * FROM {$bd}.logins" ;
        break;

   #endregion
        
   #region Security
        case 'all_table_codes': 
                $query = "SELECT * FROM {$bd}.tables" ;
        break;          
  #endregion 
 
   #region Lab
   
   #endregion 


     }

     return DB::select($query, $arr);
   
}


static function getDataByUsp($bd, $data)
 {
     $Usp = "";
     $arr = [];

   switch($data['section'])
   {  

   #region USERS

        case 'USERS': 
             return user_Q::getDataByUsp($data['Usp'], $data['parameters']);
        break;

   #endregion   

   #region CLIENT

     case 'CLIENT': 
          return client_Q::getDataByUsp($data['Usp'], $data['parameters']);
     break;

   #endregion   
  


     }

     return DB::select($query, $arr);
   
}


static function generateQueryInsert($bd, $table, $data)
{       
        $res = [];
        $array = array();
        $p1 = "INSERT INTO ".$bd.".".$table." (";
        $p2 = "";
        $count = COUNT($data);
        foreach ($data as $key => $value) {
          $p1.= " `{$key}`";
          $p2 .= " ? ";
          $count--;
          if($count > 0)
            {
               $p1 .=","; 
               $p2 .=","; 
            }

        array_push($array, $value);
        
        }

        $query =  $p1.") VALUES (".$p2.")";

        $res['query'] = $query;
        $res['array'] = $array;

        return $res;
}


static function smartUpdate($bd, $table, $id, $data)
{
        $array = array();
        $p1 = "UPDATE ".$bd.".".$table." SET ";
        $count = COUNT($data);
        foreach ($data as $key => $value) {
           $p1.= " `{$key}`= ?";
           $count--;
           if($count > 0)
           {
               $p1 .=" , "; 
           }
        array_push($array, $value);
         
        
        }

       $query =  $p1." WHERE `id`= ? ";
       array_push($array, $id);
       return DB::update($query, $array);
}

static function selectBD($key)
{
        $query = "SELECT bd FROM licenses where 
                      key_ = ? Limit 1";
        $res =  DB::select($query, [$key]);
        return $res[0]->bd;
}

static function isKey($key)
{
        $query = $query = "SELECT status FROM licenses where 
        key_ = ? AND (NOW() <= fecha_fin AND NOW() >= fecha_ini) Limit 1";
              $res = DB::select($query, [$key]);
                if (empty($res))
                {
                 return "Key no valida, acceso denegado ";
               
                }
                else
                {
                  if($res[0]->status == 'ACTIVO')
                  {
                        return true;
                  } 
                  else
                  {
                 return "Key no activa, acceso denegado";
               
                  }     
                }
}

static function appId($key)
{
        $query = "SELECT app_id FROM licenses where 
                      key_ = ? Limit 1";
        $res =  DB::select($query, [$key]);
        return $res[0]->app_id;
}

static function getTable($code)
{
        $query = "SELECT t.name FROM tables t where t.code = ?";
        $res =  DB::select($query, [$code]);
        return $res[0]->name;
}

static function table($bd, $code)
  {
      $query = "SELECT name from tables WHRE code = ?";
      $res = DB::select($query, [$code]);
      return $res;
  }


}

