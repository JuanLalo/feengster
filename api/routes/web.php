<?php

/*
|--------------------------------------------------------------------------|
| Application Routes                                                       |
| Desarrollador:  Ing. Juan Eduardo Rosales Rosales                        |
| Powered by: Laravel                                                |
|--------------------------------------------------------------------------|
*/

header('Access-Control-Allow-Origin: *');


// General
$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('/test', ['uses' => 'ApiController@test']); 


/* Repositorio de APIS: */

/* 200 OK	Solicitud aceptada; 
201 CREATED	la respuesta e indica que se ha creado un recurso
204 NO CONTENT	Indica que se ha aceptado la solicitud, pero no había datos para devolver. 
205 Reset Content The server successfully processed the request, but is not returning any content. Unlike a 204 response, this response requires that the requester reset the document view
 400 BAD REQUEST	La solicitud no fue válida.
401 UNAUTHORIZED (logout)	El servidor de aplicaciones devuelve este código de respuesta cuando está habilitada la seguridad y faltaba la información de autorización en la solicitud.
403 FORBIDDEN (No se muetsra info.)	Indica que el cliente ha intentado acceder a un recurso al que no tiene acceso. 
*/


/* 
WS genericos de acceso directo a escritura u lectura a BD´s
/gnc/write/setData   ?table=&[$datos]
/gnc/show/getData    ?Query= ""
/gnc/delete/         ?table=&id=
/gnc/change/         ?table=&name=&value=&id
*/



// Usuario:
$router->post('/user/getByType', ['uses' => 'UserController@getUsersByType']); // crear usuario
$router->post('/user/create', ['uses' => 'UserController@createUser']); // crear usuario
$router->post('/login', ['uses' => 'UserController@login']); // loginget
$router->post('/user/getProfile', ['uses' => 'UserController@getProfile']); // login
$router->post('/user/getTeams', ['uses' => 'UserController@getTeams']); // login


//Router:
$router->post('/router/getMenu', ['uses' => 'RouterController@getMenu']); 
$router->post('/router/getContent', ['uses' => 'RouterController@getContent']); 
$router->get('/router/get/data', ['uses' => 'ApiController@getData']); 
//$router->get('/router/get/data', ['uses' => 'ApiController@getData']); 

//generico
$router->get('/get/data', ['uses' => 'ApiController@getData']); 
$router->post('/router/set/data', ['uses' => 'ApiController@setData']);


//smart
$router->get('/get/smart/request', ['uses' => 'ApiController@smartGetData']); 
$router->post('/get/smart/request', ['uses' => 'ApiController@smartGetData']); 
$router->post('/new/smart/request', ['uses' => 'ApiController@createRow']);
$router->post('/update/smart/request', ['uses' => 'ApiController@updateRow']);


// mySypport
$router->post('/ticket/createTicket', ['uses' => 'TicketController@createTicket']);
$router->get('/ticket/getTickets', ['uses' => 'TicketController@getTickets']); 
$router->get('/ticket/getTicketById', ['uses' => 'TicketController@getTicketById']); 
$router->get('/ticket/sendLogTicket', ['uses' => 'TicketController@sendLogTicket']); 





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
