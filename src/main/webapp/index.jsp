<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SENA - SICEM</title>
    <link rel="icon" href="assets/IMG/favicon.ico">
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>


    <link rel="stylesheet" href="assets/CSS/custom.css">


    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
</head>

<body style="color: #1f1f1f;" class="bg-body-tertiary">
<!-- HEADER -->
<header class="navbar navbar-expand-lg bg-body shadow-sm">
    <!-- LOGO -->
    <div class="container mx-2" style="width: 150px; height: 85px;">
        <a class="navbar-brand" href="#">
          <img src="assets\IMG\logo_mono.png" alt="Logo" width="150" height="50" class="d-inline-block align-text-top"> 
        </a>
      </div>
    <!-- BOTONES -->
    <div class="container-fluid botones">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse me-4 justify-content-end" id="navbarNavDropdown">
            <ul class="navbar-nav me-5">
                <li class="nav-item me-3">
                    <a class="nav-link active px-4" aria-current="page" href="Usuario?action=login"><button class="btn btn-outline-success">Ingresar</button></a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link active px-4" aria-current="page" href="Usuario?action=testing">Testing 1</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link active px-4" aria-current="page" href="Usuario?action=dash">Testing 2</a>
                </li>
            </ul>
        </div>
    </div>
</header>

<!-- CONTENEDOR DE LA PRESENTACION -->
<div class="container text-center mt-5">
    <H1>Bienvenido a SICEM</H1>
    <p>El Sistema de Inventario y Control de Elementos SICEM, le da la bienvenida. Si ya tiene una cuenta válida proceda a ingresar a nuestro sistema
        mediante el botón que mostrará el formulario de Logeo. Una vez dentro, podrá acceder a todas las herramientas y funcionalidades diseñadas para brindar asistencia 
        en el manejo y control del stock de elementos perteneciente a la coordinación de teleinformática para el SENA ubicado en la calle 52
        ¡Comencemos a simplificar y potenciar la gestión de inventario juntos! Cordialmente. El equipo desarrollador de SICEM 
    </p>
</div>
<!-- CONTENEDOR DEL CAROUSEL -->
<div class="container w-75 h-25">
    <div id="carouselExampleDark" class="carousel carousel-dark slide shadow-lg" data-bs-ride="carousel">
        <!-- BOTON -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
        </div>
        <!-- CONTENDEDOR DE LAS IMAGENES -->
        <div class="carousel-inner mt-5">
            <!-- IMAGEN -->
            <div class="carousel-item active" data-bs-interval="10000">
                <img src="https://www.elpolideportivo.com/wp-content/uploads/2021/07/IMG-20210721-WA0085-1024x682.jpg"
                     class="d-block w-100" style="height: 500px; background-position: center center" alt="..." />
            </div>
            <!-- IMAGEN -->
            <div class="carousel-item" data-bs-interval="2000">
                <img src="https://mexico.unir.net/wp-content/uploads/sites/6/2022/09/que-hace-programador.jpg"
                     class="d-block w-100" style="height: 500px; background-position: center center" alt="..." />
            </div>
            <!-- IMAGEN -->
            <div class="carousel-item">
                <img src="https://www.sena.edu.co/es-co/sena/PublishingImages/Directorio-.jpg"
                     class="d-block w-100" style="height: 500px; background-position: center center" alt="..." />
            </div>
        </div>
        <!-- BOTON -->
        <button class="carousel-control-prev opacity-0" type="button" data-bs-target="#carouselExampleDark"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next opacity-0" type="button" data-bs-target="#carouselExampleDark"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!-- PIE DE NOTA -->
<div class="pt-5 text-center text-black-50">
    <p>Puedes ver mas contenido a continuacion.</p>
    <img class="opacity-25" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAO9JREFUSEvt1M1JxkAUheHnA61BQUVRmxAR+7ABwQJsw5Ubd5YiIjbhPwpag78cSCAEk8kHBjeZ5XA5773n3JmZkc9sZH0ToOjwv1t0jHO8dbS6hAOcdI3SN8ERTnGLfby0RFZwgS0c4uw3SB9gGZfYxiN2G5CIX2EdN9jD67yA1AdyjY0GJPe1+AN2usRTOCTk1cqKTdxjAWu4q6x77lulEqAOebGyK5PkpPPY8v6XIaeZ2PVRiX+PEXIm+cLnFHJ7MbJJeRPtkHs3aOia1rBAmiEXxecFpD4TJOSn4jdaFZTewVCdzroJULRwdIt+AMCiOxm0PZncAAAAAElFTkSuQmCC"/>
