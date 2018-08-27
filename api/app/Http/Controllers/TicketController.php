<?php
namespace App\Http\Controllers;

use App\Query\User_Q;
use App\Query\Ticket_Q;
use App\Query\Q_Api;
// para recibir los parametros como el extrat_request
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Log;

class TicketController extends Controller
{

    public function createTicket(Request $request)
    {
        try
            {
            if (!empty($request->all()))
            {
                $data = $request->all();
                Q_Api::isKey($data['key']);
                $ticket = [$data['solicita'], $data['recibe'], $data['copia'],
                           $data['nombre'], $data['producto'], $data['categoria'],
                           $data['equipo'], $data['id_equipo'], $data['des'],
                           $data['tipo'], $data['prioridad'], $data['status'], json_encode($data['files'])];
                $bd = Q_Api::selectBD($data['key']);
                Ticket_Q::newTicket($bd, $ticket);
                $response = ["status" => "success", "message" => "¡Creado con éxito!",
                 "deta" => []];
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
            $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "data" => $data];
            $code = 500;
        }

        return response()->json($response, $code);

    }



    public function getTickets(Request $request)
    {
        try
            {
                $data = $request->all();
                $isKey = Q_Api::isKey($data['key']);
                if($isKey == 'true'){
                    $terms = [$data['status'], $data['user_id'], $data['user_id'], $data['user_id'] ];
                $res = Ticket_Q::getTicketByStatus(Q_Api::selectBD($data['key']), $terms);
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
              
        } catch (\Exception $e) {
            Log::error($e);
            $response = ["status" => "sintaxerror", "message" => "Error de sintaxis en el servidor", "deta" => $e];
            $code = 500;
        }

        return response()->json($response, $code);

    }

    
    public function getTicketById(Request $request)
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
                    $terms = [$data['id']];
                    $res = Ticket_Q::getTicketById($bd , $terms);
                    
                if (empty($res)){
                    $response = ["status" => "empty", "message" => "Ticket no encontrado, tal vez no está habilitada su gestión", "data"=> $res];
                    $code = 205;
               }else{
                     $response = ["data" => $res];
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

    public function sendLogTicket(Request $request)
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
                    $terms = [$data['id_ticket'], $data['id_user'], $data['time'], $data['desc']];
                    $res = Ticket_Q::createTicketLog($bd , $terms);

                       $code = 202; 
                       Log::alert($isToken);
                       $response = ["status" => "seccess", "message" => "Gestión agregada con éxito" , "deta" => $res];

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
                        $code = 204; // 
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




    public function uploadFile(Request $request)
    {
        $data = $request->all();
        
if(!empty($data)){
    //generate unique file name
    $fileName = time().'_'.basename($_FILES["file"]["name"]);
    
    //file upload path
    $targetDir = "uploads/";
    $targetFilePath = $targetDir . $fileName;
    
    //allow certain file formats
    $fileType = pathinfo($targetFilePath,PATHINFO_EXTENSION);
    $allowTypes = array('jpg','png','jpeg','gif');
    
    if(in_array($fileType, $allowTypes)){
        //upload file to server
        if(move_uploaded_file($_FILES["file"]["tmp_name"], $targetFilePath)){
            //insert file data into the database if needed
            //........
            $response['status'] = 'ok';
        }else{
            $response['status'] = 'err';
        }
    }else{
        $response['status'] = 'type_err';
    }
    
    //render response data in JSON format
    echo json_encode($response);
}

} 

}