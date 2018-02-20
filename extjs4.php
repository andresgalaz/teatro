<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicons Icon -->
    <link rel="icon" href="img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <title>Reservas Asientos Teatro</title>
    <!-- Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Version 4.2.0 -->
    <link href="http://cdn.sencha.com/ext/gpl/4.2.0/resources/ext-theme-neptune/ext-theme-neptune-all.css" rel="stylesheet" />
    <link href='css/asiento.css' rel='stylesheet' type='text/css'>
</head>

<body class="inner-page">
    <header id='titulo' style='width:100%;'>
    </header>
    <div>
        <?php include('php/view/listaAsientos.php');?>
    </div
    <!-- JavaScript -->
    <script src="http://cdn.sencha.com/ext/gpl/4.2.0/ext-all.js"></script>
    <script src="script/listaAsiento.js"></script>
</body>

</html>