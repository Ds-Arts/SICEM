<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Préstamos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css?family=Overpass&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/CSS/prestamos.css">
</head>
<body style="background: url('assets/IMG/fondo2.png') no-repeat center center fixed; background-size: cover;">
    <div id="contenedor">
        <div id="central">
            <div id="login">
                <div id="img"><center><img src="assets/IMG/s.png" alt="centered image" height="160" width="160"></center></div>
                <div class="titulo">
                    Préstamos
                </div>
                <form action="Prestamo" method="post">
                    <label>ID de Propietario</label>
                    <input class="formulario" type="text" id="usuarioFk" name="usuarioFk" placeholder="<%=request.getAttribute("id_cuentadante") %>" value="<%=request.getAttribute("id_cuentadante") %>">
                    <label>Número de Placa</label>
                    <input class="formulario" type="text" id="elementoFk" name="elementoFk" placeholder="<%=request.getAttribute("n_placa_prestamo") %>" value="<%=request.getAttribute("n_placa_prestamo") %>">
                    <label>Fecha de Inicio</label>
                    <input type="date" id="fechaInicio" name="fechaInicio" min="1904-01-01" max="6000-12-31" required>
                    <label>Fecha de Fin</label>
                    <input type="date" id="fechaFin" name="fechaFin" min="1904-01-01" max="6000-12-31" required>
                    
                    <button type="submit" name="action" value="registrar">Realizar Préstamo</button>
                </form>
                <div class="pie-form">
                    <a href="elemento?accion=listar">Volver</a>
                </div>
            </div>
            <div class="inferior">
                &copy; Sena 2023 - Todos los derechos reservados
            </div>
        </div>
    </div>
</body>
</html>
