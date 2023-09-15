<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de usuarios</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="assets/CSS/Listas.css">
    <style>
        /* Estilos de la tabla y la barra de búsqueda */
        /* ... */
    </style>
</head>
<body>
    <h1>Lista de usuarios registrados</h1>
    <form action="<%= request.getContextPath() %>/Usuario" method="GET">
        <input type="text" name="searchTerm" placeholder="Buscar por nombre">
        <button type="submit">Buscar</button>
    </form>
    <form action="<%= request.getContextPath() %>/Usuario" method="GET">
        <input type="number" name="idUsuario" placeholder="Buscar por ID">
        <button type="submit" name="action" value="searchById">Buscar por ID</button>
    </form>
    <%-- Verificar si hay un usuario encontrado y mostrar el cuadro de detalles si es el caso --%>
    <% UsuarioVo usuarioEncontrado = (UsuarioVo) request.getAttribute("usuarioEncontrado"); %>
    <% if (usuarioEncontrado != null) { %>
        <div class="alert alert-success" role="alert">
            <p><strong>ID:</strong> <%= usuarioEncontrado.getId() %></p>
            <p><strong>NOMBRE:</strong> <%= usuarioEncontrado.getNombre() %></p>
            <p><strong>APELLIDO:</strong> <%= usuarioEncontrado.getApellido() %></p>
            <p><strong>EMAIL:</strong> <%= usuarioEncontrado.getEmail() %></p>
            <p><strong>NUMERO DE IDENTIFICACION:</strong> <%= usuarioEncontrado.getNumIdentificacion() %></p>
            <p><strong>CONTRASEÑA:</strong> <%= usuarioEncontrado.getContrasena() %></p>
            <p><strong>USUARIO:</strong> <%= usuarioEncontrado.getUsuario() %></p>
            <p><strong>ACTIVO:</strong> <%= usuarioEncontrado.getActivo() %></p>
            <p><a href="Usuario?action=elementos&idUsuarioDetalle=<%= usuarioEncontrado.getId() %>">Ver Elementos</a></p>
        </div>
    <% } %>
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>APELLIDO</th>
            <th>EMAIL</th>
            <th>NUMERO DE IDENTIFICACION</th>
            <th>CONTRASEÑA</th>
            <th>USUARIO</th>
            <th>ACTIVO</th>
            <th>DETALLES</th>
        </tr>
        <% 
            UsuarioDao usuarioDao = new UsuarioDao();
            List<UsuarioVo> usuarios = usuarioDao.listarUsuarios();
            for (UsuarioVo usuario : usuarios) {
        %>
        <tr>
            <td><%= usuario.getId() %></td>
            <td><%= usuario.getNombre() %></td>
            <td><%= usuario.getApellido() %></td>
            <td><%= usuario.getEmail() %></td>
            <td><%= usuario.getNumIdentificacion() %></td>
            <td><%= usuario.getContrasena() %></td>
            <td><%= usuario.getUsuario() %></td>
            <td><%= usuario.getActivo() %></td>
            <td><a href="Usuario?action=detalle&idUsuarioDetalle=<%= usuario.getId() %>">Detalle</a></td>
        </tr>
        <tr class="separador">
            <td colspan="5"></td>
        </tr>
        <% } %> 
        </tr>
    </table>

    <!-- jQuery y Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <div>
        <a href="Usuario?action=registrarU">Volver</a>
    </div>
</body>
</html>
