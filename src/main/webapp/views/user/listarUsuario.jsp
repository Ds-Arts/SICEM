<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>
<head>
    <meta charset="UTF-8">
    <title>Lista de usuarios</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="assets/CSS/Listas.css">
</head>
<body>
    <h3 class="text-center mt-5">Lista de usuarios registrados</h3>
    <div class="container d-flex my-5">
        <form class="input-group col-6" action="Usuario"  method="get"  >
            <input class="form-control" type="text" name="nombre" placeholder="Buscar por nombre">
            <button class="btn btn-outline-success" type="submit"  name="action" value="search">Buscar</button>
        </form>
        <form class="input-group col-6" action="Usuario"  method="get" >
            <input class="form-control" type="text" name="idUsuario" placeholder="Buscar por ID">
            <button class="btn btn-outline-success" type="submit" name="action" value="searchById">Buscar por ID</button>
        </form>
    </div>

    <div class="container">
        <table class="table table-striped-columns border-bottom">
            <thead>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>APELLIDO</th>
                <th>EMAIL</th>
                <th>N. IDENTIFICACION</th>
                <th>USUARIO</th>
                <th>ACTIVO</th>
                <th>DETALLES</th>
            </thead>
            <% 
                UsuarioDao usuarioDao = new UsuarioDao();
                List<UsuarioVo> usuarios = usuarioDao.listarUsuarios();
                for (UsuarioVo usuario : usuarios) {
            %>
            <tr>
                <td><code><%= usuario.getId() %></code></td>
                <td><%= usuario.getNombre() %></td>
                <td><%= usuario.getApellido() %></td>
                <td><%= usuario.getEmail() %></td>
                <td><%= usuario.getNumIdentificacion() %></td>
                <td><%= usuario.getNombre() %></td>
                <td><p class="badge text-success"><%= usuario.getActivo() %></p></td>
                <td><a href="Usuario?action=detalle&idUsuarioDetalle=<%= usuario.getId() %>">Mas info...</a></td>
            </tr>
            <% } %> 
        </table>
        <div class="btn-group-sm">
            <a class="btn btn-success" href="Usuario?action=lll">Volver</a>
            <a class="btn btn-info" href="/user/detalles.html">Test detalles</a>
        </div>
    </div>

    <!-- jQuery y Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
