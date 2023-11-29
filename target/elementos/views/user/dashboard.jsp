<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- IMPORTS DE ELEMENTOS --%>
<%@ page import="model.ElementosDao" %>
<%@ page import="model.ElementosVo" %>
<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>
<%@ page import="java.util.List" %>

<%-- IMPORTS DE PRESTAMOS --%>
<%@ page import="model.PrestamosVo" %>
<%@ page import="model.PrestamosDao" %>

<%-- IMPORTS DE USUARIOS --%>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SENA - SICEM</title>
        <!-- BOOTSTRAP -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous" />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/custom.css" />
        <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
    </head>
    <%
        // Recupera el usuario de la sesión
        model.UsuarioVo usuarioSesion = (model.UsuarioVo) session.getAttribute("usuarioSesion");

        if (usuarioSesion != null) {
    %>
    <body class="bg-body-tertiary">

    <%
        System.out.println("Estas en la vista Dashboard(rediseñado)");
    %>

        <div class="container">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <h3 class="navbar-brand">Dashboard - Usuario</h3>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <form action="Usuario" method="get">
                                    <input type="hidden" name="action" value="lll">
                                <button class="nav-link active" href="#">
                                    Perfil
                                    <svg  width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 20 20">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                    </svg>  
                                </button>
                                </form>
                            </li>
                            <li class="nav-item">
                                <form action="Usuario" method="POST">
                                <button class="nav-link active" name="action" value="logout" >
                                    Salir
                                    <svg  width="25" height="25" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                                        <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                    </svg>
                                </button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- BIENVENIDA Y CONTADORES -->
            <div class="row py-3 row-cols-2 border-bottom">
                <!-- CARD -->
                <div class="col-sm-7">
                    <div class="row py-3 me-3 h-100">
                        <div class="container-sm h-100 py-3">
                            <h1 class="text-success">!Bienvenido,</h1>
                            <h3>Andres Julian Cordoba Ventura!</h3>
                            <p>Tienes <span class="text-success">0</span> notificaciones pendientes.</p>
                        </div>
                    </div>
                </div>
                <!-- CARD -->
                <div class="col-sm-5">
                    <div class="row py-3 bg-body shadow-sm me-3 border-bottom mb-3 px-3 rounded-3">
                        <div class="col-sm-9">
                            <h6>Elementos solicitados</h6>
                        <h3 class="text-success">0</h3>
                        </div>
                    </div>
                    <div class="row py-3 bg-body shadow-sm me-3 border-bottom mb-3 px-3 rounded-3">
                        <div class="col-sm-9">
                            <h6>Elementos prestados</h6>
                        <h3 class="text-success">0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <!-- TABLA DE ELEMENTOS SOLICITABLES -->
            <div class="row h-25 py-3 border-bottom">
                <table class="table caption-top">
                    <caption>Lista de elementos disponibles</caption>
                    <thead>
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Num. placa</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Costo</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Fecha de ingreso</th>
                        <th scope="col">Categoria</th>
                        <th scope="col">Aula</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Cuentadante</th>
                        <th scope="col">opciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        System.out.println("");
                        ElementosDao elementosDao = new ElementosDao();
                        UsuarioDao usuarioDao = new UsuarioDao(); // Importa la clase UsuarioDao

                        List<ElementosVo> elementos;
                        String placa = request.getParameter("placa");

                        if (placa != null && !placa.isEmpty()) {
                            elementos = elementosDao.buscarPorNumeroPlaca(placa);
                        } else {
                            String tipo = request.getParameter("TipoElemento");
                            if (tipo != null && !tipo.isEmpty()) {
                                elementos = elementosDao.buscarPorTipo(tipo);
                            } else {
                                elementos = elementosDao.listar();
                            }
                        }
                        for (ElementosVo elemento : elementos) {
                            // Obtener el Usuario correspondiente por su ID
                            UsuarioVo usuario = usuarioDao.buscarUsuarioPorId(elemento.getUsu()); // Reemplaza "buscarUsuarioPorId" con el método real de tu clase UsuarioDao
                    %>
                    <tr>
                        <td><%=elemento.getNombre()%></td>
                        <td><%= elemento.getNumeroPlaca()%></td>
                        <td><%=elemento.getCantidad()%></td>
                        <td><%=elemento.getCosto()%></td>
                        <td><%=elemento.getTipo()%></td>
                        <td><%=elemento.getFechaIngreso()%></td>
                        <td><%=elemento.getCategoria()%></td>
                        <td><%=elemento.getNumeroAula()%></td>
                        <td><%=elemento.getDescripcion()%></td>
                        <td><%=elemento.getEstado()%></td>
                        <td><%=usuario.getNombre()%></td>
                        <td> <form action="elemento" method="post">
                            <input type="number" name="id_cuentadante" value="<%=elemento.getUsu()%>" hidden>
                            <input type="text" name="nombre_cuentadante" value="<%=usuario.getNombre()%>" hidden>
                            <input type="number" name="n_placa_prestamo" value="<%= elemento.getNumeroPlaca()%>" hidden>

                            <button class="btn btn-light" type="submit" name="accion" value="data_prestamo"><center>Prestamo</center></button>
                        </form>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            
            <!-- TABLAS DE ELEMENTOS PRESTADOS Y SOLICITAOS -->
            <div class="row my-3 h-25">
                <div class="col-sm-6">
                    <table class="table caption-top">
                    <caption>Lista de elementos solicitados</caption>
                        <thead class="">
                        <tr>
                            <th scope="col">Elemento</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Prestamista</th>
                            <th scope="col">Prestatario</th>
                            <th scope="col">Fecha Transpaso</th>
                            <th scope="col">Inicio</th>
                            <th scope="col">Fin</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            PrestamosDao prestamoDao = new PrestamosDao();
                            UsuarioDao usuariDao = new UsuarioDao();
                            ElementosDao elementoDao = new ElementosDao();// Importa la clase UsuarioDao
                            List<PrestamosVo> prestamos = prestamoDao.listarPrestamos();
                            for (PrestamosVo prestamo : prestamos) {
                                // Obtener el Usuario correspondiente por su ID
                                UsuarioVo usuario = usuariDao.buscarUsuarioPorId(prestamo.getUsu());
                                UsuarioVo usuari = usuariDao.buscarUsuarioPorId(prestamo.getUs());
                                // Reemplaza "buscarUsuarioPorId" con el método real de tu clase UsuarioDao
                                ElementosVo element = elementoDao.buscarElementoPorId(prestamo.getU());
                        %>

                        <tr>
                            <th scope="row"><%= prestamo.getElementoFk() %></th>
                            <td><%=element.getNombre()%></td>
                            <td><%=usuario.getNombre()%></td>
                            <td><%= usuari.getNombre() %></td>
                            <td><%= prestamo.getFechaTranspaso() %></td>
                            <td><%= prestamo.getFechaInicio() %></td>
                            <td><%= prestamo.getFechaFin() %></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                </table>
                </div>
                <div class="col-sm-6">
                    <table class="table caption-top">
                    <caption>Lista de elementos prestados</caption>
                    <thead>
                        <tr>

                            <th scope="col">Nombre</th>
                            <th scope="col">Placa</th>
                            <th scope="col">Propietario</th>
                            <th scope="col">Fecha entrega</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>

                            <td>G502</td>
                            <td>08197e4</td>
                            <td>Sena</td>
                            <td>00/00/00</td>
                        </tr>
                        <tr>
                            <td>Hp</td>
                            <td>AR09127</td>
                            <td>Sena</td>
                            <td>00/00/00</td>
                        </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>



        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <%
        }
    %>
    </body>

</html>