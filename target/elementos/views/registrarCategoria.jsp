<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/CSS/shady.css">
    <link rel="icon" href="assets/IMG/ventana.png">
    <title>Registrar una nueva vategoria</title>
</head>
<body>    
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
            <!-- parametos con la informacion de la nueva categoria -->
            <form class="formu"  action="categoria" method="post">
                <label for="">Ingrese nombre de la categoria</label>
                <input type="text" pattern="[A-Za-z ]{3,40}" name="n_categoria">
                <label for="">Caracteristicas de  la categoria</label>
                <input type="text" pattern="[A-Za-z ]{3,40}" name="d_categoria">  
                <button type="submit" name="action" value="en_categoria">Guardar</button>  
            </form>
            <aside class="extra">
                <a href="elemento?accion=listar">
                    <button><center>Consultar Elementos registrados</center></button>
                </a>

                <a href="Usuario?action=registrarU">
                    <button>Registrar Usuarios</button>
                </a>

                <a href="Usuario?action=list">
                    <button>Consultar usuarios registrados en el sistema</button>
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