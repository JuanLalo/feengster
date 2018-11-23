<?php

/* Archivo donde se almacenan los metodos necesarios para  */


namespace App\Query;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
class Q_Api {

static function selectBD($key)
{
        $query = "SELECT bd FROM licenses where 
                      key_ = ? Limit 1";
        $res =  DB::select($query, [$key]);
        return $res[0]->bd;
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


static function getData($bd, $data)
 {
   
    $query = "";
    $arr = [];

   switch($data['query'])
     {  

        //#region GENERAL

           case 'all_licenses_company_all_app_all':
        //c.status, c.bd, c.key_, c.app_id, c.company_id, c.fecha_fin, c.fecha_ini, 
                $query = "SELECT *,  c.name 'company', ca.name 'app', l.status FROM $bd.licenses l
                                INNER JOIN $bd.cat_company c ON l.company_id = c.id 
                                INNER JOIN cat_apps ca ON  ca.id = l.app_id 
                         ";
           break;

           case 'modules': 
                $query = "SELECT * FROM {$bd}.cat_module ";
           break;

           case 'all_menus': 
           $query = "SELECT *, (SELECT name FROM {$bd}.cat_module m WHERE  m.id = cm.id_module ) as 'module_name' FROM {$bd}.cat_menus cm";
           break;

           case 'all_table_codes': 
                $query = "SELECT * FROM {$bd}.tables" ;
           break;
           case 'all_users_apps_all': 
                $query = "SELECT * FROM {$bd}.users" ;
           break;
           

           case 'all_logins_app_all': 
                $query = "SELECT * FROM {$bd}.logins" ;
           break;

           
           case 'all_app_menus': 
           $query = "SELECT am.id, am.id_menu, am.id_app, ca.name 'app_name', cm.name 'menu_name' , cmo.name                          'module_name', am.`status`,  am.updated_at
                       FROM app_menus am
                       INNER JOIN cat_apps ca ON  ca.id = am.id_app AND ca.`status` =   'ACTIVO'
                       INNER JOIN cat_menus cm ON cm.id = am.id_menu AND cm.`status` = 'ACTIVO'
                       INNER JOIN cat_module cmo ON cmo.id = cm.id_module AND cmo.`status` = 'ACTIVO' 
                     WHERE am.`status` = 'ACTIVO'";
           break;

           case 'modules_select_option': 
           $query = "SELECT id , name  FROM {$bd}.cat_module WHERE status = 'ACTIVO'";
           break;

           case 'menus_select_option': 
           $query = "SELECT id , name  FROM {$bd}.cat_menus WHERE status = 'ACTIVO'";
           break;

           case 'app_select_option': 
           $query = "SELECT id , name  FROM {$bd}.cat_apps WHERE status = 'ACTIVO'";
           break;

                      
           case 'status_1_0': 
           $query = "SELECT c.value 'id' , c.option 'name'  FROM {$bd}.cat_options c WHERE c.status = 'ACTIVO' and c.type = 'status_1_0' ";
           break;

           case 'yes_no_binary': 
           $query = "SELECT c.value 'id' , c.option 'name'  FROM {$bd}.cat_options c WHERE c.status = 'ACTIVO' and c.type = 'yes_no_binary' ";
           break;

           


         //#endregion


         //#region j
        case 'getCategories':
        $query = "SELECT * FROM {$bd}.categories WHERE id_app = ? AND `type` = ? AND id_company = ? and `status` <> 'ELIMINADO'";
        return DB::select($query, [$data['id_app'], $data['type'], $data['id_company']]);
        break;

        case 'getServices':
        $query = "SELECT (SELECT c.name from {$bd}.categories c WHERE c.id = s.id_category ) 'categoria', s.id_category, s.id, s.name, s.desc_, s.price_gn, s.price_desc, s.price_special, s.status, s.updated_at, s.images FROM {$bd}.services s WHERE id_app = ?  AND id_company = ? and `status` <> 'ELIMINADO'";
        return DB::select($query, [$data['id_app'], $data['id_company']]);
        break;

        case 'getProducts_beaty':
        $query = "SELECT (SELECT c.name from {$bd}.categories c WHERE c.id = s.id_category ) 'categoria', s.id_category, s.id, s.name, s.desc_, s.price_bay, s.price_pg, s.price_desc, s.existence, s.status, s.updated_at, s.images FROM {$bd}.products s WHERE id_app = ?  AND id_company = ? and `status` <> 'ELIMINADO'";
        return DB::select($query, [$data['id_app'], $data['id_company']]);
        break;

        case 'userByType':
        $query = "SELECT u.id , u.username , u.email  , date(u.created_at) 'date'
        FROM users u where company_controlled_id = ".$data['company_id']." and u.type_default = ? and status = 1";
        $terms = [$data['idUserType']];
        return DB::select($query, $terms);
        break;

        case 'userByTypeAll':
        $query = "SELECT u.id , u.username , u.email  , date(u.created_at) 'date'
        FROM users u where company_controlled_id = ".$data['company_id']." and status = 1";
        $terms = [$data['company_id']];
        return DB::select($query, $terms);
        break;

        case "ultimaSemana":
        $query = "SELECT t.code , (select  username from  ".$bd.".users u where u.id = t.id_user_created)'SOLICITA', (select  username from  ".$bd.".users u where u.id = t.id_user_resolve )'RECIBE',
        (select  username from  users u where u.id = t.id_user_cc )'COPIA',
        t.created_at ,  t.resolve_at ,
        t.`status`, t.`type` 'TIPO', t.category 'CATEGORIA'
        from  ".$bd.".tickets t where t.created_at > date(date_sub(NOW(), INTERVAL 8 DAY))";
        return DB::select($query);
        break;

        case "coladeTrabajo":
        $query = "SELECT (select count(tt.id) from  ".$bd.".tickets tt where tt.id_user_resolve = t.id_user_resolve) 'CANTIDAD' ,
	(select  username from  users u where u.id = t.id_user_resolve )'RECIBE',
       (select  username from  users u where u.id = t.id_user_created)'SOLICITA', 
		t.created_at ,  t.resolve_at ,
		t.`status`, t.`type` 'TIPO', t.category 'CATEGORIA'
                from  ".$bd.".tickets t where t.status <> 'ELIMINADO' and  t.status <> 'RESUELTO'";
                return DB::select($query);
        break;

        case "getLogTickets":
        $query = "SELECT * from  ".$bd.".log_ticket where id_ticket = ".$data['id_ticket'];
        return DB::select($query);
        break;

        case "getUsuariosa":
        $query = "SELECT * from  users WHERE id = ?";
        return DB::select($query, [$data['id']]);
        break;

        case "getCategorias":
        $query = "SELECT * from categories  WHERE id_app= ? AND id_company=? AND type=? AND status = 'ACTIVO' ";
        return DB::select($query, [$data['id_app'], $data['id_company'], $data['type'] ]);
        break;
        
        case "getCatUser":
        $query = "SELECT * from cat_users  WHERE id_app= ? AND status = ? ";
        return DB::select($query, [$data['id_app'], 'ACTIVO']);
        break;

        case "getUsersAllAdmin": 
        $query = "SELECT id, type_default, password, (Select name from cat_users c where type_default = c.id) 'tipo', username, email, status from users  WHERE app_id= ? AND company_id=? AND status <> ? ";
        return DB::select($query, [$data['app_id'], $data['company_id'], 'ELIMINADO']);
        break;

        case "test":
        $query = "SELECT * from cat_menus ";
        return DB::select($query);
        break;

       
        case "getAllApps":
        $query = "SELECT * from cat_apps where platform = ? AND estatus = ? ";
        return DB::select($query, ["web", "ACTIVO"]);
        break;

  //#endregion

        
        default:
                return false;
        break;
        
     }

     return DB::select($query, $arr);
   
}


  static function setData($bd,$data)
{
     switch($data['query']){
        case 'newUser':
        $query = "update users  set username = ?, email = ?, password = ? where id = ?";
        $terms = [$data['username'], $data['email'], Hash::make($data['password']), $data['id']];
        return DB::update($query, $terms);
        break;

        case 'deleteAsUpdate':
        $query = "update ".$bd.".".$data['tb']."  set status = ? where id = ?";
        $terms = [0, $data['id']];
        return DB::update($query, $terms);
        break;

        case 'newLogTicket':
        $query = "INSERT INTO ".$bd.".log_ticket
        (`id_ticket`, `id_user`, `time`, `desc`) 
       VALUES (?, ? , ?, ?);";
        $terms = [$data['id_ticket'], $data['id_user'], $data['time'], $data['desc'] ];
        return DB::update($query, $terms);
        break;
        
        default:

        break;
        }       
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

   // Actualiza dinamicamnete. Recibe cualquier objeto para realizar el update en cualquir tabla
static function smartUpdate($bd, $table, $data)
{

        $query = "INSERT INTO ".$bd.".".$table." SET ";
        
        $count = COUNT($data);
        foreach ($data as $key => $value) {
           $query .= " ´{$key}´ = '{$value}'";
           $count--;
           if($count > 0)
           {
               $query .=" AND "; 
           }
           
        }

       return DB::insert($query, $data);
}

static function smartInsert($bd, $table, $data)
{
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
        
   return DB::insert($query, $array);
}

static function smarUpdate($bd, $table, $id, $data)
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
       return DB::insert($query, $array);
}


static function smartSelect($bd, $data)
 {
        switch($data['type'])
        {
                case 'dropdown':
                selectBytype($bd, $data);
                break;

                case 'infoApp':
                selectInfoApp($bd, $data);
                break;

                case 'other':
                selectOther($bd, $data);
                break;
        }  


}
static function  selectInfoApp($bd, $data)
 {
        switch($data['query'])
        {
                case '':
                break;
        }  


}

static function selectOther($bd, $data)
 {
        switch($data['query'])
        {
                case '':
                break;
        }  


}

static function selectDropdown($bd, $data)
 {
        switch($data['query'])
        {
                case '':
                break;
        }  


}



static function table($bd, $code)
        {
                $query = "SELECT name from tables WHRE code = ?";
                $res = DB::select($query, [$code]);
                return $res;
}


}

