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


<p> <% UsuarioDao usuarioDao = new UsuarioDao();
    UsuarioVo usuario = usuarioDao.buscarUsuarioPorId(Integer.parseInt(request.getParameter("id")));
    System.out.println(usuario.getNumIdentificacion());%>
</p>
<form action="Usuario" method="post">
<input type="number" hidden name="id"  placeholder="<%=usuario.getId()%>"  value="<%=request.getAttribute("id")%>" />
<input type="text" name="nombre" required  placeholder="<%=usuario.getNombre()%>"  value="<%=usuario.getNombre()%>" />
<input type="text" name="apellido" required placeholder="<%=usuario.getApellido()%>" value="<%=usuario.getApellido()%>"/>
<input type="email" name="email"  required  placeholder="<%=usuario.getEmail()%>"  value="<%=usuario.getEmail()%>"/>
<input type="text" name="numIdentificacion"  required  placeholder="<%=usuario.getNumIdentificacion()%>" value="<%=usuario.getNumIdentificacion()%>" />
<input  type="text" name="contrasena" required   placeholder="<%=usuario.getContrasena()%>"  value="<%=usuario.getContrasena()%>"  />
    <label class="input-group-text" for="inputGroupSelect01">Categoria</label>
<select class="form-select" id="inputGroupSelect01" name="rol_fk" id="rol_fk"  required>
    <option selected place>Elige categoria del usuario</option>
    <option value="Instructor">Instructor</option>
    <option value="Cuentadante">Cuentadante</option>
    <option value="Administrador">Administrador</option>
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