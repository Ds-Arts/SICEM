<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inicio de sesión</title>
    <!-- ICON -->
    <link rel="icon" href="/ASSETS/IMG/IDENTIDAD/Logo_Sena.png">
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
    <link rel="stylesheet" href="../../assets/CSS/custom.css">
  </head>
  <body>
    <!-- HEADER -->
    <header class="navbar navbar-expand-lg bg-body-tertiary">
      <!-- LOGO -->
      <div class="container ms-5" style="width: 85px; height: 85px;">
          <a class="navbar-brand">
              <img src="https://senacertificados.co/wp-content/uploads/2021/10/Logo-de-SENA-png-verde-300x300-1.png"
                  alt="Logo" width="90" height="90" class="d-inline-block align-text-top">
          </a>
          <h2 class="ms-5">SICEM</h2>
      </div>
      <!-- BOTONES -->
      <div class="container-fluid botones">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
              aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse me-4 justify-content-end" id="navbarNavDropdown">
              <ul class="navbar-nav me-5">
                  <li class="nav-item  me-3">
                      <a class="nav-link active buttom__default px-4" aria-current="page" href="home.html">Pagina principal</a>
                  </li>
                  <li class="nav-item  me-3">
                      <a class="nav-link active buttom__default px-4" href="Usuario?action=login">Inicio de sesión</a>
                  </li>
              </ul>
          </div>
      </div>
  </header> <!-- END HEADER -->

    <!-- CONTENEDOR GENERAL -->
    <section class="container">

      <div style="height: 95vh;" class="container-sm row my-5 border border-1 p-0 shadow"><!-- CONTENEDOR GENERAL LOGIN -->
        
        <aside style="height: 95vh;" class="border col-6 px-5 pt-5 pb-3"><!-- FORMULARIO / LOGIN -->
          <article>
            <h2>Registro</h2>
            <p>Bienvenido a nuestra herramienta.</p>
          </article>
          <form class="my-5" action="Usuario" method="POST">
            <article>
              <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Aa</span>
                <input id="nombre" name="nombre" required type="text" class="form-control" placeholder="Nombres">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Aa</span>
                <input id="apellido" name="apellido" required type="text" class="form-control" placeholder="Apellidos">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">@</span>
                <input id="email" name="email" required type="email" class="form-control" placeholder="Ingrese un correo electrónico">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">#</span>
                <input id="numIdentificacion" name="numIdentificacion" required type="number" class="form-control" placeholder="Ingrese su numero de identifiación">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">*</span>
                <input type="contrasena" class="form-control" placeholder="Contraseña">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">*</span>
                <input type="contrasena" class="form-control" placeholder="Confirmar contraseña">
              </div>
            </article>
            <article>
              <button class="btn btn-primary" style="background-color: rgb(59, 169, 0); border-color: rgb(59, 169, 0);" type="submit" name="action" value="register">Crear cuenta</button>
              <p class="my-3">Ya tienes una cuenta? <a style="color: rgb(59, 169, 0);" href="login.html">Click aquí</a>.</p>
            </article>
          </form>
        </aside><!-- END FORMULARIO / LOGIN -->

        <aside style="height: 95vh;" class="backgroundCover col-6"><!-- CONTENIDO / MAS INFORMACION -->
          <!-- FONDO DE PANTALLA -->
          <style>
            .backgroundCover{
              background-image: url(https://images.unsplash.com/photo-1505471768190-275e2ad7b3f9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80);
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
        <style>
          .form-distri{
            height: 60%;

            position: relative;

            display: flex;
            flex-direction: column;
            justify-content: center;
          }
        </style>
      </div><!-- END CONTENEDOR LOGIN -->
    </section><!-- END CONTENEDOR GENERAL -->
  </body>
</html>
