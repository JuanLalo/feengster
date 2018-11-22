<?php

namespace App\Query;
use Illuminate\Support\Facades\DB;

class Router_Q {


static function selectMenu($bd, $app_id)
        {
         $query = "select c.order_name , m.name 'module', c.android, c.name, c.function_,url, m.icon, print
         from $bd.cat_module m, $bd.app_menus a, $bd. cat_menus c where  m.id = c.id_module and m.`status` = 'ACTIVO'  and c.id = a.id_menu  and c.status = 'ACTIVO' and a.status = 'ACTIVO' and  a.id_app = ? order by m.name";
        
        return DB::select($query, [$app_id]);
                
}

static function selectContent($bd, $token, $id_menu)
        {
           $query = "select m.id 'm_id', m.name 'm_name' , c.name, title, title_desc, url, m.icon , show_   from $bd.cat_module m, $bd.app_menus u, $bd.cat_menus c where  m.id = c.id_module and m.`status` = 'ACTIVO'  and c.id = u.id_menu and c.`status` = 'ACTIVO' and u.`status` = 'ACTIVO' and u.id_menu = ?";
           return DB::select($query, [$id_menu]);
           
                
}









}