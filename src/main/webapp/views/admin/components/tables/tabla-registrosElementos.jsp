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

<section id="tabla-registrosElementos" class="container-fluid mt-3">
    <!-- TABLA DE ELEMENTOS -->
    <div class="container">
        <div class="row mx-0 mb-3">
            <div class="hstack gap-3">
                <h3>Elementos</h3>
                <div class="vr"></div>
                <form action="elemento" method="get">
                    <input class="form-control me-auto" type="text" name="placa" placeholder="Buscar por numero de placa" aria-label="Add your item here...">
                    <button type="submit" name="accion" value="buscar_elementos" class="btn btn-success">Enviar</button>
                </form>
                <div class="vr"></div>
                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-outline-success" for="btnradio1">Desechable</label>
                
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                    <label class="btn btn-outline-success" for="btnradio2">Consumible</label>
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
                            <button class="accordion-button collapsed rounded-3 bg-success text-white text" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
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