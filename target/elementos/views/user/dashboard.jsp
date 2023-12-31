<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <div class="container">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <h3 class="navbar-brand">Dashboard - Usuario</h3>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    Perfil
                                    <svg  width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 20 20">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                    </svg>  
                                </a>
                            </li>
                            <li class="nav-item">
                                <form action="Usuario" method="POST">
                                <button class="nav-link active" name="action" value="logout" >
                                    Salir
                                    <svg  width="25" height="25" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                                        <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                    </svg>
                                </button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- BIENVENIDA Y CONTADORES -->
            <div class="row py-3 row-cols-2 border-bottom">
                <!-- CARD -->
                <div class="col-sm-7">
                    <div class="row py-3 me-3 h-100">
                        <div class="container-sm h-100 py-3">
                            <h1 class="text-success">!Bienvenido,</h1>
                            <h3>Andres Julian Cordoba Ventura!</h3>
                            <p>Tienes <span class="text-success">0</span> notificaciones pendientes.</p>
                        </div>
                    </div>
                </div>
                <!-- CARD -->
                <div class="col-sm-5">
                    <div class="row py-3 bg-body shadow-sm me-3 border-bottom mb-3 px-3 rounded-3">
                        <div class="col-sm-9">
                            <h6>Elementos solicitados</h6>
                        <h3 class="text-success">0</h3>
                        </div>
                    </div>
                    <div class="row py-3 bg-body shadow-sm me-3 border-bottom mb-3 px-3 rounded-3">
                        <div class="col-sm-9">
                            <h6>Elementos prestados</h6>
                        <h3 class="text-success">0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <!-- TABLA DE ELEMENTOS SOLICITABLES -->
            <div class="row h-25 py-3 border-bottom">
                <table class="table caption-top">
                    <caption>Lista de elementos disponibles</caption>
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Placa</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Aula</th>
                            <th scope="col">Propietario</th>
                            <th scope="col">---</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>G502</td>
                            <td>08197e4</td>
                            <td>Mouse</td>
                            <td>402</td>
                            <td>Sena</td>
                            <td>
                                <button class="btn btn-secondary">Solicitado</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Hp</td>
                            <td>AR09127</td>
                            <td>Portatil</td>
                            <td>402</td>
                            <td>Sena</td>
                            <td>
                                <button class="btn btn-success">Solicitar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            
            <!-- TABLAS DE ELEMENTOS PRESTADOS Y SOLICITAOS -->
            <div class="row my-3 h-25">
                <div class="col-sm-6">
                    <table class="table caption-top">
                    <caption>Lista de elementos solicitados</caption>
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Placa</th>
                            <th scope="col">Propietario</th>
                            <th scope="col">---</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>G502</td>
                            <td>08197e4</td>
                            <td>00/00/00</td>
                            <td>
                                <button class="btn btn-danger">Cancelar</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Hp</td>
                            <td>AR09127</td>
                            <td>00/00/00</td>
                            <td>
                                <button class="btn btn-danger">Cancelar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </div>
                <div class="col-sm-6">
                    <table class="table caption-top">
                    <caption>Lista de elementos prestados</caption>
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Placa</th>
                            <th scope="col">Propietario</th>
                            <th scope="col">Fecha entrega</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>G502</td>
                            <td>08197e4</td>
                            <td>Sena</td>
                            <td>00/00/00</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Hp</td>
                            <td>AR09127</td>
                            <td>Sena</td>
                            <td>00/00/00</td>
                        </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>



        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>

</html>