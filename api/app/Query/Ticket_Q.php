<?php

namespace App\Query;
use Illuminate\Support\Facades\DB;

class Ticket_Q {

static function newTicket($bd, $data){
        $query= "INSERT INTO ".$bd.".tickets
                (`id_user_created`,  
                `id_user_resolve`, 
                `id_user_cc`,
                `name`,
                `id_product`,
                `category`,
                `team`,
                `id_team`,
                `des`,
                `type`,
                `priority`,
                `status`, `files`)
                VALUES 
                (?, ?, ?,
                 ?, ?, ?,
                 ?, ?, ?,
                 ?, ?, ?, ?);";

        return DB::insert($query, $data);
}

static function getTicketByStatus($bd, $data)
        {
        $query = "SELECT * FROM ".$bd.".tickets WHERE status = ? and (id_user_created = ?  or  id_user_resolve =? or id_user_cc =? ) ";
        return DB::select($query, $data);
}
static function getTicketById($bd, $data)
        {
        $query = "SELECT * FROM ".$bd.".tickets t WHERE t.id = ?";
        return DB::select($query, $data);
}

static function createTicketLog($bd, $data){
        $query= "INSERT INTO `log_ticket` (`id_ticket`, `id_user`, `time`, `desc`) VALUES (?, ?, ?, ?)";
        return DB::insert($query, $data);
}




}