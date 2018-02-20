<?php
include (ROOT.'class/sql.php');
class Evento extends Sql {
    
    function getFilas($fTpUsuario){
        if( $fTpUsuario == Config::TP_USR_ADMIN) {
            $cSql = "SELECT e.* FROM tEvento e limit 100";
        } else {
            $cSql = "SELECT e.* FROM tEvento e where bAbierto='1' ";
        }
        return (object)parent::getFilas($cSql);
    }

    function insert($reg){
        return parent::insert('tEvento',$reg);
    }

    function updateBAbierto($pEvento, $bAbierto){
        $data = (object)array("bAbierto" => $bAbierto);
        $llave = (object)array("pEvento" => $pEvento);
        return (object)parent::update('tEvento', $data, $llave);
    }
    function cierra($pEvento){
        return $this->updateBAbierto($pEvento,0);
    }

    function abre($pEvento){
        return $this->updateBAbierto($pEvento,1);
    }
    
}
?>