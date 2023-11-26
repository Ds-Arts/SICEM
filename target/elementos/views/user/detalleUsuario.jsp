<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.ElementosDao, model.ElementosVo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Elementos por Usuario</title>
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
    <h1>Lista de Elementos por Usuario</h1>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Número de Placa</th>
            <th>Cantidad</th>
            <th>Costo</th>
            <th>Tipo</th>
            <th>Fecha de Ingreso</th>
            <th>Estado</th>
            <th>Categoría</th>
            <th>Número de Aula</th>
            <th>Descripción</th>
            <th>Acciones</th>
        </tr>
        
        <% 
            int idUsuarioDetalle = Integer.parseInt(request.getParameter("idUsuarioDetalle"));
            ElementosDao elementoDao = new ElementosDao();
            List<ElementosVo> elementos = elementoDao.getElementosByUsuarioId(idUsuarioDetalle);
            
            for (ElementosVo elemento : elementos) {
        %>
        <tr>
            <td><%= elemento.getId() %></td>
            <td><%= elemento.getNombre() %></td>
            <td><%= elemento.getNumeroPlaca() %></td>
            <td><%= elemento.getCantidad() %></td>
            <td><%= elemento.getCosto() %></td>
            <td><%= elemento.getTipo() %></td>
            <td><%= elemento.getFechaIngreso() %></td>
            <td><%= elemento.getEstado() %></td>
            <td><%= elemento.getCategoria() %></td>
            <td><%= elemento.getNumeroAula() %></td>
            <td><%= elemento.getDescripcion() %></td>
            <td>
                <a href="DetalleElemento.jsp?id=<%= elemento.getId() %>">Ver Detalles</a>
            </td>
        </tr>
        <% } %> 
        <div>
            <a href="Usuario?action=list">Volver</a>
        </div>
    </table>

    <!-- jQuery y Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
