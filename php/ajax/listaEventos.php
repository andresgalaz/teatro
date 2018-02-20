<?php
session_start();
if(!isset($_SESSION['usuario'])){
    // No está conectado
    echo json_encode( (object)array("success"=>false,"message"=>"No está conectado, salga y vuelva a ingresar") );
    exit;
}
$usuario = $_SESSION['usuario'];

define( 'ROOT', '../');
include('../'.ROOT.'config.php');
include(ROOT.'class/db.php');
include(ROOT.'class/sql/evento.php');

$db = new DB();
$rows = (array)(new Evento($db->getConexion()))->getFilas($usuario->fTpUsuario);
$db->close();
$resp = (object)array("success"=>true,"record"=>$rows,"count"=>count($rows));
echo json_encode( $resp );
?>