<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfil de Usuario</title>
</head>
<body>
    <h1>Perfil de Usuario</h1>

    <%
        // Recupera el usuario de la sesión
        model.UsuarioVo usuarioSesion = (model.UsuarioVo) session.getAttribute("usuarioSesion");

        if (usuarioSesion != null) {
    %>
        <p>Bienvenido, <%= usuarioSesion.getNombre() %> <%= usuarioSesion.getApellido() %>.</p>
        <p>Correo electrónico: <%= usuarioSesion.getEmail() %></p>

        <h2>Actualizar Perfil</h2>
        <form action="Usuario" method="post">
            <input type="hidden" name="action" value="updateProfile">
            <input type="hidden" name="idUsuario" value="<%= usuarioSesion.getId() %>">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" value="<%= usuarioSesion.getNombre() %>">
            <br>
            <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" value="<%= usuarioSesion.getApellido() %>">
            <br>
            <label for="email">Correo Electrónico:</label>
            <input type="text" name="email" value="<%= usuarioSesion.getEmail() %>">
            <br>
            <input type="submit" value="Actualizar Perfil">
        </form>
    <%
        } else {
    %>
        <p>Por favor, inicia sesión.</p>
        <a href="login.jsp">Iniciar sesión</a>
    <%
        }
    %>
</body>
</html>
