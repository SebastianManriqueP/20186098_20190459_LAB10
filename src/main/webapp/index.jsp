<%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 27/06/2022
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- Importando estilos personalizados -->
    <link rel="stylesheet" type="text/css" href="Assets/estilos_d.css">
    <title>Iniciar Sesión Agencia</title>
</head>
<body>
<form class="form-login" style="margin-top: 4%;background-color: black;">
    <div class="container">
        <img src="Assets/img/logo.png" height="230px" width="270px" style="margin-top: 20px;margin-left: 240px;">
    </div>
    <div class="login-container" style="margin-top: -1%;">
        <div class="login-header">
            <h2 style="margin-top: 1%;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;color:white;">Bienvenido Televiajero</h2>
        </div>
        <div class="mb-3">
            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Usuario">
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" placeholder="Contraseña">
        </div>
        <div class="btn-container">
            <button type="submit" class="btn btn-outline-primary" style="border-radius: 20px;">Ingresar</button>
            <a href="#modal1" class="btn-recovery" style="color: blue;"><u>Soy nuevo y quiero registrarme</u></a>
        </div>
    </div>
</form>
</body>
</html>
