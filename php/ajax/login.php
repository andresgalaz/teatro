<?php
session_start();
// Remueve sesiones anteriores
session_unset();
session_destroy();

// Inicio
session_start();

define( 'ROOT', '../');
include('../'.ROOT.'config.php');
include(ROOT.'class/db.php');
include(ROOT.'class/sql/usuario.php');

// Toma parámetro vía POST
$postCUsuario = $_POST['cUsuario'];
$postCPasssword = $_POST['cPassword'];
if($postCUsuario=='' || $postCPasssword==''){
    echo json_encode( (object) array( 'success' => false, 'message' => 'Faltan datos' ) );
    return;
}

// Consulta tabla Usuario
$db = new DB();
$usr = (new Usuario($db->getConexion()))->getUsuario($postCUsuario);
$db->close();

// Verifica y define las variables de Session
if( $postCPasssword==$usr->cPassword){
    $_SESSION['usuario'] = $usr;
    unset( $usr->cPassword );
    $resp = (object) array( 'success' => true, 'message' => 'Login correcto' );
    $resp->usuario = $usr;
    echo json_encode( $resp );
    return;
}
echo json_encode( (object) array( 'success' => false, 'message' => 'Error en usuario o clave' ) );
?>