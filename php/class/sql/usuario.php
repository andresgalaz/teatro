<?php
include (ROOT.'class/sql.php');
class Usuario extends Sql {
    
    function vacio(){
        return (object)array(
        "pUsuario" =>  0, "fTpUsuario" => 0, "cUsuario" => '',
        "cPassword" => '', "cNombre" => '', "cEmail" => ''
        );
    }
    
    function getUsuario($prmCUsuario){
        $cSql="SELECT u.* "
        ."  FROM tUsuario u "
        ." WHERE u.cUsuario = '$prmCUsuario' ";
        
        return (object)parent::getFila($cSql);
    }
}
?>