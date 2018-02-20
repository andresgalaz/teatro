<?php
session_start();
// Obtiene Usuario
if(!isset($_SESSION['usuario'])){
    // No está conectado
    echo json_encode( (object)array("success"=>false,"message"=>"No está conectado, salga y vuelva a ingresar") );
    exit;
}
$usuario = $_SESSION['usuario'];
// Obtiene parámetros GET
if(!isset($_GET['pEvento'])){
    echo json_encode( (object)array("success"=>false,"message"=>"Falta el identificador del evento") );
    exit;
}
$prmPEvento=$_GET['pEvento'];

define( 'ROOT', '../');
include('../'.ROOT.'config.php');
include(ROOT.'class/db.php');
include(ROOT.'class/bajada.php');
include(ROOT.'class/sql/eventoAsiento.php');


$db = new DB();
$filas = (new EventoAsiento($db->getConexion()))->getReservas($prmPEvento);
// Baja las filas como archivo
Bajada::array2csv($filas);
$db->close();

?>