<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SENA - SICEM</title>
        <!-- BOOTSTRAP -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous" />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/custom.css" />
        <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
    </head>

    <body class="bg-body-tertiary">
        <!-- HEADER -->
        <nav class="navbar navbar-light bg-body border-bottom justify-content-between">
            <!-- ORGANIZADOR DEL CONTENIDO -->
            <div class="container-fluid">
                <!-- LOGO -->
                <a class="navbar-brand" href="#">
                    <img
                        src="assets/IMG/logo1.png"
                        alt
                        width="30"
                        height="30"
                        class="d-inline-block align-text-top me-1" />
                    | SICEM - PERFIL
                </a>
                <!-- CONTENEDOR DE BOTONES -->
                <div class="navbar-nav">
                    <a href="Usuario?action=dash" type="button" class="btn btn-danger">Salir</a>
                </div>
            </div>
        </nav>

        <!-- CONTENIDO GENERAL -->
        <div class="container-md bg-body my-5 py-5 shadow">

            <!-- INFORMACION DEL PERFIL -->
            <div class="container">
                <div
                    style="display: flex; align-items: center; justify-content: center;"
                    class="row">

                    <!-- CONTENEDOR DE LA FOTO DE PERFIL -->
                    <div class="col-3">
                        <img class="profile-photo-xl float-start" />
                        <style>
                            .profile-photo-xl {
                                width: 15em;
                                height: 15em;

                                border-radius: 100%;

                                background-image: url("https://images.unsplash.com/photo-1680038263427-4bba0a88a53e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60");
                                background-repeat: no-repeat;
                                background-position: center center;
                                background-size: cover;
                            }
                        </style>
                    </div>
                    
                    <!-- CONTENDDOR DE INFORMACION DEL PERFIL -->
                    <div class="col-9">
                        <!-- FORMULARIO PARA ACTUALIZAR INFO DEL PERFIL DE USUARIO -->
                        <form class="row g-3 needs-validation" method="" action="" novalidate>
                            <!-- NOMBRE DE USUARIO -->
                            <div class="col-md-6">
                                <label
                                    class="form-label">Nombres</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id=""
                                    name=""
                                    value="Mark Ly"
                                    required />
                            </div>
                            <!-- APELLIDO DEL USUARIO -->
                            <div class="col-md-6">
                                <label
                                    class="form-label">Apellidos</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id=""
                                    name=""
                                    value="Otto Stanlyson"
                                    required />
                            </div>
                            <!-- CORREO ELECTRONICO -->
                            <div class="col-md-12">
                                <label
                                    class="form-label">Correo electronico</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text">@</span>
                                    <input
                                        type="email"
                                        class="form-control"
                                        id=""
                                        name=""
                                        aria-describedby="inputGroupPrepend"
                                        value="photo's@gmail.com"
                                        required />
                                </div>
                            </div>
                            <!-- NUMERO DE IDENTIDICACION -->
                            <div class="col-md-123">
                                <label
                                    class="form-label">Numero de identificación</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id=""
                                    name=""
                                    value="1028756545"
                                    required />
                            </div>
                            <!-- CONTRASEÑA -->
                            <div class="col-md-6">
                                <label
                                    class="form-label">Contraseña</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id=""
                                    name=""
                                    value="12345"
                                    required />
                            </div>
                            <!-- CONFIRMAR CONTRASEÑA -->
                            <div class="col-md-6">
                                <label
                                    class="form-label">Confirmar contraseña</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id=""
                                    name=""
                                    value="12345"
                                    required />
                            </div>
                            <!-- BOTON DE ENVIO DE INFO DEL FORMULAIRO --->
                            <div class="col-12">
                                <button class="btn btn-success" type="submit">
                                    Actualizar Información
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
