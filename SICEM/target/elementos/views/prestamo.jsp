<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de préstamos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css?family=Overpass&display=swap" rel="stylesheet">
    <link href="../assets/CSS/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body style="background: url('assets/IMG/fondo2.png')no-repeat center center fixed; background-size: cover;">
    <div id="contenedor">
        <div id="central">

            <div id="login">
                <div id="img"><center><img src="assets/IMG/s.png" alt="centered image" height="160" width="160 " > </center></div>
                <div class="titulo">
                    Préstamos
                </div>
                <form  action="prestamo" method="post">
                    <label>id Propietario</label>
                    <input class="formulario" type="text" id="usuario_fk" name="usuario_fk"   placeholder=<%=request.getAttribute("id_cuentadante") %> value=<%=request.getAttribute("id_cuentadante")%> >
                    <label>Numero de placa</label>
                    <input class="formulario" type="text" id="elemento_fk" name="elemento_fk"   placeholder="<%=request.getAttribute('n_placa_prestamo')%>" value="<%=request.getAttribute('n_placa_prestamo')%>"
                    <label>Fecha de inicio</label>
                    <input type="date" id="fecha_inicio" name="fecha_inicio" min="1904-01-01" max="6000-12-31" required>
                    <label>Fecha de fin</label>
                    <input type="date" id="fecha_fin" name="fecha_fin" min="1904-01-01" max="6000-12-31" required>
                    <button type="submit" name="accion" value="pres">Realizar préstamo</button>
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