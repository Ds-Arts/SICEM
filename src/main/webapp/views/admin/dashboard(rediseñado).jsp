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
        <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <!-- JAVASCRIPT IMPORTANTE -->
        <script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>\views\admin\js\dashboard.js"></script>
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
                <a class="navbar-brand" href="#"><!-- C:\AJCV_DEV_STUDIO\SICEM\SICEM\src\main\webapp\views\admin\dashboard(rediseñado).jsp -->
                    <img
                        src="\..\..\assets\IMG\logo_mono.png"
                        
                        alt
                        width="30"
                        height="30"
                        class="d-inline-block align-text-top me-1" />
                    | SICEM - DASHBOARD
                </a>
                <!-- CONTENEDOR DE BOTONES -->
                <div class="navbar-nav">
                    <form action="Usuario" method="POST">
                        <button name="action" value="logout" class="btn btn-danger">Salir</button>
                    </form>
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
                                    <button onclick="mostrarComponente('views/admin/components/tables/tabla-registrosUsuarios.jsp')" class="btn px-1 link-success"><i class="bi bi-arrow-down-square-fill"></i> Ver mas</button>
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
                                    <button onclick="mostrarComponente('views/admin/components/tables/tabla-registrosElementos.jsp')" class="btn px-1 link-success"><i class="bi bi-arrow-down-square-fill"></i> Ver mas</button>
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
                                    <button onclick="mostrarComponente('views/admin/components/tables/tabla-registrosPrestamos.jsp')" class="btn px-1 link-success"><i class="bi bi-arrow-down-square-fill"></i> Ver mas</button>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5 text-center opacity-50">
                            <p><i class="bi bi-info-circle-fill"></i> Selecciona uno de los contadores para ver los <span class="text-success">registros</span>.</p>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- TABLAS -->
        <div id="contenedor-tablas" class="container-fluid">
            <!-- AQUI SE MUESTRAN LOS COMPONENTES QUE VOY A ASIGNAR EN DASHBOARD.JS -->
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>
</html>
