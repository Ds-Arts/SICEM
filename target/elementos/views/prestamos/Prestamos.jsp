<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UsuarioVo" %>
<%@ page import="model.UsuarioDao" %>
<%@ page import="java.util.List" %>

<%@ page import="java.util.List" %>
<%@ page import="model.PrestamosDao" %>
<%@ page import="model.PrestamosVo" %>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
                            <span class="text-success">Ultimos prestamos</span>
                        </h4>
                        <ul class="list-group mb-3 border-bottom">
                            <%
                                PrestamosDao prestamoDao = new PrestamosDao();
                                List<PrestamosVo> prestamos = prestamoDao.ultimosPrestamos();
                                for (PrestamosVo prestamo : prestamos) {
                            %>
                                <li
                                    class="list-group-item d-flex justify-content-between lh-sm">
                                    <div class="d-flex flex-column">
                                        <h5 class="my-2 text-success"><%= prestamo.getNom_elemento() %></h5>
                                        <small class="my-0"><span class="h6">Placa</span>: <%= prestamo.getElementoFk() %></small>
                                        <small class="my-0"><span class="h6">Prestamista</span>: <%= prestamo.getNom_cuenta() %></small>
                                        <small class="my-0"><span class="h6">Prestatario</span>: <%= prestamo.getNom_presta() %></small>
                                    </div>
                                    <span class="text-body-secondary"><i class="bi bi-type"></i></span>
                                </li>
                            <%
                                }
                            %>
                        </ul>

                        <form action="Usuario" method="get">
                            <input type="hidden" name="action" value="testing">
                            <button type="submit"  class="btn btn-success">Lista completa</button>
                        </form>  
                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Información del prestamo</h4>
                        <form   action="Prestamo"   method="post"  class="needs-validation" novalidate >
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="firstName" class="form-label">Nombre del prestamista</label>
                                    <input class="form-control" type="text" id="nombre_cuentadante" name="nombre_cuentadante"    readonly placeholder="<%=request.getAttribute("nombre_cuentadante") %>"  value="<%=request.getAttribute("nombre_cuentadante") %>" >
                                    <input class="form-control" type="text" id="cuentadante_fk" name="cuentadante_fk"    readonly placeholder="<%=request.getAttribute("id_cuentadante") %>"  value="<%=request.getAttribute("id_cuentadante") %>" hidden>
                                </div>

                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Nombre del prestatario</label>
                                    <select   name="prestatario_fk"   class="form-select" id="inputGroupSelect01" required>
                                        <option disabled selected value="" >Elige...</option>
                                            <!-- Iterar a través de los usuarios y mostrar sus nombres en lugar de IDs -->
                                            <% 
                                            String valorAtributo = (String) request.getAttribute("id_cuentadante"); 
                                            int a = 0;
                                            a = Integer.parseInt(valorAtributo);
                                            %>
                                            <%
                                                UsuarioDao usu = new UsuarioDao(); 
                                                List<UsuarioVo> usuarios = usu.listarUsuarios_(a); 
                                                for (UsuarioVo usuario : usuarios) { %> 
                                                    <option value="<%= usuario.getId() %>"><%= usuario.getNombre()%></option>
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

                            <button class="w-100 btn btn-success btn-lg"
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
