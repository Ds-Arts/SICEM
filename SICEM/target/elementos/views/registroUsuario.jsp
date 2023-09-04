<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="assets/CSS/shady.css">
  <link rel="icon" href="assets/IMG/ventana.png">
  <title>Registro de Usuario</title>

</head>
<body>
  <div class="login-page">
      <header>
        <div class="logo">
            <img src="assets/IMG/sena.png">
            <h1>  | Sistema Inventario</h1>
            <div class="btnsup"> 
                <button>Consulta x serial</button>
                <button>Toma virtual</button>
                <button>Acceso</button>
                <button>Catalogo</button>
                <button>Test defectos</button>
            </div>
        </div>
    </header>
    <nav>
      <div class="contenedor">
          <form class="formu" action="Usuario" method="POST">
              <input type="hidden" name="action" value="register">
              
              <label for="nombre">Nombre:</label>
              <input type="text" id="nombre" name="nombre" required>
              
              <label for="usuario">Usuario:</label>
              <select class="desp" name="usuario" id="usuario" required>
              <option disabled selected value="">Seleccionar una categoria</option>
                  <option>profesor</option>
                  <option>cuentadante</option>
                  <option>admin</option>
              </select>
              <label for="contrasena">Contraseña:</label>
              <input type="password" id="contrasena" name="contrasena" required>
              
              <button type="submit">Registrar</button>
          </form>

  <div class="btngrupo">
    <aside class="extra">
        <a href="Usuario?action=list">
            <button><center>Consultar Usuario registrados</center></button>
        </a>
        
        <a href="elemento?accion=registrar">
          <button>Registrar Elementos</button>
        </a>

        <a href="elemento?accion=listar">
          <button>Consultar Elementos registrados</button>
        </a>
        <button>Consultar prestamos</button>
        <!--   boton para redireccionar a el servlet elemento para el formulario de creacion de  categoria en el servlet  elementos   -->
        <a href="elemento?accion=c_categoria">    
            <button> Crear nueva categoria </button>
        </a>
    </aside>
</div>
</div>
</nav>
<footer class="end0">
<div class="end1">
<h1><a class="link" href="https://www.sena.edu.co/">WWW.SENA.EDU.CO</a></h1>
</div>
<div class="end2">
<legend>Equipo de desarrollo</legend>
<ul class="lista">
    <li>Michael Josué Rico</li>
    <li>Juan Camilo Torres Ávila</li>
    <li>Luis Carlos Galindo Flórez</li>
    <li>Duvan Felipe Sánchez Leguizamón</li>
    <li>Kevin Andrés Mora Castañeda</li>
</ul>
</div>
</footer>
</body>
</html>
