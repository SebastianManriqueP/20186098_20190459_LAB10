<%@ page import="com.example.Beans.BViaje" %>
<%@ page import="java.time.ZonedDateTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaVuelos" scope="request" type="java.util.ArrayList<com.example.Beans.BViaje>"/>
<jsp:useBean id="gastoTotal" scope="request" type="java.lang.Float"/>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.Beans.Usuario" class="com.example.Beans.Usuario"/>
<jsp:useBean id="errorBorrar" scope="session" type="java.lang.String" class="java.lang.String"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- Importando estilos personalizados -->
    <link rel="stylesheet" type="text/css" href="Assets/estilos_d.css">
    <title>Menu Principal</title>
</head>
<% String condicion = "Normal";
    String colorNav = "navbar-light bg-primary";
    if(gastoTotal >= 100 && gastoTotal < 1000 ) {
        condicion = "Silver";
        colorNav = "navbar-light bg-light";
    }else if(gastoTotal >= 1000 && gastoTotal < 10000 ) {
        condicion = "Gold";
        colorNav = "navbar-light\" style=\"background-color: #ffc107;";
    }else if(gastoTotal >= 1000) {
        condicion="Platinium";
        colorNav = "navbar-dark bg-dark";
    }%>


<nav class="navbar navbar-expand-lg <%=colorNav%>">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/ViajeServlet">Agencencia de viajes</a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Condicion: <%=condicion%>  ------ Total gastado:<%=gastoTotal%></a>
                </li>
            </ul>
            <form class="d-flex">
                <a class="navbar-brand" aria-current="page" href="#"><%=usuarioSesion.getNombre()%> <%=usuarioSesion.getApellido()%></a>
                <a class="btn btn-outline-danger" href="<%=request.getContextPath()%>/LoginServlet?finish=yes"type="submit">Cerrar Sesion</a>
            </form>
        </div>
    </div>
</nav>
<br>
</br>

