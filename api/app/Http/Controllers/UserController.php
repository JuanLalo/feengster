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
                $bd = Q_Api::selectBD($data['key']);
                if($isKey == 'true'){
                $res = User_Q::login($bd, $data['username']);
                if (empty($res)){
                    $response = ["status" => "empty", "message" => "Nombre de usuario no encontrado", "data"=> []];
                    $code = 200;
                    Log::warning('login, nombre de usuario incorrecto', $data);
               }else{
                   
                    if (Hash::check($data['password'], $res[0]->password))
                   {
                       if($res[0]->status == 'ACTIVO')
                       {
                           $res[0]->password = "oculto";
                           $res[0]->oldpassword = "oculto";
                           $query = "select company from ".$bd.".cat_company c where c.id = ?";
                           $res['company'] =  DB::select($query, [$res[0]->company_id]);

                           $query = "SELECT  a.id 'app_id', a.url, a.name, l.key_ FROM ".$bd.".licenses l, ".$bd.".cat_apps a  where a.id = l.app_id and
                           l.company_id = ? ";
                           $res['apps'] =  DB::select($query, [$res[0]->company_id]);
                           $response = ["status" => "suuccess", "message" => "Logeado con éxito", "data" => $res];
                           $code = 200;
                           Log::info('login...', $data);
                           
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
                    $response = ["status" => "empty", "message" => "Contraseña incorrecta!", "data" => []];
                    $code = 403;
                    Log::warning('login, password de usuario incorrecto', $data);
                    }
                }
                } else {
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
        //     Log::error($e);
        //     $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "data" => $e];
        //     $code = 400;
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


    public function getProfile(Request $request)
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
                      $res = User_Q::selectProfile($bd, $data['id_user']);    
                      if (empty($res))
                       {
                        $response = ["status" => "empty", "message" => "No se llenado su perfil", "data"=> []];
                        $code = 204;
                        Log::warning('Menu no encntrado', $data);
                      }else
                      {
                   
                        $response = ["status" => "success", "message" => "Obteniendo perfil...", "data" => $res];
                        $code = 200;
                     }
                   }else
                   {
                       $code = 401; // FORBIDDEN	
                       Log::alert($isToken);
                      $response = ["status" => "unauthorized", "message" => $isToken, "deta" => []];  
                   }

              } else 
              {
                  $code = 401; // No autorizado
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
            $code = 400;
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
