<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UsuarioVo" %>
<%@ page import="model.UsuarioDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SENA - SICEM</title>
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
        <link href="../assets/CSS/custom.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
    </head>
    <body class="bg-body-secondary">
        <div class="container">
            <main>
                <div class="py-3 text-center">
                    <img
                        class="d-block mx-auto"
                        src="https://www.epicu.co/wp-content/uploads/2023/02/Logosimbolo-SENA-PRINCIPAL.png"
                        alt
                        width="200"
                        height="200" />
                    <h2>Solicitar prestamos</h2>
                    <p class="lead mb-5">
                        Este es un formulario creado especificamente para que solicites algun prestamo.
                    </p>
                </div>

                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4
                            class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Prestamos actuales</span>
                        </h4>
                        <ul class="list-group mb-3">
                            <li
                                class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h6 class="my-0">Product name</h6>
                                    <small class="text-body-secondary">Brief
                                        description</small>
                                </div>
                                <span class="text-body-secondary">$12</span>
                            </li>
                            <li
                                class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h6 class="my-0">Second product</h6>
                                    <small class="text-body-secondary">Brief
                                        description</small>
                                </div>
                                <span class="text-body-secondary">$8</span>
                            </li>
                            <li
                                class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h6 class="my-0">Third item</h6>
                                    <small class="text-body-secondary">Brief
                                        description</small>
                                </div>
                                <span class="text-body-secondary">$5</span>
                            </li>
                            <li
                                class="list-group-item d-flex justify-content-between bg-body-tertiary">
                                <div class="text-success">
                                    <h6 class="my-0">Promo code</h6>
                                    <small>EXAMPLECODE</small>
                                </div>
                                <span class="text-success">−$5</span>
                            </li>
                            <li
                                class="list-group-item d-flex justify-content-between">
                                <span>Total (USD)</span>
                                <strong>$20</strong>
                            </li>
                        </ul>

                        <form class="card p-2">
                            <div class="input-group">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Promo code" />
                                <button type="submit" class="btn btn-secondary">Redeem</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Información del prestamo</h4>
                        <form class="needs-validation" novalidate>
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="firstName" class="form-label">Nombre del prestamista</label>
                                    <input type="text" class="form-control" id="cuentadante_fk" name="cuentadante_fk" readonly placeholder='<%=request.getAttribute("id_cuentadante") %>' value='<%=request.getAttribute("id_cuentadante") %>'>
                                </div>

                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Nombre del prestatario</label>
                                    <select class="form-select" id="inputGroupSelect01" required>
                                        <option selected>Elige...</option>
                                            <!-- Iterar a través de los usuarios y mostrar sus nombres en lugar de IDs -->
                                            <% 
                                            String valorAtributo = (String) request.getAttribute("id_cuentadante"); 
                                            int a = 0;%>
                                            <%
                                                UsuarioDao usu = new UsuarioDao(); 
                                                List<UsuarioVo> usuarios = usu.listarUsuarios_(a); 
                                                for (UsuarioVo usuario : usuarios) { %> 
                                                    <option value="<%= usuario.getId() %>"><%= usuario.getNombre() %></option>
                                            <% } %>
                                        </select> 
                                    <div class="invalid-feedback">
                                        Es necesario un prestamista.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="lastName" class="form-label">Numero de placa</label>
                                    <input type="number" class="form-control" id="elemento_fk" name="elemento_fk" placeholder='<%=request.getAttribute("n_placa_prestamo") %>' value='<%=request.getAttribute("n_placa_prestamo") %>' readonly required/>
                                </div>

                                <div class="col-sm-6">
                                    <label for="firstName" class="form-label">Fecha inicio</label>
                                    <input type="date" placeholder="Fecha de ingreso" class="form-control" id="fechaInicio" name="fecha_inicio" min="1904-01-01" max="6000-12-31" required/>
                                    <div class="invalid-feedback">
                                        Es necesario una fecha.
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Fecha fin</label>
                                    <input type="date" placeholder="Fecha de ingreso" class="form-control" id="fechaFin" name="fecha_fin" min="1904-01-01" max="6000-12-31" required/>
                                    <div class="invalid-feedback">
                                        Es necesario una fecha.
                                    </div>
                                </div>
                            </div>

                            <hr class="my-4" />

                            <button class="w-100 btn btn-primary btn-lg"
                            type="submit" name="action" value="registrar">
                                Realizar prestamo
                            </button>
                        </form>
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-body-secondary text-center text-small">
                <p class="mb-1">Todos los derechos reservados - SICEM - Sena 2023</p>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#">Privacy</a></li>
                    <li class="list-inline-item"><a href="#">Terms</a></li>
                    <li class="list-inline-item"><a href="#">Support</a></li>
                </ul>
            </footer>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>
</html>