</div>
<!--CONTENEDOR APRENDE UN POCO SOBRE SICEM -->
<section class="bg-body my-5 shadow py-3">
    <!-- PRESENTACION -->
    <h1 class="text-center my-5">Aprendamos un poco sobre SICEM</h1>
    <!-- CONTENEDORES -->
    <section class="container">
        <!-- ARTICULO 1 -->
        <article class="row text-start my-5 py-3">
            <div class="col-6 justify-content-md-around justify-content-center">
                <img style="width: 30em; height: 300px;" class="float-start rounded shadow border-0 opacity-0">
            </div>
            <div class="col-6">
                <h2>¿Para que sirve?</h2>
                <p>SICEM es una herramienta digital desarrollada con el propósito y visión de ayudar y simplificar las tareas de control y préstamo de elementos del personal administrativo también llamados cuentadantes.
                    Con SICEM, los encargados reducirán en gran medida el error humano y los posibles errores de memoria a la hora de realizar el préstamo de herramientas materiales e insumos registrados en el sistema y realizar la observación de novedades relacionadas al estado de los equipos de determinados ambientes ya que todo queda registrado y auditado en el propio sistema de información.
                    Los elementos registrados en el sistema está limitado exclusivamente a la coordinación de teleinformática del CGMLTI.<br>
                    
                    ¡Optimicemos la gestión de recursos para potenciar el crecimiento educativo de nuestra familia SENA!
                    <p>
            </div>
        </article>
        <!-- ARTICULO 2 -->
        <article  class="row text-start my-5 py-3">
            <div class="col-6">
                <h2>¿Quienes lo pueden usar?</h2>
                <p>El sistema de información podrá ser utilizado por el usuario Administrador o cuentadantes, e instructores de planta pertenecientes a la institución SENA CGMLTI ubicado en la calle 52
                    Los distintos actores del sistema tienen diversas funciones dentro de SICEM, algunas de estas son las acciones de gestión de todos los elementos que se registren, solicitar y decidir los términos referentes a cualquier 
                    préstamo que se solicite a travéz del programa.

                </p>
            </div>
            <div class="col-6 justify-content-md-around justify-content-center">
                <img style="width: 30em; height: 300px;" class="float-end rounded shadow border-0 opacity-0">
            </div>
        </article>
        <!-- ARTICULO  -->
        <article  class="row text-start my-5 py-3">
            <div class="col-6 justify-content-md-around justify-content-center">
                <img style="width: 30em; height: 300px;" class="float-start rounded shadow border-0 opacity-0">
            </div>
            <div class="col-6">
                <h2>¿Que problema soluciona?</h2>
                <p>El traspaso de inventarios, la pérdida de elementos al no saber a quien se le habían prestado, y la tediosa mecánica para llevar cuenta de estas acciones
                    eran casos los cuales presentaban gran número de desperfectos y problemas. SICEM fue diseñada teniendo en cuenta estas problemáticas, por lo cual es la herramienta infaltable para los cuentadantes de la institución.
                </p>
            </div>
        </article>
    </section>
</section>
<!-- PREGUNTAS FRECUENTES -->
<section class="container-fluid text-center">
    <article class="row py-5">
        <h1>Preguntas frecuentes</h1>
        <p>En esta sección podemos platicar sobre algunas preguntas frecuentes que realizan referente al uso de esta plataforma.</p>
    </article>
    <article class="container">
        <!-- CONTENEDOR DE CARTAS -->
        <section class="row flex-row justify-content-around">
            <!-- CARTA -->
            <div class="card shadow" style="width:18rem; height: 20rem;">
                <div class="card-body">
                    <h5 class="card-title">¿Cuantos elementos me pueden prestar?</h5>
                    <h6 class="card-subtitle mb-2 text-muted ">Johan Ruisales</h6>
                    <p style="height: 20rem;" class="card-text overflow-x-hidden">El cuentadante es quien verificará y analizará tu caso y acordará el límite
                        de elementos según considere oportuno en cada caso.
                        <style>
                            ::-webkit-scrollbar {
                                display: none;
                            }
                        </style>
                    </p>
                </div>
            </div>
            <!-- CARTA -->
            <div class="card shadow" style="width:18rem; height: 20rem;">
                <div class="card-body">
                    <h5 class="card-title">¿Como solicito un préstamo?</h5>
                    <h6 class="card-subtitle mb-2 text-muted ">Luis Tapia</h6>
                    <p style="height: 20rem;" class="card-text overflow-x-hidden">Pensando en este caso el equipo de desarrollo 
                        ha dispuesto una serie de formularios para que puedas solicitar tu préstamo. El único requiesito es tener una cuenta hábil
                        dentro de nuestro sistema.
                        <style>
                            ::-webkit-scrollbar {
                                display: none;
                            }
                        </style>
                    </p>
                </div>
            </div>
            <!-- CARTA -->
            <div class="card shadow" style="width:18rem; height: 20rem;">
                <div class="card-body">
                    <h5 class="card-title">Soy un usuario ¿Cómo puedo registrar elementos?</h5>
                    <h6 class="card-subtitle mb-2 text-muted ">Martha Cifuentes</h6>
                    <p style="height: 20rem;" class="card-text overflow-x-hidden">El sistema pone a disposición los formularios necesarios para que el cuentadantes, único usuario con el privilegio de registrar elementos. Realice esta acción dentro del sistema.
                        <style>
                            ::-webkit-scrollbar {
                                display: none;
                            }
                        </style>
                    </p>
                </div>
            </div>
        </section>
    </article>
</section>
</body>
</html>