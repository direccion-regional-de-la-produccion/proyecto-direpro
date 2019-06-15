

    <!DOCTYPE html>
<html lang="es">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <title>Login</title>
    <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <!-- CSS  -->
   <link href="css/ing_pass.css" type="text/css" rel="stylesheet"/>
</head>
<body>


 <div class="container">
        <div class="card card-container">

         <form method="post" accept-charset="utf-8" action="mail.php" name="loginform" autocomplete="off" role="form" class="form-signin" >
         <input class="form-control" placeholder="              Ingresar Email" name="email" type="text" value="" autofocus="" required>
         <br>
    
         <center> <button type="submit" name="submit" value="submit" class="btn btn-lg btn-success btn-block btn-signin">Enviar Email</button></center>

         <center> <a href="login.php"><i class="glyphicon glyphicon-arrow-left"></i> Regresar al Login</a></center>
        
        </form>   
           
        </div><!-- /card-container -->
    </div><!-- /container -->

   
  </body>
</html>