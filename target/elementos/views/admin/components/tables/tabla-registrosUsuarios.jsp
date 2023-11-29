<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<head>
<<<<<<< HEAD
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- ICONOS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- LOGO SENA-->
    <link rel="shortcut icon" href="assets/IMG/favicon.ico" type="image/x-icon" />
</head>

<section id="tabla-registrosUsuarios" class="container-fluid mt-3">
    <!-- TABLA DE USUARIOS -->
    <div class="container mb-5">
        <div class="hstack gap-3 mb-3">
            <h3>Usuarios</h3>
            <div class="vr"></div>
            <!-- BOTON DE AGREGAR NUEVO USUARIO -->
            <h5>Agregar</h5>
            <input class="btn-check">
            <button class="btn btn-outline-success" onclick="mostrarComponente('views/admin/components/forms/tabla-registrarUsuarios.jsp')">
                <i class="bi bi-plus-lg"></i>
            </button>
            <div class="vr"></div>
            <div class="container-fluid d-flex flex-row">
                <form action="Usuario" method="GET" class="container">
                    <div class="input-group mb-3">
                        <input id="buscar-x-id" type="text" name="numidusuario"  PLACEHOLDER="Buscar por numero de identificaciòn" class="form-control">
                        <button id="buscar-x-id" type="submit" class="btn btn-success" name="action" value="searchById">Buscar</button>
=======
<<<<<<< HEAD
    <!-- BOOTSTRAP -->
=======
<!-- BOOTSTRAP -->
>>>>>>> a37d563cb567409f8efcde52cd64af71e23e27c3
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

<section id="tabla-registrosUsuarios" class="container-fluid mt-3">
    <!-- TABLA DE USUARIOS -->
    <div class="container">
<<<<<<< HEAD
        <form action="Usuario" method="GET" class="form-group">
            <input id="buscar-x-id" type="text" name="numidusuario"  PLACEHOLDER="Buscar por numero de identificaciòn" class="form-control">
            <button id="buscar-x-id" type="submit" class="btn btn-success" name="action" value="searchById">Buscar</button>
        </form>
        <div class="vr"></div>
        <form action="Usuario" method="GET" class="form-group">
            <input id="buscar-x-nombre" type="text" name="nombre"  PLACEHOLDER="Buscar por nombre" class="form-control">
            <button id="buscar-x-nombre"  type="submit" class="btn btn-success" name="action" value="search">Buscar</button>
        </form>
        <table class="table table-striped shadow border rounded-3 mb-3">
            <div class="row mx-0 mb-3">
                <div class="hstack gap-3">
=======
    <div class="hstack gap-3">
>>>>>>> a37d563cb567409f8efcde52cd64af71e23e27c3
                    <h3>Usuarios</h3>
                    <div class="vr"></div>
                    <!-- BOTON DE AGREGAR NUEVO USUARIO -->
                    <h5>Agregar</h5>
                    <input class="btn-check">
                    <button class="btn btn-outline-success" onclick="mostrarComponente('views/admin/components/forms/tabla-registrarUsuarios.jsp')">
                        <i class="bi bi-plus-lg"></i>
                    </button>
                    <div class="vr"></div>
                    <div class="container-fluid d-flex flex-row">
                        <form action="Usuario" method="GET" class="container">
                            <div class="input-group mb-3">
                                <input id="buscar-x-id" type="text" name="numidusuario"  PLACEHOLDER="Buscar por numero de identificaciòn" class="form-control">
                                <button id="buscar-x-id" type="submit" class="btn btn-success" name="action" value="searchById">Buscar</button>
                            </div>
                        </form>
                        <form action="Usuario" method="GET" class="container">
                            <div class="input-group mb-3">
                                <input id="buscar-x-nombre" type="text" name="nombre"  PLACEHOLDER="Buscar por nombre" class="form-control">
                                <button id="buscar-x-nombre"  type="submit" class="btn btn-success" name="action" value="search">Buscar</button>
                            </div>
                        </form>
