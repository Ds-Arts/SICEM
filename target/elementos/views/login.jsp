<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inicio de sesión</title>

    <link rel="icon" href="assets/IMG/favicon.ico">

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"
    ></script>
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
    ></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"
    ></script>
</head>
<body>

<header class="navbar navbar-expand-lg bg-body-tertiary">

    <div class="container mx-2" style="width: 150px; height: 85px;">
        <a class="navbar-brand" href="#">
          <img src="assets\IMG\logo_mono.png" alt="Logo" width="150" height="50" class="d-inline-block align-text-top"> 
        </a>
      </div>

    <div class="container-fluid botones">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse me-4 justify-content-end" id="navbarNavDropdown">
            <ul class="navbar-nav me-5">
                <li class="nav-item  me-3">
                    <a class="nav-link active buttom__default px-4" aria-current="page" href="Usuario?action=home">Pagina principal</a>
                </li>
            </ul>
        </div>
    </div>
</header>


<section class="container">

    <div style="height: 70vh;" class="container border row my-5 border border-1 p-0">

        <aside style="height: 70vh;" class="col-6 px-5 py-5">
            <article>
                <h2>Iniciar sesión</h2>
                <p>Siempre es un placer verte de nuevo.</p>
            </article>
            <form class="my-5" action="Usuario" method="POST">
                <article>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">@</span>
                        <input id="numIdentificacion" name="numIdentificacion" type="number" class="form-control" placeholder="Ingrese su numero de identifiación" aria-label="ID" aria-describedby="basic-addon1">

                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">*</span>
                        <input id="contrasena" name="contrasena" type="password" class="form-control" placeholder="Ingrese su contraseña" aria-label="Username" aria-describedby="basic-addon1">
                    </div>
                </article>
                <article>
                    <button class="btn btn-success border-success" type="submit" name="action" value="login">Ingresar</button>
                </article>
            </form>
        </aside>

        <aside style="height: 70vh;" class="backgroundCover col-6">

            <style>
                .backgroundCover{
                    background-image: url(https://images.unsplash.com/photo-1545830790-68595959c491?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1935&q=80);
                    background-position: center center;
                    background-size: cover;
                    background-repeat: no-repeat;
                    opacity: 95%;
                }
            </style>
        </aside>
        <article style="height: 20px; font-size: 12px; color: white;" class="text-end px-2 bg-success">
            <p>Esta imagen proviene de
                <a style="color: white;" href="https://unsplash.com/es/fotos/xj7HV0FvSg0">
                    Unsplash
                </a>
            </p>
        </article>
        <style>
            .form-distri{
                height: 60%;

                position: relative;

                display: flex;
                flex-direction: column;
                justify-content: center;
            }
        </style>
    </div>

</section>

</body>
</html>