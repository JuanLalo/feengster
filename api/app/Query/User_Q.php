<?php

namespace App\Query;
use Illuminate\Support\Facades\DB;

class user_Q {

static function getData($query, $arr)
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

                return DB::select($query, $arr);
                
           break;
        }
}        

static function userId($token)
 {
    $query = "SELECT id_user 'id' FROM logins l WHERE l.token = ?  and l.status = ? limit 1";
    $res =  DB::select($query, [$token, 'ACTIVO']);
   
    return $res[0]->id;
 }


static function isToken($bd, $token)
        {
          $query = " 
                     SELECT  l.`status` FROM $bd.logins l
                              INNER JOIN $bd.users u ON u.id = l.id_user AND u.`status` = ? 
                       WHERE l.`status`  = ? AND l.token = ? LIMIT 1

                   ";

          $res = DB::select($query, [ 'ACTIVO', 'ACTIVO' , $token]);
          if (empty($res))
          {
           return "Token no valido";
         
          }
          else
          {
            if($res[0]->status == 'ACTIVO')
            {
                  return true;
            } 
            else
            {
           return "Token caducado.";
         
            }     
          }
          

}

static function selectUserInformation($bd, $id)
        {
                $query = "SELECT * FROM users WHERE
                        id = ? ";
                $res = DB::select($query, [$id]);
                return $res;
}


static function login($bd, $data, $type)
        {
     
        $query = "SELECT * from users 
             WHERE $type = ? ";

        return DB::select($query, [$data]);
}

static function getUsersbyType($bd, $data)
        {
                if($data == "all"){
                        $query = "SELECT * from users WHERE status = 'ACTIVO'";  
                }else{
                        $query = "SELECT * from users 
                        WHERE type_default = ? and status = 'ACTIVO'";
                }

      
        return DB::select($query, [$data]);
}


}