>>>>>>> 0d746c7b76f77593d68a7fa88bc31119bae5a5b0
                    </div>
                </form>
                <form action="Usuario" method="GET" class="container">
                    <div class="input-group mb-3">
                        <input id="buscar-x-nombre" type="text" name="nombre"  PLACEHOLDER="Buscar por nombre" class="form-control">
                        <button id="buscar-x-nombre"  type="submit" class="btn btn-success" name="action" value="search">Buscar</button>
                    </div>
                </form>
            </div>
        </div>
        
        <table class="table table-striped shadow border rounded-3 mb-3">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre y apellido</th>
                    <th scope="col">N. Identificación</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Rol</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Opciones</th>
                </tr>
            </thead>
            <tbody>
                <%

                   if (request.getAttribute("numerodecaso") == null ) {
                       String numerocaso ="0";
                       request.setAttribute("numerodecaso",numerocaso);
                       String numcaso = request.getAttribute("numerodecaso").toString();
                       System.out.println(numcaso);
                   }
                    String numcaso = request.getAttribute("numerodecaso").toString();
                    System.out.println(numcaso);

                    switch (numcaso){

                        case "1":
                            System.out.println("el nombre llego") ;
                            String  nombre = request.getParameter("nombre");
                            UsuarioDao Usuario1Dao = new UsuarioDao();

                            List<UsuarioVo> usu1 =  Usuario1Dao.buscarUsuariosPorNombre(nombre);

                            for (UsuarioVo usuari : usu1) {
                %>

                <tr>
                    <th scope="row"><%= usuari.getId() %></th>
                    <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                    <td><%= usuari.getNumIdentificacion() %></td>
                    <td><%= usuari.getEmail() %></td>
                    <td><%= usuari.getRol_fk() %></td>
                    <td><%= usuari.getActivo() %></td>
                    <td> <a href="Usuario?action=detalle&idUsuarioDetalle=<%= usuari.getId() %>">Mas info...</a> </td>
                </tr>
                <%
                    };
                %>
                <%
                        break;

                    case "2":

<<<<<<< HEAD
                            System.out.println("el id llego") ;
                            UsuarioDao UsuarioDao2 = new UsuarioDao();
                            String numidentificacion =request.getParameter("idUsuario");
                            System.out.println(numidentificacion);
                            int id = Integer.parseInt(numidentificacion);
                            List<UsuarioVo> usu2 =  UsuarioDao2.buscarUsuariosPornumIdentificacion(id);
                            for (UsuarioVo usuari : usu2){
                    %>
=======
                        System.out.println("el id llego") ;
                        UsuarioDao UsuarioDao2 = new UsuarioDao();
                        String numidentificacion = request.getParameter("numidusuario");
                        int id = Integer.parseInt(numidentificacion);
                        List<UsuarioVo> usu2 =  UsuarioDao2.buscarUsuariosPornumIdentificacion(id);
                        for (UsuarioVo usuari : usu2){
                %>
>>>>>>> a37d563cb567409f8efcde52cd64af71e23e27c3
                <tr>
                    <th scope="row"><%= usuari.getId() %></th>
                    <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                    <td><%= usuari.getNumIdentificacion() %></td>
                    <td><%= usuari.getEmail() %></td>
                    <td><%= usuari.getRol_fk() %></td>
                    <td><%= usuari.getActivo() %></td>
                    <td> <a href="Usuario?action=detalle&idUsuarioDetalle=<%= usuari.getId() %>">Mas info...</a> </td>
                </tr>
                <%
                    };
                %>


                <%
                        break;
                    default:
                            System.out.println("el caso viene por default");
                            UsuarioDao UsuarioDao = new UsuarioDao();
                            List<UsuarioVo> usu = UsuarioDao.listarUsuarios();
                        for (UsuarioVo usuari : usu) {
                %>
                <tr>
                    <th scope="row"><%= usuari.getId() %></th>
                    <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                    <td><%= usuari.getNumIdentificacion() %></td>
                    <td><%= usuari.getEmail() %></td>
                    <td><%= usuari.getRol_fk() %></td>
                    <td><%= usuari.getActivo() %></td>
                    <td> <a href="Usuario?action=detalle&idUsuarioDetalle=<%= usuari.getId() %>">Mas info...</a> </td>
                </tr>
                <%};%>

            <%    
                break;
                    }
             %>
            </tbody>
        </table>
    </div>
</section>