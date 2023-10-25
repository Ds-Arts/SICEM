<%@ page import="model.UsuarioVo" %>
<%@ page import="model.UsuarioDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit usuario</title>
</head>
<body>
    <form action="Usuario" method="post">
<input type="number" hidden name="id"  placeholder="<%request.getAttribute("id");%>"  value="<% request.getAttribute("id");%>" > 
<input type="text" name="nombre" required  placeholder="<% request.getAttribute("nombre");%>"  value="<%request.getAttribute("nombre");%> ">
<input type="text" name="apellido" required  value="<% request.getAttribute("apellido");%>">
<input type="email" name="email"  required value="<% request.getAttribute("email");%> ">
<input type="number" name="identificacion"  required  value="<% request.getAttribute("identificacion");%>">
<label class="input-group-text" for="inputGroupSelect01">Categoria</label>
<select class="form-select" id="inputGroupSelect01" name="rol_fk" id="rol_fk" required>
    <option selected>Elige categoria del usuario</option>
    <option value="3">Instructor</option>
    <option value="2">Cuentadante</option>
    <option value="1">Administrador</option>
</select>
    <select class="form-select"name="activo" id="Activo" required>
        <option selected>Elige...</option>
        <option value="Activo">Activo</option>
        <option value="inactivo">Inactivo</option>
    </select>
<button name="action" value="editar_usuario"> Actualizar  </button>
</form>
</body>
</html>