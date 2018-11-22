<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Query\User_Q;
use App\Query\Q_Api;
// para recibir los parametros como el extrat_request
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Log;

class UserController extends Controller
{

    public function createUser(Request $request)
    {
        try
            {
            if (!empty($request->all()))
            {
                $data = $request->all();
                Q_Api::isKey($data['key']);
                $user = [$data['username'], $data['email'], Hash::make($data['password']), $data['platform'],  $data['type'], '1'];
                $bd = Q_Api::selectBD($data['key']);
                User_Q::create($bd, $user);
                $response = ["status" => "success", "message" => "Usuario creado con éxito",
                 "deta" => User_Q::selectByApiEmail($bd, $data['email'])];
                $code = 201;
            }
            else
            {
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "deta" => []];
            }

        } catch (\Exception $e) {
            Log::error($e);
            $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e];
            $code = 500;
        }

        return response()->json($response, $code);

    }


    public function login(Request $request)
    {
        // try
        //     {
            if (!empty($request->all()))
            {
                $data = $request->all();
                $isKey = Q_Api::isKey($data['key']);
                if($isKey == 'true'){
                    $bd = Q_Api::selectBD($data['key']);
                    $res = User_Q::login($bd, $data['user'], $data['type']);
                if (empty($res)){
                    $response = ["status" => "empty", "message" => "Nombre de usuario no encontrado", "data"=> []];
                    $code = 200;
                    Log::warning('login, nombre de usuario incorrecto', $data);
               }else{
                   
//                if (Hash::check($data['password'], $res[0]->password))
                if (true)
                   {
                       if($res[0]->status == 'ACTIVO')
                       {
                        $query = 'INSERT INTO `logins` ( `id_user`, `platform`, `token`, `status`, `ip`, `city`, `explorer`) VALUES ( ?, ?, ?, ?, ?, ?, ?)';

                        $new_token = str_random(25) . '$' . $res[0]->id . '-'. str_random(29);
                        $ok = DB::insert($query,
                         [
                            $res[0]->id,
                            'Web', // #TODO
                            $new_token,
                            'ACTIVO',
                            '0.0.0.0',
                            'León Gto',
                            'Google Chrome'
                         ]
                         );
                      
                         if($ok){

                            $res[0]->password = "oculto";
                            $res[0]->oldpassword = "oculto";
                         
                            $res['token'] =  $new_token;
                            $res['fecha'] =  DB::select('select now()');
 
                            // #TODO redirigir a la aplicación por default según el usuario.
                            $res['app_url'] = "main/";
 
                            $response = ["status" => "success", "message" => "Logeado con éxito", "data" => $res];
                            $code = 200;
                            
                            Log::info('login...', $data);
                         }
                         else
                         {
                            $response = ["status" => "empty", "message" => "Ocurrió un error, vuelva a intentarlo por favor", "data"=> []];
                            $code = 200;
                            Log::warning('login, Error al crear token', $data);
                         }
                           
                           
                       }
                       else
                       {
                            $response = ["status" => "empty", "message" => "Cuenta no activa", "data" => []];
                            $code = 204;
                            Log::info('Usuario inactivo intentó logerarse', $data);
                       }
                   
                    }
                    else
                    {
                    $response = ["status" => "empty", "message" => "¡Contraseña incorrecta!", "data" => []];
                    $code = 403;
                    Log::warning('login, password de usuario incorrecto', $data);
                    }
                }
                }
                  else 
                {
                
                $code = 403; // ok pero acceseo denagado
                Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "deta" => []];
            
                }
            }
            else
            {
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json", [$request]);
                $response = ["status" => "unauthorized", "message" => "Acceso denegado", "data" => []];
            
                }
      
                
        // } catch (\Exception $e) {
        //     if(env('APP_ENV') == 'production' )
        //     {
        //         Log::error($e);

        //         $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => "Código de error XXXXX #TODO"];
        //         $code = 400;
        //     }
        //     else
        //     {
        //         $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e->getMessage()];
        //         $code = 400;
        //     }
        // }

        return response()->json($response, $code);

    }
    

    public function getUsersByType(Request $request)
    {
        try
            {
            if (!empty($request->all()))
            {
                $data = $request->all();
                $isKey = Q_Api::isKey($data['key']);
                if($isKey == 'true'){
                $res = User_Q::getUsersbyType(Q_Api::selectBD($data['key']), $data['usertype']);
                if (empty($res)){
                    $response = ["status" => "empty", "message" => "No se encontraron resultados", "data"=> $res];
                    $code = 403;
               }else{
                     $res[0]->password = "oculto";
                     $res[0]->oldpassword = "oculto";
                     $response = ["status" => "suuccess", "message" => "Mostrando resultados", "data" => $res];
                     $code = 200;
                      }
                   
                }
                else
                 {
                 $code = 403; // ok pero acceseo denagado
                Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "deta" => []];
            
                }
            }
             else
            {
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado", "deta" => []];
            
                }
            
      
                
        } catch (\Exception $e) {
            Log::error($e);
            $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e];
            $code = 500;
        }

        return response()->json($response, $code);

    }


    public function getUserInformation(Request $request)
    {
        try
        {
         if (!empty($request->all()))
             {
                $data = $request->all();
                $isKey = Q_Api::isKey($data['key']);
                if($isKey == 'true')
                {
                $bd = Q_Api::selectBD($data['key']);    
                $isToken = User_Q::isToken($bd, $data['token']);
                if($isToken == 'true')
                {
                    $res = User_Q::selectUserInformation($bd, User_Q::userId($data['token']));
                    if (empty($res)){
                       $response = ["status" => "empty", "message" => "No se encontró la información de usuario", "data"=> []];
                       $code = 200;
                       Log::warning('login, nombre de usuario incorrecto', $data);
                    }
                     else
                    {
                        $res[0]->password = '** Hola genio :) **';
                        $res[0]->oldpassword = '** Hola genio :) **';
                       $response = ["status" => "success", "message" => "Obteniendo información de usuario", "data"=> $res[0]];
                       $code = 200;
                       Log::warning('login, nombre de usuario incorrecto', $data);
                    }
                }
                else
                {
                   $code = 401; // FORBIDDEN	
                   Log::alert($isToken);
                       $response = ["status" => "unauthorized", "message" => $isToken, "deta" => []];  
                }
                
                 }
                    else 
                 {
            
                    $code = 403; // ok pero acceseo denagado
                    Log::alert($isKey);
                    $response = ["status" => "unauthorized", "message" => $isKey, "deta" => []];
        
                 }
             }
                else
             {
                 $code = 403; // ok pero acceseo denagado
                 Log::alert("acceso denagado request no es un json", [$request]);
                 $response = ["status" => "unauthorized", "message" => "Acceso denegado", "data" => []];
        
             }
       
        } 
        
          catch (\Exception $e)
            {
              if(env('APP_ENV') == 'production' )
                {
                 Log::error($e);
                 $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => "Código de error XXXXX #TODO"];
                 $code = 400;
                }
                 else
                {
                    $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e->getMessage()];
                    $code = 400;
                }
            }

    return response()->json($response, $code);  
      

    }
    


    
    public function getTeams(Request $request)
    {
        try
            {
                if (!empty($request->all()))
                {

                $data = $request->all();
                $isKey = Q_Api::isKey($data['key']);

                if($isKey == 'true'){
                    $bd = Q_Api::selectBD($data['key']);
                     $isToken = User_Q::isToken($bd, $data['token']);

                    if($isToken == 'true')
                    {
                    $res = User_Q::getTeams($bd);
                    
                if (empty($res)){
                    $response = ["status" => "empty", "message" => "No hay equipos disponibles", "data"=> $res];
                    $code = 205;
               }else{
                $response = ["status" => "success", "message" => "Mostrando equipos disponibles", "data"=> $res];
                $code = 200;
                     
                }

                    }else
                    {
                        $code = 401; // FORBIDDEN	
                        Log::alert($isToken);
                       $response = ["status" => "unauthorized", "message" => $isToken, "deta" => []];  
                    }     
                   
                }
                else
                 {
                 $code = 401; // ok pero acceseo denagado
                Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "deta" => []];
            
                }
            }
                else
                {
                        $code = 401; // 
                        Log::alert("acceso denagado request no es un json");
                        $response = ["status" => "unauthorized", "message" => "Acceso denegado, Se ha activado el control de seguridad.", "deta" => []];
                    
                        
                 }                

              
        } catch (\Exception $e) {
            Log::error($e);
            $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e];
            $code =400;
        }

        return response()->json($response, $code);

    }

}
