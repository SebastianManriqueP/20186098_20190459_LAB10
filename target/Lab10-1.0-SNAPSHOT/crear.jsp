<%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 27/06/2022
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="indicador2" scope="session" type="java.lang.String" class="java.lang.String"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Registro</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="Assets/estilos_d.css">
</head>
<body>
<form class="form-login" method="post" action="<%=request.getContextPath()%>/CrearServlet" style="width: 80%; margin-left: 10%; margin-top: 3%;">
    <div class="container">
        <div class="row">
            <div class="col"style="margin-left: -1%;">
                <div>
                    <img src="Assets/img/logo.png" width="170" height="110" style="margin-left: 3%;margin-top:3%;border-radius: 3px;">
                </div>
            </div>
            <div class="col" style="margin-right: -1%;">
                <div class="close-container">
                    <a href="<%=request.getContextPath()%>/IndexServlet" class="close-login" style="background-color: #484848;width: 10%;height:35px">X</a>
                </div>
            </div>
        </div>
    </div>

    <div class="login-container" style="margin-top: -2%;">
        <div class="login-header">
            <h3 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;color: darkgreen;">Televiajes PUCP</h3>
            <h2 style="margin-top: 1%;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;color: rgb(16, 16, 115);">Registro</h2>
        </div>
        <div class="container" style="margin-top: 3%;">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label class="form-label">Nombres: (*)</label>
                        <input type="text" name = "nombre"class="form-control" aria-describedby="emailHelp" required>
                    </div>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label class="form-label">Apellidos: (*)</label>
                        <input type="text"  name = "apellido"class="form-control" aria-describedby="emailHelp" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label  class="form-label" >Edad: (*)</label>
                        <input type="number" name = "edad" class="form-control" min="18" max="29" title="ingrese su Edad" required>
                    </div>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label  class="form-label">Código PUCP: (*)</label>
                        <input type="tel"  name = "codigo"class="form-control" maxlength="8" minlength="8" pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" title="ingrese su código PUCP" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label  class="form-label" >Correo: (*)</label>
                        <input type="email"  name = "correo"class="form-control"  title="ingrese su Correo" required>
                    </div>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label class="form-label">Especialidad: (*)</label>
                        <select
                                class="form-select form-select-sm"
                                name="especialidad"
                                aria-label=".form-select-sm example"
                        >
                            <option disabled>
                                Selecciona el género
                            </option>
                            <option value="1">
                                Ingeniería de Telecomunicaciones
                            </option>
                            <option value="2">
                                Ingeniería Electrónica
                            </option>
                            <option value="3">
                                Ingeniería Informática
                            </option>
                            <option value="4">
                                Ingeniería Industrial
                            </option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Ingrese nueva contraseña:</label>
                        <input type="password" name="contra" class="form-control" id="exampleInputPassword1" required>
                    </div>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label for="exampleInputPassword2" class="form-label">Confirmar nueva contraseña:</label>
                        <input type="password" name="copia"class="form-control" id="exampleInputPassword2" required>
                    </div>
                </div>
            </div>
        </div>
        <%if (session.getAttribute("indicador2").equals("error")){%>
        </br>
        <div class="text-danger nb-2">
            Existe error en alguno de los campos rellenados!!!
        </div>
        <%session.removeAttribute("indicador2");%>
        <%}%>
        <div class="btn-container" id="divcont">
            <button type="submit" class="btn btn-success" style="width: 280px;" >Continuar</button>
        </div>

    </div>
</form>
</body>
</html>