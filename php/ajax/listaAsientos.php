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
include(ROOT.'class/sql/teatro.php');

$db = new DB();
if(!isset($_POST['pEvento'])){
    // No está conectado
    echo json_encode( (object)array("success"=>false,"message"=>"Falta el identificador del evento") );
    exit;
}
$prmPEvento=$_POST['pEvento'];

$rows = (new Teatro($db->getConexion()))->getAsientos( $prmPEvento, $usuario->fTpUsuario );
$db->close();
// Convierte a Matriz
$matriz = [[]];
for( $i=0 ; $i < count($rows); $i++){
    $row = $rows[ $i ];
    $nFila = $row['nFila'] -1 ;
    $nColumna = $row['nColumna'] -1 ;
    
    // Limpia objeto row
    unset($row['nFila']);
    unset($row['nColumna']);
    if(is_null($row['cIdFila'])){
        unset($row['cIdFila']);
    }
    if(is_null($row['cIdColumna'])){
        unset($row['cIdColumna']);
    }
    // Lo pasa a la matriz
    $matriz[$nFila][$nColumna] = $row;
}
echo json_encode( (object)array( "success" => true, "message" => "ok", "matriz" => $matriz ));
?>