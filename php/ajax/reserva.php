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
include(ROOT.'class/sql/eventoAsiento.php');

if(! isset($_POST["cTextoBoton"]) || ! isset($_POST["pEvento"]) ||! isset($_POST["pAsiento"]) || !isset($_POST["cDescripcion"]) ){
    echo json_encode( (object)array("success"=>false,"message"=>"Errores en el formulario") );
    exit;
}
$cTextoBoton  = $_POST["cTextoBoton"];
if( $cTextoBoton != 'Libera' && $cTextoBoton != 'Reserva' ){
    // No está conectado
    echo json_encode( (object)array("success"=>false,"message"=>"Acción desconocida:"+$cTextoBoton) );
    exit;
}
if( $cTextoBoton == 'Libera' && $usuario->fTpUsuario != Config::TP_USR_ADMIN ){
    // No está conectado
    echo json_encode( (object)array("success"=>false,"message"=>"Usted no tiene el permiso para liberar asientos") );
    exit;
}

$db = new DB();
$eventoAsiento = new EventoAsiento($db->getConexion());
if($cTextoBoton=='Reserva'){
    $regEvAsiento = (object)array(
    "fEvento"      => $_POST["pEvento"],
    "fAsiento"     => $_POST["pAsiento"],
    "fUsuario"     => $usuario->pUsuario,
    "cDescripcion" => $_POST["cDescripcion"]);
    $resp = $eventoAsiento->insert($regEvAsiento);
}
if($cTextoBoton=='Libera'){
    $pEventoAsiento = $_POST["pEventoAsiento" ];
    $resp = $eventoAsiento->delete($pEventoAsiento);
}
$db->commit();
$db->close();
echo json_encode( $resp );
?>