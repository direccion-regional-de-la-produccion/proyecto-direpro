

 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link href="css/pan_p.css" type="text/css" rel="stylesheet"/>
   <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <link rel="stylesheet" href="css/bootstrap-theme.css">
</head>
<body>
  
    <div class="cont">
 <?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
 $connect = mysqli_connect("localhost","root","","bd_dire_2");
//$selectDb= mysqli_select_db($connect,"bd_dire_2");
$email=$_REQUEST["email"];
$query=mysqli_query($connect,"select * from usuarios where correo='$email'");
$row=mysqli_fetch_array($query);


require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';
$mail = new PHPMailer();
  try
  {

  $mail->SMTPDebug = 0;
  $mail->isSMTP();
  $mail->Host = "smtp.gmail.com";
  $mail->SMTPAuth = TRUE;
  $mail->Username = "bot.direpro@gmail.com";
  $mail->Password = "botdirepro1995";
  $mail->SMTPSecure = "false";
  $mail->Port = 587;
  $mail->From = "bot.direpro@gmail.com";
  $mail->FromName = "DIREPRO";
   $mail->addAddress($row["correo"]);
  $mail->isHTML(true);
  $mail->Subject = "Password recuperado";
  $mail->Body = "<i>Tu contraseña es :</i>".$row["password"];
  $mail->AltBody = "Gracias por confiar en nustra Seguridad de Datos";
  $mail->send();
    print("<p>Contraseña enviada a su correo registrado</p>");
  }catch(Exception $e) {
    echo 'Problemas al enviar', $mail->ErrorInfo;
  }
  ?> 
  
      <br>
        <br>
        <br>
        <br>


  <a href="login.php"><i class="glyphicon glyphicon-arrow-left"></i> Regresar al Login</a>
      </div>

<scrip src="js/jquery.min.js"></scrip>
<scrip src="js/bootstrap.min.js"></scrip>
</body>
</html>
