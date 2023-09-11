<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inicio de sesión</title>
    <!-- ICON -->
    <link rel="icon" href="assets/IMG/Logo_Sena.png">
    <!-- BOOTSTRAP -->
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
    <!-- HEADER -->
    <header class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container mx-2" style="width: 85px; height: 85px;">
        <a class="navbar-brand" href="#">
          <img src="assets/IMG/Logo_Sena.png" alt="Logo" width="80" height="80" class="d-inline-block align-text-top"> 
        </a>
      </div>
      <div class="container-fluid">
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNavDropdown"
          aria-controls="navbarNavDropdown"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Registro</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Acerca de nosotros</a>
            </li>
          </ul>
        </div>
      </div>
    </header> <!-- END HEADER -->

    <!-- CONTENEDOR GENERAL -->
    <section class="container">

      <div class="container-sm row my-5 border border-1 p-0 shadow"><!-- CONTENEDOR GENERAL LOGIN -->
        
        <aside class="col-6 px-5 py-5"><!-- FORMULARIO / LOGIN -->
          <h2>Iniciar sesión</h2>
          <p>Siempre es un placer verte de nuevo.</p>
          <form class="my-5" action="Usuario" method="POST">
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1">@</span>
              <input type="text" class="form-control" id="numIdentificacion" name="numIdentificacion" placeholder="Numero de identificacion" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1">*</span>
              <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Contraseña" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <button class="btn btn-primary" style="background-color: rgb(59, 169, 0); border-color: rgb(59, 169, 0);" type="submit" name="action" value="login">Ingresar</button>
            <p class="my-3">¿Aún no tienes una cuenta? <a style="color: rgb(59, 169, 0);" href="#">Click aquí</a>.</p>
          </form>
        </aside><!-- END FORMULARIO / LOGIN -->

        <aside class="backgroundCover col-6"><!-- CONTENIDO / MAS INFORMACION -->
          <!-- FONDO DE PANTALLA -->
          <style>
            .backgroundCover{
              background-image: url(assets/IMG/Login_Granjero.jpg);
              background-position: center center;
              background-size: cover;
              background-repeat: no-repeat;
              opacity: 95%;
            }
          </style>
        </aside><!-- END CONTENIDO / MAS INFORMACION -->
        <article style="height: 20px; font-size: 12px; color: white; background-color: rgb(59, 169, 0);" class="text-end px-2">
          <p>Esta imagen proviene de 
            <a style="color: white;" href="https://unsplash.com/es/fotos/xj7HV0FvSg0">
              Unsplash
            </a>
          </p>
        </article>

      </div><!-- END CONTENEDOR LOGIN -->

    </section><!-- END CONTENEDOR GENERAL -->

  </body>
</html>
