<?php
session_start();
// Remueve sesiones anteriores
session_unset();
session_destroy();

if(isset($_GET['next'])){
    $next=$_GET['next'];
} else{
    $next='appPrincipal.php';
}
header("Location:$next");
exit;
?>