<div class="container">
    <!--Carusel de Fotos-->
    <div class="card bg-dark text-black">
        <img src="Assets/img/Banner.jpg" class="card-img" alt="...">
        <div class="card-img-overlay">
            </br>
            </br>
            </br>
            </br>
            <h3 class="card-title "><b>Disfruta de los mejores viajes</b></h3>
            <p class="card-text">exclusivamente para alumnos de Telecomunicaciones</p>
        </div>
    </div>
    <!-------------------------->
    <div class="card">

    </br>
    <div class="d-flex">
        <div class="p-2 flex-grow-1 bd-highlight"><h1> Mis Viajes:</h1></div>
        <div class="p-2 bd-highlight">
            <form method="post" action="<%=request.getContextPath()%>/ViajeServlet?a=buscar" >
                <div class="input-group mb-3">
            <input class="form-control me-2" type="search" placeholder="Buscar por ciudad" aria-label="Search" aria-describedby="button-addon2" name="textoABuscar">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg></button>
                </div></form></div>
        <div class="p-2 bd-highlight"><button class="btn btn-outline-success" type="button" data-bs-toggle="modal" data-bs-target="#ModalCrear">Crear viaje</button></div>
    </div>
        <%if (session.getAttribute("errorBorrar").equals("errorBorrar")){%>
        </br>
        <div class="text-danger nb-2">
            No se eliminó con éxito!!!
        </div>
        <%session.removeAttribute("errorBorrar");%>
        <%}%>
        <div class="card-body">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id viaje</th>
            <th scope="col">Fecha reserva</th>
            <th scope="col">Fecha vuelo</th>
            <th scope="col">Origen</th>
            <th scope="col">Destino</th>
            <th scope="col">Seguro</th>
            <th scope="col">N° Boletos</th>
            <th scope="col">Costo</th>
        </tr>
        </thead>
        <tbody>
        <%for (BViaje viaje : listaVuelos){%>
        <tr>
            <td><%=viaje.getIdViaje()%></td>
            <td><%=viaje.getFechaReserva()%></td>
            <td><%=viaje.getFechaViaje()%></td>
            <td><%=viaje.getCiudadOrigen()%></td>
            <td><%=viaje.getCiudadDestino()%></td>
            <td><%=viaje.getEmpresa()%></td>
            <td><%=viaje.getBoletos()%></td>
            <td><%=viaje.getCosto()%></td>
            <td>
                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#ModalEditar<%=viaje.getIdViaje()%>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path>
                    </svg>
                    <span class="visually-hidden">Button</span>
                </button>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#ModalBorrar<%=viaje.getIdViaje()%>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"></path>
                    </svg>
                </button>
            </td>
        </tr>

                <!-- Modal EDITAR-->
                <div class="modal fade" id="ModalEditar<%=viaje.getIdViaje()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" >Editar viaje <%=viaje.getIdViaje()%></h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form method="POST" action="<%=request.getContextPath()%>/ViajeServlet?a=editar" >
                                <div class="modal-body">
                                    </br>
                                    <div class="input-group mb-3">
                                        <label for="date">Fecha de vuelo:  </label>
                                        <input type="date"  name="fecha" value="<%=viaje.getFechaViaje()%>">
                                    </div>

                                    <div class="input-group mb-3">
                                        <label for="date">Ciudad origen:  </label>
                                        <input type="text" class="form-control" placeholder="Ciudad Origen" aria-label="Username" aria-describedby="basic-addon1" name="origen" value="<%=viaje.getCiudadOrigen()%>">
                                    </div>

                                    <div class="input-group mb-3">
                                        <label for="date">Ciudad destino:  </label>
                                        <input type="text" class="form-control" placeholder="Ciudad Destino" aria-label="Recipient's username" aria-describedby="basic-addon2" name="destino" value="<%=viaje.getCiudadDestino()%>">
                                    </div>

                                    <div class="input-group mb-3">
                                        <label for="date">Empresa de seguro:  </label>
                                        <select class="form-select" aria-label="Default select example" name="seguro">

                                            <%if(viaje.getEmpresa().equals("Rimac")){%>
                                            <option selected value="1">Rimac</option>
                                            <%}else{%>
                                            <option  value="1">Rimac</option>
                                            <%}if(viaje.getEmpresa().equals("Pacifico")){%>
                                            <option selected value="2">Pacifico</option>
                                            <%}else{%>
                                            <option value="2">Pacifico</option>
                                            <%}if(viaje.getEmpresa().equals("La positiva")){%>
                                            <option selected value="3">La positiva</option>
                                            <%}else{%>
                                            <option value="3">La positiva</option>
                                            <%}if(viaje.getEmpresa().equals("Seguro internacional")){%>
                                            <option selected value="4">Seguro internacional</option>
                                            <%}else{%>
                                            <option value="4">Seguro internacional</option>
                                            <%}if(viaje.getEmpresa().equals("Otro")){%>
                                            <option selected value="5">Otro</option>
                                            <%}else{%>
                                            <option value="5">Otro</option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <input type="hidden" name="viajeId" value="<%=viaje.getIdViaje()%>" />
                                    <div class="row justify-content-center">
                                        <div class="col-4">
                                            <label for="date">N° boletos:</label>
                                            <div class="input-group mb-3">
                                                <input type="number" class="form-control" aria-label="Amount (to the nearest dollar)" min="0" name="boletos" value="<%=viaje.getBoletos()%>">
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <label for="date">Costo:</label>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">$</span>
                                                <input type="number" class="form-control" aria-label="Amount (to the nearest dollar)" min="0.00" step="0.1" name="costo" value="<%=viaje.getCosto()%>">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
                                    <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Guardar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        <!-- Modal Borrar -->
        <div class="modal fade" id="ModalBorrar<%=viaje.getIdViaje()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >Borrar viaje <%=viaje.getIdViaje()%></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form class="needs-validation" method="POST" action="<%=request.getContextPath()%>/ViajeServlet?a=borrar" >
                        <div class="modal-body">
                            <b>Introduzca su contraseña para validar la eliminacion de un viaje</b>
                            </br>
                            </br>
                            <div class="mb-3">
                                <label for="contra" class="form-label">Password</label>
                                <input type="password" class="form-control" id="contra" name="contra">
                                <input type="hidden" name="viajeId" value="<%=viaje.getIdViaje()%>" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
                            <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Confirmar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Modal CREAR -->
<div class="modal fade" id="ModalCrear" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Crear viaje</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form class="needs-validation" method="POST" action="<%=request.getContextPath()%>/ViajeServlet?a=crear" >
                <div class="modal-body">
                    <b>Complete el formulario para agregar un viaje</b>
                    </br>
                    </br>
                    <div class="input-group mb-3">
                        <label for="date">Fecha de vuelo:  </label>
                        <input type="date" id="date" name="fecha" required min=<%=LocalDate.now()%>>
                    </div>


                    <div class="input-group mb-3">
                        <label for="date">Ciudad origen:  </label>
                        <input type="text" class="form-control" placeholder="Ciudad Origen" aria-label="Username" aria-describedby="basic-addon1" name="origen" required>
                    </div>

                    <div class="input-group mb-3">
                        <label for="date">Ciudad destino:  </label>
                        <input type="text" class="form-control" placeholder="Ciudad Destino" aria-label="Recipient's username" aria-describedby="basic-addon2" name="destino" required>
                    </div>

                    <div class="input-group mb-3">
                        <label for="date">Empresa de seguro:  </label>
                        <select class="form-select" aria-label="Default select example" name="seguro" required>
                            <option selected>-------</option>
                            <option value="1">Rimac</option>
                            <option value="2">Pacifico</option>
                            <option value="3">La positiva</option>
                            <option value="4">Seguro internacional</option>
                            <option value="5">Otro</option>
                        </select>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col-4">
                            <label for="date">N° boletos:</label>
                            <div class="input-group mb-3">
                                <input type="number" class="form-control" aria-label="Amount (to the nearest dollar)" min="0" name="boletos" required>
                            </div>
                        </div>
                        <div class="col-4">
                            <label for="date">Costo:</label>
                            <div class="input-group mb-3">
                                <span class="input-group-text">$</span>
                                <input type="number" class="form-control"  min="0.00" name="costo" step="0.1" required>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
                    <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Crear</button>
                </div>

            </form>

        </div>

    </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

<script>
    var forms = document.querySelectorAll('.needs-validation');

    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);
    });

</script>

</body>

</html>
