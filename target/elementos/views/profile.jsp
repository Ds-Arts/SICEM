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
        <form action="Usuario" method="post" >
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
            <input type="submit" value="updateProfile">
        </form>
    <%
        } else {
    %>
        <p>Por favor, inicia sesión.</p>
        <a href="login.jsp">Iniciar sesión</a>
    <%
        }
    %>
    <li class="nav-item">
        <a class="nav-link active buttom__default px-4" aria-current="page" href="Usuario?action=dash">salir</a>
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="M19.002 3h-14c-1.103 0-2 .897-2 2v4h2V5h14v14h-14v-4h-2v4c0 1.103.897 2 2 2h14c1.103 0 2-.897 2-2V5c0-1.103-.898-2-2-2z"></path><path d="m11 16 5-4-5-4v3.001H3v2h8z"></path></svg>
            Salir
        </a>
    </li>
</body>
</html>
