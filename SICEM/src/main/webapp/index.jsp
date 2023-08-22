<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ElementosDao" %>
<%@ page import="model.ElementosVo" %>
<%@ page import="java.util.List" %>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/CSS/shady.css">
    <link rel="icon" href="assets/IMG/ventana.png">
    <title>home</title>
</head>
<body>
    <header>
        <div class="logo">
            <img src="assets/IMG/sena.png">
            <h1>  | Sistema Inventario</h1>
            <div class="btnsup"> 
                <a href="elemento?accion=registrar">
                    <button>Registrar elementos</button>
                </a>

                <a href="Usuario?action=registrarU">
                    <button>registrar usuarios</button>
                </a>

                <a href="elemento?accion=c_categoria"> 
                <button>crear categoria</button>
                </a>
                <a href="Usuario?action=login">
                <button>iniciar sesion</button>
                </a>
                <button>Acceso</button>
            </div>
        </div>
        
<!--Parte superior ⬆️⬆️-->

      
        </div>
    </header>
<nav>
    <h1>este es el home</h1>
</footer>

</body>
</html>