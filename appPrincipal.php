<?php
session_start();
define( 'ROOT', 'php/');
?>
<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='utf-8'>
    <!--[if IE]>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <![endif]-->
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta name='description' content=''>
    <meta name='author' content=''>
    <!-- Favicons Icon -->
    <link rel='icon' href='img/favicon.ico' type='image/x-icon' />
    <link rel='shortcut icon' href='img/favicon.ico' type='image/x-icon' />
    <title>Reservas Asientos Teatro</title>
    <!-- Mobile Specific -->
    <meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1'>
    <!-- Version 4.2.0 -->
    <link href='https://cdn.sencha.com/ext/gpl/4.2.0/resources/ext-theme-neptune/ext-theme-neptune-all.css' rel='stylesheet' />
    <link href='css/asiento.css' rel='stylesheet' type='text/css'>
<?php
include (ROOT.'class/sql/usuario.php');

if(isset($_SESSION['usuario'])){
    $usr = $_SESSION['usuario'];
} else {
    $usr=(new Usuario(null))->vacio();
}
?>
    <script>
        var oGlobal = oGlobal || {};
        oGlobal.depura = true;
        // Nivel usuario administrador
        oGlobal.TP_USR_ADMIN = 9;
        oGlobal.usuario = {
            pUsuario: <?php echo $usr->pUsuario; ?>,
            cUsuario: '<?php echo $usr->cUsuario; ?>',
            cNombre: '<?php echo $usr->cNombre; ?>',
            fTpUsuario: <?php echo $usr->fTpUsuario; ?>,
            cEmail: '<?php echo $usr->cEmail; ?>'
        };
    </script>
</head>

<body>
    <!-- JavaScript -->
    <script src='https://cdn.sencha.com/ext/gpl/4.2.0/ext-all.js'></script>
    <script src='script/globalUtil.js'></script>
<?php if($usr->cUsuario==''){?>
    <!-- No está conectado, debe ingresar usuario/password -->
    <script src='script/loginPanel.js'></script>
    <script src='script/viewLogin.js'></script>
<?php } else { ?>
    <!-- Está conectado, se muestra el menú -->
    <script src="script/eventoPanelWin.js"></script>
    <script src="script/eventoPanelGrilla.js"></script>
    <script src="script/listaAsientoWin.js"></script>
    <script src="script/listaAsiento.js"></script>
    <script src='script/viewMenu.js'></script>
<?php } ?>
</body>

</html>