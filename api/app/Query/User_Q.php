<?php

namespace App\Query;
use Illuminate\Support\Facades\DB;

class user_Q {

static function userId($token)
 {
    $query = "SELECT id_user 'id' FROM logins l WHERE l.token = ?  and l.status = ? limit 1";
    $res =  DB::select($query, [$token, 'ACTIVO']);
   
    return $res[0]->id;
 }

static function create($bd, $data){
        $query= "INSERT INTO  users (
	`username`, `email`, `password`, `platform`, `type_default`, `status`) 
        VALUES
        (?, ?, ?, ?, ?, ?)";

        return DB::insert($query, $data);
}

static function isToken($bd, $token)
        {
          $query = "select * from $bd.logins where status = ? and token = ? limit 1";
          $res = DB::select($query, [ 'ACTIVO' , $token]);
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



static function selectByApiEmail($bd, $email)
        {
                $query = "SELECT * from users WHERE
                        email = ? ";
                $res = DB::select($query, [$email]);
                $res[0]->password = "oculto";
                $res[0]->oldpassword = "oculto";
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


static function getTeams($bd)
        {
        $query = "SELECT t.id, t.name, t.des from ".$bd.".cat_team t";
        return DB::select($query);
}

}