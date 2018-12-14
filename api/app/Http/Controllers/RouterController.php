<?php
namespace App\Http\Controllers;


use App\Query\Router_Q;
use App\Query\User_Q;
use App\Query\smartApi;
// para recibir los parametros como el extrat_request
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Log;

class RouterController extends Controller
{

   
    public function getMenu(Request $request)
    {
        
    //  try
    //     {
          
            $data = $request->all();
            $isKey = smartApi::isKey($data['key']);
                
             if($isKey == 'true')
             {
                 $bd = smartApi::selectBD($data['key']);
                 $isToken = User_Q::isToken($bd, $data['token']);
                    if($isToken == 'true')
                    {
                       $res = Router_Q::selectMenu($bd, smartApi::appId($data['key']));
                       if (empty($res))
                       {
                            $response = ["status" => "empty", "message" => "No se econtraró menú asignado", "data"=> $res];
                            $code = 200;
                            Log::warning('Menu no encntrado', $data);

                       } else 
                       {   
                            $response = ["status" => "success", "message" => "Obteniendo menú...", "data" => $res];
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
      
                
        // } catch (\Exception $e) {
        //     Log::error($e);
        //     $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e];
        //     $code = 400;
        // }

        return response()->json($response, $code);

    }
    
    public function getContent(Request $request)
    {
        
     try
        {
        if (!empty($request->all()))
        {
            $data = $request->all();
            $isKey = smartApi::isKey($data['key']);
                
             if($isKey == 'true')
             {
                 $bd = smartApi::selectBD($data['key']);
                 $isToken = User_Q::isToken($bd, $data['token']);
                    if($isToken == 'true')
                    {
                        
                       $res = Router_Q::selectContent($bd, $data['token'], $data['data']['id_menu']);
                       if (empty($res))
                       {
                            $response = ["status" => "empty", "message" => "No tiene permiso para ingresar a este contenido", "data"=> $res];
                            $code = 403;
                            Log::warning('Menu no encntrado', $data);

                       } else 
                       {   
                            $response = ["status" => "success", "message" => "Obteniendo cntenido...", "data" => $res];
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
                $code = 401; // 
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, Se ha activado el control de seguridad.", "deta" => []];
            
                
         }
      
                
        } catch (\Exception $e) {
            Log::error($e);
            $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e->getMessage()];
            $code = 400;
        }

        return response()->json($response, $code);

    }

}
