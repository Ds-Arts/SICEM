<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.PrestamosVo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Préstamos</title>
    <!-- Agrega tus enlaces a hojas de estilo y scripts aquí -->
</head>
<body>
    <h1>Listado de Préstamos</h1>

    <!-- Agrega un cuadro de detalles para mostrar información de préstamo encontrado -->
    <% PrestamosVo prestamoEncontrado = (PrestamosVo) request.getAttribute("prestamoEncontrado"); %>
    <% if (prestamoEncontrado != null) { %>
        <div class="alert alert-success" role="alert">
            <p><strong>ID de Usuario:</strong> <%= prestamoEncontrado.getUsuarioFk() %></p>
            <p><strong>ID de Elemento:</strong> <%= prestamoEncontrado.getElementoFk() %></p>
            <p><strong>Fecha de Inicio:</strong> <%= prestamoEncontrado.getFechaInicio() %></p>
            <p><strong>Fecha de Fin:</strong> <%= prestamoEncontrado.getFechaFin() %></p>
        </div>
    <% } %>

    <!-- Agrega una tabla para mostrar la lista de préstamos -->
    <table border="1">
        <tr>
            <th>Elemento</th>
            <th>Usuario</th>
            <th>Fecha de Inicio</th>
            <th>Fecha de Fin</th>
        </tr>
        <% 
            List<PrestamosVo> prestamos = (List<PrestamosVo>) request.getAttribute("prestamos");
            for (PrestamosVo prestamo : prestamos) {
        %>
        <tr>
            <td><%= prestamo.getElementoFk() %></td>
            <td><%= prestamo.getUsuarioFk() %></td>
            <td><%= prestamo.getFechaInicio() %></td>
            <td><%= prestamo.getFechaFin() %></td>
        </tr>
        <% } %>
    </table>
    <div>
        <a href="elemento?accion=registrar">Volver</a>
    </div>
    
    <!-- Agrega tus enlaces a hojas de estilo y scripts aquí -->

    <!-- Agrega enlaces de navegación u otros elementos según sea necesario -->

</body>
</html>
