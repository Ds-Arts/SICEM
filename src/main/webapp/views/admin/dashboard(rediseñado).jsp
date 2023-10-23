<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>

    <body class="bg-body-tertiary">
        
        <%
            System.out.println("Estas en la vista Dashboard(rediseñado)");
        %>

        <!-- HEADER -->
        <nav class="navbar navbar-light bg-body border-bottom justify-content-between position-sticky ">
            <!-- ORGANIZADOR DEL CONTENIDO -->
            <div class="container-fluid">
                <!-- LOGO -->
                <a class="navbar-brand" href="#">
                    <img
                        src="../img/favicon.ico"
                        alt
                        width="30"
                        height="30"
                        class="d-inline-block align-text-top me-1" />
                    | SICEM - DASHBOARD
                </a>
                <!-- CONTENEDOR DE BOTONES -->
                <div class="navbar-nav">
                    <button type="button" class="btn btn-danger">Salir</button>
                </div>
            </div>
        </nav>

        <!-- BIENVENIDA Y CONTENEDORES -->
        <section class="container-fluid py-3">
            <div class="container-sm h-100 py-3">
                <h3><span class=" text-success">!Bienvenido,</span> Andres Julian Cordoba Ventura!</h3>
                <p>Hasta ahora así llevamos nuestros <span class="text-success">contadores</span>.</p>
            </div>
            
            <!-- CONTADORES -->
            <div class="container border-bottom pb-5">
                <div class="container px-5">
                    <div class="row">
                        
                        <!-- USUARIOS -->
                        <div class="col">
                            <div class="rounded-3 shadow-sm border">
                                <div class="border-3 border-start border-success p-3 rounded-3">
                                    <p class="h6">Usuarios</p>
                                    <%
                                        System.out.println("");
                                        UsuarioDao usuarioDao = new UsuarioDao();
                    
                                        List<UsuarioVo> usuarios;
                                        String cantidadUsuarios = request.getParameter("cantidad");
                                        usuarios = usuarioDao.contadorUsuarios();
                    
                                        for (UsuarioVo usuario : usuarios) {
                                    %>
                                    <p class="h2 text-success mt-1"><%=usuario.getId()%></p>
                                    <% } %>    
                                    <a href="" class="link-success">Ver mas</a>
                                </div>
                            </div>
                            
                        </div>
                    
                        <!-- ELEMENTOS -->
                        <div class="col">
                            <div class="rounded-3 shadow-sm border">
                                <div class="border-3 border-start border-success p-3 rounded-3">
                                    <p class="h6">Elementos</p>
                                    <%
                                        System.out.println("");
                                        ElementosDao elementosDao = new ElementosDao();
                    
                                        List<ElementosVo> elementos;
                                        String cantidadElementos = request.getParameter("cantidad");
                                        elementos = elementosDao.contadorElementos();
                    
                                        for (ElementosVo elemento : elementos) {
                                    %>
                                    <p class="h2 text-success mt-1">
                                        <%=elemento.getCantidad()%>
                                    </p>   
                                    <% } %>
                                    <a href="" class="link-success">Ver mas</a>
                                </div>
                            </div>
                            
                        </div>
                        
                        <!-- PRESTAMO -->
                        <div class="col">
                            <div class="rounded-3 shadow-sm border">
                                <div class="border-3 border-start border-success p-3 rounded-3">
                                    <p class="h6">Prestamos</p>
                                    <%
                                        System.out.println("");
                                        PrestamosDao prestamosDao = new PrestamosDao();
                    
                                        List<PrestamosVo> prestamos;
                                        String cantidadPrestamos = request.getParameter("cantidad");
                                        prestamos = prestamosDao.contadorPrestamos();
                    
                                        for (PrestamosVo prestamo : prestamos) {
                                    %>
                                        <p class="h2 text-success mt-1">
                                            <%=prestamo.getUs()%>
                                        </p>    
                                    <% } %>
                                    <a href="" class="link-success">Ver mas</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- TABLAS -->
        <section class="container-fluid mt-3">
            <!-- TABLA DE USUARIOS -->
            <div class="container">
                <table class="table table-striped shadow border rounded-3">
                    <thead class="">
                        <div class="row mx-0">
                            <!-- TITULO DE LA TABLA -->
                            <div class="col-4">
                                <h3>Usuarios</h3>
                            </div>
                            <!-- BARRA DE BUSQUEDA -->
                            <div class="col-4">
                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-transparent" id="basic-addon1">Buscar</span>
                                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                    <span class="input-group-text" id="basic-addon1"><div class="btn btn-success"><i class="bi bi-search"></i></div></span>
                                </div>
                            </div>
                            <!-- BORDENAR POR -->
                            <div class="col-4">
                                    <div class="row">
                                        <div class="col-4">
                                            <p>Ordenar por:</p>
                                        </div>
                                        <div class="col-8 btn-group">
                                            <button 
                                                class="btn btn-outline-secondary"
                                                type="button"
                                                data-bs-toggle="tooltip" 
                                                data-bs-placement="top"
                                                data-bs-custom-class="custom-tooltip"
                                                data-bs-title="Nombre y apellido"
                                            >
                                                <i class="bi bi-alphabet-uppercase"></i>
                                            </button>
                                            <button class="btn btn-outline-secondary">
                                                <i class="bi bi-envelope-at"></i>
                                            </button>
                                            <button class="btn btn-outline-secondary">
                                                <i class="bi bi-list-ol"></i>
                                            </button>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">First</th>
                            <th scope="col">Last</th>
                            <th scope="col">Handle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>
</html>
