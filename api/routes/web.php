<?php

/*
|--------------------------------------------------------------------------|
| Repositorio de rutas de API´s                                            |
| Desarrollador:  Ing. Juan Eduardo Rosales Rosales                        |
| Powered by: Laravel Lumen 2018                                           |
|--------------------------------------------------------------------------|
*/

header('Access-Control-Allow-Origin: *');

$router->get('/', function () use ($router) {
    return $router->app->version();
});


#region Smart
$router->post('/get/smart/request', ['uses' => 'Controller@smartGetData']); 
$router->post('/new/smart/request', ['uses' => 'Controller@createRow']);
$router->post('newMultiple/smart/request', ['uses' => 'Controller@createMultipleRow']);
$router->post('/update/smart/request', ['uses' => 'Controllerroller@updateRow']);
$router->post('/delete/smart/request', ['uses' => 'Controller@deleteRow']);
#endregion

#region User
$router->post('/user/getByType', ['uses' => 'UserController@getUsersByType']); // crear usuario
$router->post('/user/create', ['uses' => 'UserController@createUser']); // crear usuario
$router->post('/login', ['uses' => 'UserController@login']); // loginget
$router->post('/user/getUserInformation', ['uses' => 'UserController@getUserInformation']); // login
$router->post('/user/getTeams', ['uses' => 'UserController@getTeams']); // login
#endregion

#region Router
$router->post('/router/getMenu', ['uses' => 'RouterController@getMenu']); 
$router->post('/router/getContent', ['uses' => 'RouterController@getContent']); 
$router->get('/router/get/data', ['uses' => 'Controller@getData']); 
//$router->get('/router/get/data', ['uses' => 'ApiController@getData']); 
#endregion

#region LAB 
    // rutes here
#endregion

#region Beauty
    // rutes here
#endregion

#region Dental 
    // rutes here
#endregion

#region Events 
    // rutes here
#endregion

#region Financial 
    // rutes here
#endregion

#region Forsale 
    // rutes here
#endregion

#region Laudry 
    // rutes here
#endregion

#region Pet 
    // rutes here
#endregion

#region Support 
    // rutes here
#endregion


#region Eliminar
//generico
$router->get('/get/data', ['uses' => 'apiController@getData']); 
$router->post('/router/set/data', ['uses' => 'apiController@setData']);

// mySypport
$router->post('/ticket/createTicket', ['uses' => 'TicketController@createTicket']);
$router->get('/ticket/getTickets', ['uses' => 'TicketController@getTickets']); 
$router->get('/ticket/getTicketById', ['uses' => 'TicketController@getTicketById']); 
$router->get('/ticket/sendLogTicket', ['uses' => 'TicketController@sendLogTicket']); 

#endregion


/* 
Log::emergency($error);
Log::alert($error);
Log::critical($error);
Log::error($error);
Log::warning($error);
Log::notice($error);
Log::info($error);
Log::debug($error);
*/


/*      |------------------------------------------------------------------------------------------------------|
        |---------------------------  Códigos HTTP Usados por FEENGSER 2018  ---------------------------------|
        |------------------------------------------------------------------------------------------------------|
        |                                                                                                      |            
        |    1-> 200   [OK]  Solicitud aceptada y procesada correctamente.                                     |
        |                                                                                                      |                         
        |    2-> 201   [CREATED]	la respuesta e indica que se ha creado un recurso.                         |         
        |                                                                                                      |             
        |    3-> 204   [NO CONTENT]	Indica que se ha aceptado la solicitud, pero no había datos para devolver. |
        |                                                                                                      |             
        |    3-> 205   [Reset Content] The server successfully processed the request, but is not returning any |
        |                               content. Unlike a 204 response, this response requires that the        | 
        |                               requester reset the document view                                      | 
        |                                                                                                      |
        |    4-> 400   [BAD REQUEST]	La solicitud no fue válida.                                            |     
        |                                                                                                      |         
        |    5-> 401   [UNAUTHORIZED] NO tienes persmisos. El servidor de aplicaciones devuelve este código de |
        |                               respuesta cuando está habilitada la seguridad y faltaba la información |
        |                                de autorización en la solicitud.                                      | 
        |                                                                                                      | 
        |    6-> 403   [FORBIDDEN]    (logout) Indica que el cliente ha intentado acceder a un recurso al que  | 
        |                                no tiene acceso.                                                      |                     
        |                                                                                                      |         
        |    7-> 408   [Request Timeout] El cliente falló al continuar la petición - excepto durante la        | 
        |                                ejecución de videos Adobe Flash cuando solo significa que el usuario  | 
        |                                cerró la ventana de video o se movió a otro.                          | 
        |                                                                                                      | 
        |    8-> 409   [Conflict]  Indica que la solicitud no pudo ser procesada debido a un conflicto con el  | 
        |                           estado actual del recurso que esta identifica.                             | 
        |                                                                                                      |  
        |------------------------------------------------------------------------------------------------------|
        |--------------  Es de suma importancia respetar y hacer uso adecuado de cada código http ya  ---------|
        |--------------      que sirve para notificar a nuestros usuario el estado de sus procesos   ----------|
        |------------------------------------------------------------------------------------------------------|







*/
