<?php

namespace App\Http\Controllers;

use Log;
use App\Query\Q_api;
use App\Query\User_Q;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ApiController extends Controller
{
  //TODO
  // crear un metodo que te devuelva el nombre de la tabla (codigo de tabla)
  // crear un metodo que devuelva el id de la aplicación por medio de la key de licencia
  //verificar las _key de la tabla licencias ponerlas únicas

   
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
                    $bd = Q_Api::selectBD($data['key']);
                    $isToken = User_Q::isToken($bd, $data['token']);
                    if($isToken == 'true')
                    {
                      $table =  Q_Api::getTable($data['table_code']); 
                      $generated = Q_Api::generateQueryInsert($bd, $table, $data['data']);
                      $res = DB::insert($generated['query'], $generated['array']);
                      if($res)
                      {
                        $code = 201; 
                        $response = ["status" => "success", "message" => "Registrado con éxito" , "data" => $res];

                      }
                      else
                      {
                        $code = 204; 
                        $response = ["status" => "error", "message" => "No se puede realizar el registro, si cree que se trata de un error comuniquese con el equipo de soporte" , "data" => $res];
                      }
                    }else
                    {
                        $code = 403;
                        Log::alert($isToken);
                        $response = ["status" => "unauthorized", "message" => $isToken, "data" => []];  
                    }     
                   
                }
                else
                 {
                 $code = 401; 
                 Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "data" => []];
            
                }
            }
            else
            {
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "data" => []];
            }
  
            
    } catch (\Exception $e) {
        Log::error($e);
        $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "data" => $e];
        $code = 400;
    }
        return response()->json($response, $code);
    }


    public function createMultipleRow(Request $request)
    {
     
    //   try
    //       {
          
            if (!empty($request->all()))
            {
                $data = $request->all();
                $isKey =Q_Api::isKey($data['key']);
                if($isKey == 'true')
                {
                    $bd = Q_Api::selectBD($data['key']);
                    $isToken = User_Q::isToken($bd, $data['token']);
                    if($isToken == 'true')
                    {  
                      $arrData = $data['data'];
                      $status = false;
                      $completed = false;
                          
                       DB::beginTransaction();
                      for ($i=0; $i < count($arrData); $i++) { 
                             
                        if(!empty($arrData[$i]['fk']))
                        {
                            $currentFK = $arrData[$i]['fk'];

                            foreach ($currentFK as $key => $value) {
                                    $name = $arrData[$i]['fk'][$key]['name'];
                                    $reference = $arrData[$i]['fk'][$key]['reference'];
                                    $value = $arrData[$reference]['id'];
                                    $arrData[$i]['data'][$name] = (string)$value;
                            }
                            
                        }

                        $table = Q_Api::getTable($arrData[$i]['table_code']);    
                        $dataQuery = Q_Api::generateQueryInsert($bd, $table , $arrData[$i]['data']); 
                        $status = DB::insert($dataQuery['query'], $dataQuery['array']);
                         
                        if($arrData[$i]['referenced'] )
                        {
                            $new =  DB::select("SELECT  id FROM $table order by id desc limit 1"); 
                            $arrData[$i]['id'] = $new[0]->id;  
                        }

                        if($status)
                        {
                          $completed = true; 
                        }
                        else
                        {   
                          DB::rollBack();
                          $completed = false;
                          break;
                        }
                      }

                    if($completed)
                      {
                          
                        DB::commit();
                        $code = 201; 
                        $response = ["status" => "success", "message" => "Registrado con éxito" , "data" =>  'completado' ];

                      }
                      else
                      {
                        $code = 204; 
                        $response = ["status" => "error", "message" => "No se puede realizar el registro, si cree que se trata de un error comuniquese con el equipo de soporte" , "data" => $res];
                      }
                    }
                      else
                    {
                        $code = 403;
                        Log::alert($isToken);
                        $response = ["status" => "unauthorized", "message" => $isToken, "data" => []];  
                    }     
                   
                }
                else
                 {
                 $code = 401; 
                 Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "data" => []];
            
                }
            }
            else
            {
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "data" => []];
            }
  
            
    // } catch (\Exception $e) {
    //     Log::error($e);
        
    //     if(substr($e->getMessage(), 9, 5) == '23000')
    //        {
    //          $msg = "Violación de restricción de integridad"; 
    //        }
    //     else
    //        {
    //         $msg = $e->getMessage();
    //        } 

    //     $response = ["status" => "sintaxerror", "message" => $msg, "data" => $e];
    //     $code = 400;
    // }
        return response()->json($response, $code);
    }
       

    
    public function updateRow(Request $request)
    {
     
      try
          {
          
            if (!empty($request->all()))
            {
                $data = $request->all();
                $isKey =Q_Api::isKey($data['key']);
                if($isKey == 'true')
                {
                    $bd = Q_Api::selectBD($data['key']);
                    $isToken = User_Q::isToken($bd, $data['token']);
                    if($isToken == 'true')
                    {

                      $table =  Q_Api::getTable($data['table_code']);   
                      $res = Q_Api::smartUpdate($bd, $table, $data['id'] , $data['data']); 
                      if($res > 0)
                      {
                        $code = 201;
                        $response = ["status" => "success", "message" => "Se han actualizado con éxito" , "data" => $res];

                      }
                      else
                      {
                        $code = 204;
                        $response = ["status" => "error", "message" => "ocurrio un error al modificar estos datos" , "data" => $res];
                      }
                    }else
                    {
                        $code = 403;
                        Log::alert($isToken);
                        $response = ["status" => "unauthorized", "message" => $isToken, "data" => []];  
                    }     
                   
                }
                else
                 {
                 $code = 401; // ok pero acceseo denagado
                Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "data" => []];
            
                }
            }
            else
            {
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "data" => []];
            }
  
            
    } catch (\Exception $e) {
        Log::error($e);
        $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "data" => $e];
        $code = 400;
    }
        return response()->json($response, $code);

    }


    public function deleteRow(Request $request)
    {
     
      try
          {
          
            if (!empty($request->all()))
            {
                $data = $request->all();
                $isKey =Q_Api::isKey($data['key']);
                if($isKey == 'true')
                {
                    $bd = Q_Api::selectBD($data['key']);
                    $isToken = User_Q::isToken($bd, $data['token']);
                    if($isToken == 'true')
                    {
                      $table =  Q_Api::getTable($data['table_code']);
                       // #TODO se da por hecho que se hace un borrado físico
                       // validar pra solo vorrado lógico

                      //$res = Q_Api::smarUpdate($bd, $table, $data['id'] , $data['data']);
                      $res = DB::delete("DELETE FROM $bd.$table WHERE id = ?", [$data['id']]);
                      if($res > 0)
                      {
                        $code = 201;
                        $response = ["status" => "success", "message" => "Se ha eliminado correctamente" , "data" => $res];

                      }
                      else
                      {
                        $code = 409;
                        $response = ["status" => "error", "message" => "No pudimos eliminar este registro.", "datail"=> "Causas probables: \n - Otros recursos dependen de esta información. \n - Error de conexión al servidor." , "data" => $res];
                      }
                    }else
                    {
                        $code = 403;
                        Log::alert($isToken);
                        $response = ["status" => "unauthorized", "message" => $isToken, "data" => []];  
                    }     
                   
                }
                else
                 {
                 $code = 401; // ok pero acceseo denagado
                Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "data" => []];
            
                }
            }
            else
            {
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "data" => []];
            }
  
            
    } catch (\Exception $e) {
        Log::error($e);
        
        if(substr($e->getMessage(), 9, 5) == '23000')
           {
             $msg = "Otros recursos dependen de esta información. Lo sentimos, no podemos eliminarlo."; 
           }
        else
           {
            $msg = "Surgió un error al intetar eliminar estos datos. Lo sentimos, si es posible contacta a atención a clientes.";
           } 

        $response = ["status" => "sintaxerror", "message" => $msg, "data" => $e->getMessage()];
        $code = 400;
    }
        return response()->json($response, $code);

    }


    public function smartGetData(Request $request)
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
                        $res = Q_Api::getData(Q_Api::selectBD($data['key']), $data['data']);
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
                        $response = ["status" => "unauthorized", "message" => $isToken, "data" => []];  
                     }     
                   
                }
                else
                 {
                 $code = 401; // ok pero acceseo denagado
                Log::alert($isKey);
                $response = ["status" => "unauthorized", "message" => $isKey, "data" => []];
            
                }
            }
            else
            {
                $code = 403; // ok pero acceseo denagado
                Log::alert("acceso denagado request no es un json");
                $response = ["status" => "unauthorized", "message" => "Acceso denegado, formato requerido <json>", "data" => []];
            }
  
            
    } catch (\Exception $e) {
        Log::error($e);
        $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "data" => $e];
        $code = 400;
    }

  
        return response()->json($response, $code);

    }


}

