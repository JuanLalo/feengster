<?php

namespace App\Http\Controllers;

use Log;
use App\Query\Q_api;
use App\Query\User_Q;
use Illuminate\Http\Request;

class ApiController extends Controller
{
  //TODO
  // crear un metodo que te devuelva el nombre de la tabla (codigo de tabla)
  // crear un metodo que devuelva el id de la aplicación por medio de la key de licencia
  //verificar las _key de la tabla licencias ponerlas únicas

  
    public function getData(Request $request)
    {
        //  try
        //      {
                $data = $request->all();
                $isKey = Q_Api::isKey($data['key']);
                if($isKey == 'true'){
                $res = Q_Api::getData(Q_Api::selectBD($data['key']), $data);
                if (empty($res)){
                    $response = ["status" => "empty", "message" => "No se encontraron resultados", "data"=> $res];
                    $code = 403;
               }else{
                     $response = ["data" => $res];
                     $code = 200;
                      }
                   
                }
                else
                 {
                 $code = 403; // ok pero acceseo denagado
                Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "deta" => []];
            
                }
              
        // } catch (\Exception $e) {
        //     Log::error($e);
        //     $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e];
        //     $code = 500;
        // }

        return response()->json($response, $code);

    }


    public function setData(Request $request)
    {
        try
            {
                $data = $request->all();
                $isKey = Q_Api::isKey($data['key']);
                if($isKey == 'true'){
                $res = Q_Api::setData(Q_Api::selectBD($data['key']), $data);
                if ($res){
                    $response = ["status" => "success", "message" => "Se realizó con éxito", "data"=> $res];
                    $code = 200;
               }else{
                $response = ["status" => "error", "message" => "Surgio un error al realizar esta acción", "data"=> $res];
                $code = 403;
                  }   
                }
                else
                 {
                 $code = 403; // ok pero acceseo denagado
                Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "deta" => []];
            
                }
              
        } catch (\Exception $e) {
            Log::error($e);
            $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e];
            $code = 500;
        }

        return response()->json($response, $code);

    }


    public function createRow(Request $request)
    {
     
      try
          {
          
            if (!empty($request->all()))
            {
                $data = $request->all();
                $isKey =Q_Api::isKey($data['key']);
                if($isKey == 'true')
                {
                    $isToken = User_Q::isToken(null, $data['token']);
                    if($isToken == 'true')
                    {
                      $res = Q_Api::smartInsert(Q_Api::selectBD($data['key']), $data['table'], $data['data']);
                      $code = 202; 
                      if($res)
                      {
                        $response = ["status" => "success", "message" => "Registrado con éxito" , "deta" => $res];

                      }
                      else
                      {
                        $response = ["status" => "error", "message" => "No se puede realizar el registro, si cree que se trata de un error comuniquese con el equipo de soporte" , "deta" => $res];
                      }
                    }else
                    {
                        $code = 401;
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
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "deta" => []];
            }
  
            
    } catch (\Exception $e) {
        Log::error($e);
        $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "data" => $e];
        $code = 400;
    }

  
        return response()->json($response, $code);

    }

    
    public function updateRow(Request $request)
    {
     
    //   try
    //       {
          
            if (!empty($request->all()))
            {
                $data = $request->all();
                $isKey =Q_Api::isKey($data['key']);
                if($isKey == 'true')
                {
                    $isToken = User_Q::isToken(null, $data['token']);
                    if($isToken == 'true')
                    {
                      $res = Q_Api::smarUpdate(Q_Api::selectBD($data['key']), $data['table'], $data['id'] , $data['data']);
                      $code = 202; 
                      if($res > 0)
                      {
                        $response = ["status" => "success", "message" => "Se han actualizado con éxito" , "deta" => $res];

                      }
                      else
                      {
                        $response = ["status" => "error", "message" => "ocurrio un error al modificar estos datos" , "deta" => $res];
                      }
                    }else
                    {
                        $code = 401;
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
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "deta" => []];
            }
  
            
    // } catch (\Exception $e) {
    //     Log::error($e);
    //     $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "data" => $e];
    //     $code = 400;
    // }

  
        return response()->json($response, $code);

    }


    public function smartGetData(Request $request)
    {
     
    //   try
    //       {
          
            if (!empty($request->all()))
            {
                $data = $request->all();
                $isKey =Q_Api::isKey($data['key']);
                if($isKey == 'true')
                {
                    $isToken = User_Q::isToken(null, $data['token']);
                    if($isToken == 'true')
                    {
                        $res = Q_Api::smartSelect(Q_Api::selectBD($data['key']), $data);
                          if (empty($res)){
                           $response = ["status" => "empty", "message" => "No se encontraron resultados", "data"=> $res];
                           $code = 403;
                          }
                          else
                          {
                           $response = ["data" => $res];
                           $code = 200;
                          }
                   
                     }
                      else
                     {
                        $code = 401;
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
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "deta" => []];
            }
  
            
    // } catch (\Exception $e) {
    //     Log::error($e);
    //     $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "data" => $e];
    //     $code = 400;
    // }

  
        return response()->json($response, $code);

    }

    
    public function test(Request $request)
    {
        //  try
        //      {
                $data['query'] = "test"; 
                $res = Q_Api::getData("", $data);
                if (empty($res)){
                    $response = ["status" => "empty", "message" => "No se encontraron resultados", "data"=> $res];
                    $code = 403;
               }else{
                     $response = ["data" => $res];
                     $code = 200;
                      }
                   
              
              
        // } catch (\Exception $e) {
        //     Log::error($e);
        //     $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e];
        //     $code = 500;
        // }

        return response()->json($response, $code);

    }


}

