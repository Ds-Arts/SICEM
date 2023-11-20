<%-- IMPORTS DE ELEMENTOS --%>
<%@ page import="model.ElementosDao" %>
<%@ page import="model.ElementosVo" %>
<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>
<%@ page import="java.util.List" %>

<%-- IMPORTS DE PRESTAMOS --%>
<%@ page import="model.PrestamosVo" %>
<%@ page import="model.PrestamosDao" %>

<%-- IMPORTS DE USUARIOS --%>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<head>
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
        <link rel="shortcut icon" href="../assets/img/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>

<section id="tabla-registrosElementos" class="container-fluid mt-3 py-5">
    <!-- TABLA DE ELEMENTOS -->
    <div class="container">
        <div class="row mx-0 mb-3">
            <div class="hstack gap-3">
                <h3>Elementos</h3>
                <div class="vr"></div>
                    <!-- BOTON DE AGREGAR NUEVO USUARIO -->
                    <h5>Agregar</h5>
                    <input class="btn-check">
                    <button class="btn btn-outline-success" onclick="mostrarComponente('views/admin/components/forms/tabla-registrarElementos.jsp')">
                        <i class="bi bi-plus-lg"></i>
                    </button>
                <div class="vr"></div>
                <form class="input-group" action="elemento" method="GET">
                    <input name="placa" class="form-control me-auto" type="text" placeholder="Buscar por numero de placa" aria-label="Add your item here...">
                    <button type="submit" class="btn btn-success" name="accion" value="buscar_elementos">Enviar</button>
                </form>
                <%-- <form class="input-group" action="elemento" method="get">
                    <input class="form-control me-auto" type="text" name="placa" placeholder="Buscar por numero de placa" aria-label="Add your item here...">
                    <button type="submit" name="accion" value="buscar_elementos" class="btn btn-success">Enviar</button>
                </form> --%>
                <div class="vr"></div>
                    <div class="d-flex align-content-around" role="group" aria-label="Basic radio toggle button group">
                        <form action="elemento" method="GET">
                            <input type="radio" name="TipoElemento" id="TipoElemento" class="btn-check" autocomplete="off" checked  value="Desechable">
                            <button type="submit" class="btn btn-outline-success" name="accion" value="buscar_tipo">Desechable</button>
                        </form>
                        <form action="elemento" method="GET">
                            <input type="radio" name="TipoElemento" id="TipoElemento" class="btn-check"  autocomplete="off" value="Consumo">
                            <button  type="submit" class="btn btn-outline-success" name="accion" value="buscar_tipo">Consumo</button>
                        </form>
                    </div>

            </div>
        </div>
        <!-- CONTENEDOR DE ACORDIONES -->
        <div class="container d-flex flex-row flex-wrap">
            <%
                System.out.println("");
                ElementosDao elementosDao = new ElementosDao();
                UsuarioDao usuarioDao = new UsuarioDao(); // Importa la clase UsuarioDao

                List<ElementosVo> elementos;
                String placa = request.getParameter("placa");

                if (placa != null && !placa.isEmpty()) {
                    elementos = elementosDao.buscarPorNumeroPlaca(placa);
                } else {
                    String tipo = request.getParameter("TipoElemento");
                    if (tipo != null && !tipo.isEmpty()) {
                        elementos = elementosDao.buscarPorTipo(tipo);
                    } else {
                        elementos = elementosDao.listar();
                    }
                }
                for (ElementosVo elemento : elementos) {
                    // Obtener el Usuario correspondiente por su ID
                    UsuarioVo usuario = usuarioDao.buscarUsuarioPorId(elemento.getUsu()); // Reemplaza "buscarUsuarioPorId" con el método real de tu clase UsuarioDao
            %>
            <!-- ACORDION AUTOGENERADO -->
            <div class="col-6 p-3">
                <div class="accordion accordion-flush rounded-3" id="<%= elemento.getNumeroPlaca()%>">
                    <div class="accordion-item rounded-3 shadow-sm">
                        <h2 class="accordion-header">
                            <button class="accordion-button rounded-3 bg-success text-white text" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="true" aria-controls="flush-collapseOne">
                                <div class="row">
                                    <div class="row">
                                        <h6>#0909 | <span class="bi-text-paragraph"><%= elemento.getNumeroPlaca()%></span></h6>
                                    </div>
                                    <div class="row">
                                        <h5><%=elemento.getNombre()%></h5>
                                        <p><%=elemento.getTipo()%></p>
                                    </div>
                                </div>
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#<%= elemento.getNumeroPlaca()%>">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col">
                                            <h6>Aula</h6>
                                            <p><%=elemento.getNumeroAula()%></p>
                                        </div>
                                        <div class="col">
                                            <h6>Estado</h6>
                                            <p><%=elemento.getEstado()%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <h6>N. Placa</h6>
                                            <p><%= elemento.getNumeroPlaca()%></p>
                                        </div>
                                        <div class="col">
                                            <h6>Fecha ingreso</h6>
                                            <p><%=elemento.getFechaIngreso()%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <h6>Cuentadante</h6>
                                            <p><%=usuario.getNombre()%></p>
                                        </div>
                                        <div class="col">
                                            <h6>Costo</h6>
                                            <p>$<%=elemento.getCosto()%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <h6>Descripción</h6>
                                            <p><%=elemento.getDescripcion()%></p>
                                        </div>
                                    </div>
                                    <form class="row" action="elemento" method="post">
                                        <input type="number" name="id_cuentadante" value="<%=elemento.getUsu()%>" hidden>
                                        <input type="text" name="nombre_cuentadante" value="<%=usuario.getNombre()%>" hidden>
                                        <input type="number" name="n_placa_prestamo" value="<%= elemento.getNumeroPlaca()%>" hidden>
                                        <button type="submit" name="accion" value="data_prestamo" class="btn btn-success mb-2">Realizar prestamo</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>