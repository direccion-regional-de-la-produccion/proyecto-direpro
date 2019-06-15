<?php
    //include_once 'database.php';

    require_once(__DIR__."/Configuracion/Conexion_BD.php");
    
    session_start();
    if(isset($_GET['cerrar_sesion'])){
        session_unset(); 
        // destroy the session 
        session_destroy(); 
    }
    
    if(isset($_SESSION['id_tipo'])){
        switch($_SESSION['id_tipo']){
            case 1:
                header('location:Form_Admin.php');
            break;
            case 2:
            header('location: Form_Usuario.php');
            break;
            default:
        }
    }
    if(isset($_POST['usuario']) && isset($_POST['password'])){
        $username = $_POST['usuario'];
        $password = $_POST['password'];
        $db = new Database();
        $query = $db->connect()->prepare('SELECT *FROM usuarios WHERE usuario = :usuario AND password = :password');
        $query->execute(['usuario' => $username, 'password' => $password]);
        $row = $query->fetch(PDO::FETCH_NUM);
        
        if($row == true){
            $rol = $row[5];
            
            $_SESSION['id_tipo'] = $rol;
            switch($rol){
               case 1:
                header('location:Form_Admin.php');
            break;
            case 2:
            header('location: Form_Usuario.php');
            break;
            default:
            }
        }else{
            // no existe el usuario
            echo "Nombre de usuario o contraseña incorrecto";
        }
        
    }
?>
    

    <!DOCTYPE html>
<html lang="es">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <title>Login</title>
    <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <!-- CSS  -->
   <link href="css/ing.css" type="text/css" rel="stylesheet"/>
</head>
<body>


 <div class="container">
        <div class="card card-container">

        
    
    </form action="#" method="POST">



            <img id="profile-img" class="profile-img-card" src="img/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form method="post" accept-charset="utf-8" action="login.php" name="loginform" autocomplete="off" role="form" class="form-signin">
            
                <span id="reauth-email" class="reauth-email"></span>
                <input class="form-control" placeholder="Usuario" name="usuario" type="text" value="" autofocus="" required>
                <input class="form-control" placeholder="Contraseña" name="password" type="password" value="" autocomplete="off" required>
                <button type="submit" class="btn btn-lg btn-success btn-block btn-signin">Iniciar Sesión</button>
                         <center> <a href="panel.html"><i class="glyphicon glyphicon-arrow-left"></i> Regresar</a></center>

            <center><a href="email_password.php">¿Se te ha olvidado la contraseña?</a></center>
            </form><!-- /form -->

        </div><!-- /card-container -->
    </div><!-- /container -->

   
  </body>
</html>
