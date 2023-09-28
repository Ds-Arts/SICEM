<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.PrestamosDao" %>
<%@ page import="model.PrestamosVo" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Préstamos</title>
</head>
<body>
    <h1>Listado de Préstamos</h1>
    
    <table border="1">
        <tr>
            <th>Cuentadante</th>
            <th>Elemento</th>
            <th>Fecha Transpaso</th>
            <th>Tipo</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
            <th>Prestatario</th>
        </tr>
        <%
            PrestamosDao prestamoDao = new PrestamosDao();
            List<PrestamosVo> prestamos = prestamoDao.listarPrestamos();
            for (PrestamosVo prestamo : prestamos) {
        %>
        <tr>
            <td><%= prestamo.getCuentadantefk() %></td>
            <td><%= prestamo.getElementoFk() %></td>
            <td><%= prestamo.getFechaTranspaso() %></td>
            <td><%= prestamo.isTipo() %></td>
            <td><%= prestamo.getFechaInicio() %></td>
            <td><%= prestamo.getFechaFin() %></td>
            <td><%= prestamo.getPrestatariofk() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
