<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>

<%-- IMPORTS DE PRESTAMOS --%>
<%@ page import="model.PrestamosVo" %>
<%@ page import="model.PrestamosDao" %>
<%-- IMPORTS DE ELEMENTOS --%>
<%@ page import="model.ElementosDao" %>
<%@ page import="model.ElementosVo" %>
<%-- IMPORTS DE USUARIOS --%>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<%-- IMPORTS DE CATEGORIA --%>
<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>

<head>
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
        <link rel="shortcut icon" href="assets/IMG/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>

<section id="tabla-registrosPrestamos" class="container-fluid mt-3">
    <!-- TABLA DE USUARIOS -->
    <div class="container">
        <table class="table table-striped shadow border rounded-3">
            <div class="row mx-0 mb-3">
                <div class="hstack gap-3">
                    <h3>Prestamos</h3>
                    <div class="vr"></div>
                    <!-- BUSCAR POR -->
                    <input id="buscar-x-id" class="form-control me-auto barra-busqueda-usuario"  style="display: none;" type="text" placeholder="Buscar por ID">
                    <input id="buscar-x-nombre" class="form-control me-auto barra-busqueda-usuario" type="text" placeholder="Buscar por nombre">
                    <div class="btn-group">
                        <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            Buscar por...
                        </button>
                        <ul class="dropdown-menu">
                            <li><button onclick="cambiarBusqueda('buscar-x-id')" class="dropdown-item" href="#">ID</button></li>
                            <li><button onclick="cambiarBusqueda('buscar-x-nombre')" class="dropdown-item" href="#">Nombre</button></li>
                        </ul>
                    </div>
                    <div class="vr"></div>
                    <h5>Organizar</h5>
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                        <label class="btn btn-outline-success" for="btnradio1">Aa</label>
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                        <label class="btn btn-outline-success" for="btnradio2">#</label>
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                        <label class="btn btn-outline-success" for="btnradio3">@</label>
                    </div>
                </div>
            </div>
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
                ElementosDao elementosDao = new ElementosDao();// Importa la clase UsuarioDao
                List<PrestamosVo> prestamos = prestamoDao.listarPrestamos();
                for (PrestamosVo prestamo : prestamos) {
                    // Obtener el Usuario correspondiente por su ID
                    UsuarioVo usuario = usuariDao.buscarUsuarioPorId(prestamo.getUsu());
                    UsuarioVo usuari = usuariDao.buscarUsuarioPorId(prestamo.getUs());
                    // Reemplaza "buscarUsuarioPorId" con el método real de tu clase UsuarioDao
                    ElementosVo element = elementosDao.buscarElementoPorId(prestamo.getU());
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
</section>