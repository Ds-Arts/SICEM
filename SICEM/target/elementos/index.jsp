<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SENA - SICEM</title>
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
        <div class="container ms-5" style="width: 85px; height: 85px">
            <a class="navbar-brand" href="elemento?action=entrahome">
                <img src="https://senacertificados.co/wp-content/uploads/2021/10/Logo-de-SENA-png-verde-300x300-1.png"
                    alt="Logo" width="90" height="90" class="d-inline-block align-text-top" />
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
                        <a class="nav-link active buttom__default px-4" aria-current="page" href="Usuario?action=login">Ingresar</a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link active buttom__default px-4" href="Usuario?action=register">Registro</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>

    <!-- CONTENEDOR DE LA PRESENTACION -->
    <div class="container text-center mt-5"> 
        <H1>Bienvenido a SICEM</H1>
        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Earum hic est unde dignissimos officia enim. optio voluptatum adipisci magni accusamus nemo, magnam ad at? Est, dolore. Possimus, numquam officiis? Dolorum, assumenda tempora, ipsum sint, consectetur deleniti voluptatem distinctio eligendi rerum quos iusto iure?</p>
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
                    <img src="https://images.unsplash.com/photo-1692782040975-96fe03291fa6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                        class="d-block w-100" style="height: 500px; background-position: center center" alt="..." />
                </div>
                <!-- IMAGEN -->
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="https://images.unsplash.com/photo-1692095296815-943c0e214cd0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1932&q=80"
                        class="d-block w-100" style="height: 500px; background-position: center center" alt="..." />
                </div>
                <!-- IMAGEN -->
                <div class="carousel-item">
                    <img src="https://images.unsplash.com/photo-1693040516624-a22f0906faab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MjN8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
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
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptate est ipsa perspiciatis non, ut incidunt aliquid numquam quaerat quos quo obcaecati reiciendis voluptatum dolores quas qui ipsum, et pariatur nihil. Vel aut et earum minus molestias, eos tempora maxime ratione voluptatum dolorem perferendis saepe sequi ea officia. Sunt suscipit totam, quo voluptatum eaque unde molestias cupiditate deserunt tenetur. Aliquid non accusantium beatae atque tempora! Sint recusandae nulla officiis laudantium nostrum. Magni eligendi, distinctio eius optio dolorum labore nam perferendis dignissimos necessitatibus error nihil temporibus itaque mollitia iure dicta praesentium repellat odio corrupti. Voluptates, minus animi sit mollitia libero quis quibusdam!</p>
                </div>
            </article>
            <!-- ARTICULO 2 -->
            <article  class="row text-start my-5 py-3">
                <div class="col-6">
                    <h2>¿Quienes lo pueden usar?</h2>
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nisi debitis ut consectetur repudiandae eligendi quam atque optio, temporibus recusandae beatae incidunt nulla molestiae fugit voluptatum nemo enim voluptatem ab officiis.</p>
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
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nisi debitis ut consectetur repudiandae eligendi quam atque optio, temporibus recusandae beatae incidunt nulla molestiae fugit voluptatum nemo enim voluptatem ab officiis.</p>
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
                        <p style="height: 20rem;" class="card-text overflow-x-hidden">He pedido varios elementos esta semana, 
                            tengo un proyecto final este fin de trimestre, sin embargo, 
                            necesito mucho material para producir el producto final. 
                            El punto es, cuantos elementos puedo pedir?
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
                        <h5 class="card-title">¿Cuantos elementos me pueden prestar?</h5>
                        <h6 class="card-subtitle mb-2 text-muted ">Johan Ruisales</h6>
                        <p style="height: 20rem;" class="card-text overflow-x-hidden">He pedido varios elementos esta semana, 
                            tengo un proyecto final este fin de trimestre, sin embargo, 
                            necesito mucho material para producir el producto final. 
                            El punto es, cuantos elementos puedo pedir?
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
                        <h5 class="card-title">¿Cuantos elementos me pueden prestar?</h5>
                        <h6 class="card-subtitle mb-2 text-muted ">Johan Ruisales</h6>
                        <p style="height: 20rem;" class="card-text overflow-x-hidden">He pedido varios elementos esta semana, 
                            tengo un proyecto final este fin de trimestre, sin embargo, 
                            necesito mucho material para producir el producto final. 
                            El punto es, cuantos elementos puedo pedir?
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