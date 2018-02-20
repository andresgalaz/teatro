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

if(! isset($_POST["cTextoBoton"]) || ! isset($_POST["pEvento"])  || ! isset($_POST["dFecha"]) ||! isset($_POST["tHora"]) ){
    echo json_encode( (object)array("success"=>false,"message"=>"Errores en el formulario") );
    exit;
}
$cTextoBoton  = $_POST["cTextoBoton"];
if( $cTextoBoton != 'Crea' && $cTextoBoton != 'Cierra'  && $cTextoBoton != 'Re-abre'){
    // No está conectado
    echo json_encode( (object)array("success"=>false,"message"=>"Acción desconocida: ".$cTextoBoton) );
    exit;
}
if( $cTextoBoton == 'Libera' && $usuario->fTpUsuario != Config::TP_USR_ADMIN ){
    // No está conectado
    echo json_encode( (object)array("success"=>false,"message"=>"Usted no tiene el permiso para liberar asientos") );
    exit;
}
$pEvento  = $_POST["pEvento"];
// La fecha viene en 2 campos, se debe unir en uno solo
$dFecha = new DateTime( $_POST["dFecha"] );
$tHora  = new DateTime( $_POST["tHora"] );
$tFecha = new DateTime($dFecha->format('Y-m-d') . ' ' .$tHora->format('H:i:s'));

$db = new DB();
$evento = new Evento($db->getConexion());
if($cTextoBoton=='Crea'){
    $regEv = (object)array( "tFecha" => $tFecha->format('Y-m-d H:i:s') );
    $resp = $evento->insert($regEv);
}
if($cTextoBoton=='Cierra'){
    $resp = $evento->cierra($pEvento);
}
if($cTextoBoton=='Re-abre'){
    $resp = $evento->abre($pEvento);
}
$db->commit();
$db->close();
echo json_encode( $resp );
?>