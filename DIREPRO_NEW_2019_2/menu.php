<?php
  if (isset($title))
  {
?>
<nav class="navbar navbar-default ">
<div class="container-fluid">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>




    <img src='img/log_1.png' width="50px" height="50px" type="image/png">



    <a class="navbar-brand" href="#">Sistema de Control de Pago - DIREPRO</a>


  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
          <li class="<?php echo $active_clientes;?>"><a href="empresa.php"><i class='glyphicon glyphicon-user'></i> Empresas</a></li>
     </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="http://www.regionancash.gob.pe/" target='_blank'><i class='glyphicon glyphicon-envelope'></i> Gobierno Regional </a></li>
  <li><a href="panel.html"><i class='glyphicon glyphicon-off'></i> Salir</a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
</div><!-- /.container-fluid -->
</nav>
<?php
  }
?>
