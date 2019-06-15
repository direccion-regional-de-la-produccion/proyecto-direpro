











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

         <form method="post" accept-charset="utf-8" action="mail.php" name="loginform" autocomplete="off" role="form" class="form-signin" >
         <input class="form-control" placeholder="Email o Usuario" name="email" type="text" value="" autofocus="" required>
         <br>
          <br>
       

          <button type="submit" name="submit" value="submit" class="btn btn-lg btn-success btn-block btn-signin">Enviar Email</button>


         <input type="submit" name="submit" value="submit">
         <center> <a href="login.html"><i class="glyphicon glyphicon-arrow-left"></i> Regresar</a></center>
        <a href="Login.php">Regresar Login</a>
        </form>




    
    </form action="#" method="POST">



          
            
            <form method="post" accept-charset="utf-8" action="login.php" name="loginform" autocomplete="off" role="form" class="form-signin">
            
                <span id="reauth-email" class="reauth-email"></span>
                <input class="form-control" placeholder="Usuario" name="usuario" type="text" value="" autofocus="" required>
                <input class="form-control" placeholder="Contraseña" name="password" type="password" value="" autocomplete="off" required>
                <button type="submit" class="btn btn-lg btn-success btn-block btn-signin">Iniciar Sesión</button>
                         

            <center><a href="imail_password.php">¿Se te ha olvidado la contraseña?</a></center>
            </form><!-- /form -->

        </div><!-- /card-container -->
    </div><!-- /container -->

   
  </body>
</html>