
<?php

 session_start();
    if(!isset($_SESSION['id_tipo'])){
        header('location: login.php');
    }else{
        if($_SESSION['id_tipo'] != 2){
            header('location: login.php');
        }
    }

    $active_facturas="active";
    $active_productos="";
    $active_clientes="";
    $active_usuarios="";
    $title="Empresa";
?>
   
<!DOCTYPE html>
<html lang="en">
  <head>
    <?php include("head.php");?>

  </head>
  <body>
    <?php
    include("navbar_user.php");
    ?>
    <div class="container">
        <div class="panel panel-info">
        <div class="panel-heading">
            <div class="btn-group pull-right">
                <a  href="nueva_factura.php" class="btn btn-info"><span class="glyphicon glyphicon-plus" ></span> Nueva Factura</a>
            </div>
            <h4><i class='glyphicon glyphicon-search'></i> Buscar Facturas</h4>
        </div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" id="datos_cotizacion">

                        <div class="form-group row">
                            <label for="q" class="col-md-2 control-label">Empresa</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="q" placeholder="Nombre de la Empresa o # de factura" onkeyup='load(1);'>
                            </div>



                            <div class="col-md-3">
                                <button type="button" class="btn btn-default" onclick='load(1);'>
                                    <span class="glyphicon glyphicon-search" ></span> Buscar</button>
                                <span id="loader"></span>
                            </div>

                        </div>



            </form>
                <div id="resultados"></div><!-- Carga los datos ajax -->
                <div class='outer_div'></div><!-- Carga los datos ajax -->
            </div>
        </div>

    </div>
    <hr>
    <?php
    include("footer.php");
    ?>
   <!--<script type="text/javascript" src="js/VentanaCentrada.js"></script>-->
   <!-- <script type="text/javascript" src="js/facturas.js"></script>-->
  </body>
</html>