<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SENA - SICEM</title>
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
    <link href="../assets/CSS/custom.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
</head>

<body class="bg-body-tertiary">
<section class="container-fluid ">
    <div class="row">
        <aside id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse shadow bg-body" style="height: 100vh; position: fixed;">
            <div class="position-sticky pt-3">
                <div class="row border-bottom px-3 pb-3">
                    <img src="../../../assets/img/logo_mono.png" alt="">
                </div>
                <ul class="navbar-nav">
                    <div class=" border-bottom">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#elementosRegistrados">
                                <svg xmlns="http://www.w3.org/2000/svg" class="bd-placeholder-img flex-shrink-0 me-0 rounded"
                                    width="20" height="20" viewBox="0 0 25 25" style="fill: rgba(0, 0, 0, 1);">
                                    <path
                                            d="m3.553 18.895 4 2a1.001 1.001 0 0 0 .894 0L12 19.118l3.553 1.776a.99.99 0 0 0 .894.001l4-2c.339-.17.553-.516.553-.895v-5c0-.379-.214-.725-.553-.895L17 10.382V6c0-.379-.214-.725-.553-.895l-4-2a1 1 0 0 0-.895 0l-4 2C7.214 5.275 7 5.621 7 6v4.382l-3.447 1.724A.998.998 0 0 0 3 13v5c0 .379.214.725.553.895zM8 12.118l2.264 1.132-2.913 1.457-2.264-1.132L8 12.118zm4-2.5 3-1.5v2.264l-3 1.5V9.618zm6.264 3.632-2.882 1.441-2.264-1.132L16 12.118l2.264 1.132zM8 18.882l-.062-.031V16.65L11 15.118v2.264l-3 1.5zm8 0v-2.264l3-1.5v2.264l-3 1.5zM12 5.118l2.264 1.132-2.882 1.441-2.264-1.132L12 5.118z">
                                        <text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text>
                                </svg>
                                Elementos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#usuariosRegistrados">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path></svg>
                                Usuarios
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#categoriasRegistrados">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);" class="bd-placeholder-img flex-shrink-0 me-1 rounded">
                                    <path d="M16.813 4.419A.997.997 0 0 0 16 4H3a1 1 0 0 0-.813 1.581L6.771 12l-4.585 6.419A1 1 0 0 0 3 20h13a.997.997 0 0 0 .813-.419l5-7a.997.997 0 0 0 0-1.162l-5-7zM15.485 18H4.943l3.87-5.419a.997.997 0 0 0 0-1.162L4.943 6h10.542l4.286 6-4.286 6z"></path></svg>
                                Categorias
                            </a>
                        </li>
                    </div>
                    <li class="nav-item">
                        <a class="nav-link active" href="Usuario?action=logout">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);">
                                <path d="M19.002 3h-14c-1.103 0-2 .897-2 2v4h2V5h14v14h-14v-4h-2v4c0 1.103.897 2 2 2h14c1.103 0 2-.897 2-2V5c0-1.103-.898-2-2-2z"></path>
                                <path d="m11 16 5-4-5-4v3.001H3v2h8z"></path>
                            </svg>
                            Salir
                        </a>
                    </li>
                    
                    <li>
                        <form action="Usuario" method="get">
                            <input type="hidden" name="action" value="lll">
                            <button type="submit" class="btn btn-light">perfil</button>
                        </form> 
                    </li>
                </ul>
            </div>
        </aside>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="chartjs-size-monitor">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-2 border-bottom">
                    <h1 class="h2">Administrador</h1>
                    <a data-bs-toggle="offcanvas" href="#news" role="button" aria-controls="offcanvasExample">
                        <svg class="me-3" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="M19 13.586V10c0-3.217-2.185-5.927-5.145-6.742C13.562 2.52 12.846 2 12 2s-1.562.52-1.855 1.258C7.185 4.074 5 6.783 5 10v3.586l-1.707 1.707A.996.996 0 0 0 3 16v2a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1v-2a.996.996 0 0 0-.293-.707L19 13.586zM19 17H5v-.586l1.707-1.707A.996.996 0 0 0 7 14v-4c0-2.757 2.243-5 5-5s5 2.243 5 5v4c0 .266.105.52.293.707L19 16.414V17zm-7 5a2.98 2.98 0 0 0 2.818-2H9.182A2.98 2.98 0 0 0 12 22z"></path></svg>
                    </a>
                </div>
                <section id="elementosRegistrados" class="container-fluid position-relative py-1 px-1">
                    <section>
                        <div style="width: 163vh; height: 25em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto">
                            <div class="border-bottom pb-2 mb-0 row">
                                <h6 class="col mb-0">Elementos registrados</h6>

                                <div class="row">
                                    <form class="row g-3"  action="elemento" method="GET">
                                        <div class="col-auto">
                                          <label for="staticEmail2" class="visually-hidden">Email</label>
                                          <input name="placa" type="text" class="form-control" placeholder="Buscar por N° de placa">
                                        </div>
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-success" name="accion" value="buscar_elementos">Buscar</button>
                                        </div>
                                        
                                      </form>
                                      <form class="row g-3"  action="elemento" method="GET">
                                        <div class="col-auto">
                                          <select class="form-select" name="TipoElemento" id="TipoElemento" required="">
                                            <option disabled="" selected="" value="">Buscar</option>
                                            <option>Consumo</option>
                                            <option>Desechable</option>
                                        </select>                                   
                                     </div>
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-success" name="accion" value="buscar_tipo">Buscar</button>
                                        </div>
                                        
                                      </form>
                                        </div>

                                <a class="col text-end text" data-bs-toggle="modal" data-bs-target="#registroElementoModal">Nuevo elemento</a>
                            </div>
                            <div class="table-responsive small">
                                <table class="table table-striped table-sm">
                                    <thead>
                                    <tr>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Num. placa</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Costo</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Fecha de ingreso</th>
                                        <th scope="col">Categoria</th>
                                        <th scope="col">Aula</th>
                                        <th scope="col">Descripción</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Cuentadante</th>
                                        <th scope="col">opciones</th>
                                    </tr>
                                    </thead>
                                    <tbody>
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
                                    <tr>
                                        <td><%=elemento.getNombre()%></td>
                                        <td><%= elemento.getNumeroPlaca()%></td>
                                        <td><%=elemento.getCantidad()%></td>
                                        <td><%=elemento.getCosto()%></td>
                                        <td><%=elemento.getTipo()%></td>
                                        <td><%=elemento.getFechaIngreso()%></td>
                                        <td><%=elemento.getCategoria()%></td>
                                        <td><%=elemento.getNumeroAula()%></td>
                                        <td><%=elemento.getDescripcion()%></td>
                                        <td><%=elemento.getEstado()%></td>
                                        <td><%=usuario.getNombre()%></td>
                                        <td> <form action="elemento" method="post">
                                            <input type="number" name="id_cuentadante" value="<%=elemento.getUsu()%>" hidden>
                                            <input type="text" name="nombre_cuentadante" value="<%=usuario.getNombre()%>" hidden>
                                            <input type="number" name="n_placa_prestamo" value="<%= elemento.getNumeroPlaca()%>" hidden>
                                            <button type="submit" name="accion" value="data_prestamo"><center>Prestamo</center></button>
                                        </form>  </td>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                </section>
                <section id="usuariosRegistrados" class="container-fluid position-relative py-1 px-1">
                    <section>
                        <div style="width: 163vh; height: 25em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto">
                            <div class="border-bottom pb-2 mb-0 row">
                                <h6 class="col mb-0">usuarios registrados</h6>
                                <a class="col text-end text" data-bs-toggle="modal" data-bs-target="#registroUsuarioModal">Nuevo usuario</a>
                            </div>
                            <div class="table-responsive small">
                                <table class="table table-striped table-sm">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Nombre y apellido</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Identificación</th>
                                        <th scope="col">Rol</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Acciones</th>

                                    </tr>
                                    </thead>
                                    <tbody>                                    
                                    <%
                                        UsuarioDao UsuarioDao = new UsuarioDao();
                                        List<UsuarioVo> usu = UsuarioDao.listarUsuarios();
                                        for (UsuarioVo usuari : usu) {
                                    %>

                                    <tr>
                                        <td><%= usuari.getId() %></td>
                                        <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                                        <td><%= usuari.getEmail() %></td>
                                        <td><%= usuari.getNumIdentificacion() %></td>
                                        <td><%= usuari.getRol_fk() %></td>
                                        <td><%= usuari.getActivo() %></td>  
                                        <td>
                                        <form action="Usuario" method="post">
                                        <input type="number" name="id" value="<%=usuari.getId()%>" hidden>   
                                        <input type="text" name="nombre" value="<%=usuari.getNombre()%>" hidden>   
                                        <input type="text" name="apellido" value="<%=usuari.getApellido()%>" hidden>   
                                        <input type="email" name="email" value="<%=usuari.getEmail()%>" hidden>   
                                        <input type="number" name="identificacion" value="<%=usuari.getNumIdentificacion()%>" hidden>   
                                        <select name="rol" value="<%=usuari.getRol_fk()%>" hidden>
                                        <select name="activo" value="<%=usuari.getActivo()%>" hidden>   
                                        <button type="submit" name="action" value="editar_info">Editar</button>    
                                        </form>
                                    </td>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                </section>
                <section id="" class="container-fluid position-relative py-1 px-1">
                    <section>
                        <div style="width: 163vh; height: 25em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto">
                            <div class="border-bottom pb-2 mb-0 row">
                                <h6 class="col mb-0">Prestamos Registrados</h6>
                            </div>
                            <div class="table-responsive small">
                                <table class="table table-striped table-sm">
                                    <thead>
                                    <tr>
                                        <th>Cuentadante</th>
                                        <th>Elemento</th>
                                        <th>Fecha Inicio</th>
                                        <th>Fecha Fin</th>
                                        <th>Prestatario</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        PrestamosDao prestamoDao = new PrestamosDao();
                                            UsuarioDao usuariDao = new UsuarioDao(); // Importa la clase UsuarioDao
                                        List<PrestamosVo> prestamos = prestamoDao.listarPrestamos();
                                        for (PrestamosVo prestamo : prestamos) {
                                            // Obtener el Usuario correspondiente por su ID
                                            UsuarioVo usuario = usuarioDao.buscarUsuarioPorId(prestamo.getUsu());
                                            UsuarioVo usuari = usuarioDao.buscarUsuarioPorId(prestamo.getUs());// Reemplaza "buscarUsuarioPorId" con el método real de tu clase UsuarioDao
                                        %>

                                    <tr>
                                        <td><%=usuario.getNombre()%></td>
                                        <td><%=prestamo.getElementoFk()%></td>
                                        <td><%= prestamo.getFechaInicio() %></td>
                                        <td><%= prestamo.getFechaFin() %></td>
                                        <td><%= usuari.getNombre() %></td>
                                    </tr>
                                        <%
            }
        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                </section>
                <section id="categoriasRegistrados" class="container-fluid position-relative py-1 px-1">
                    <article class="row">
                        <section>
                            <div style="width:55%; height: 30em;" class="my-3 p-3  pe-3 bg-body rounded shadow-sm border overflow-auto float-start">
                                <h6 class="border-bottom pb-2 mb-0">Categorias registradas</h6>
                                <div class="table-responsive small">
                                    <table class="table table-striped table-sm">
                                        <thead>
                                        <tr>
                                            <th scope="col">Nombres</th>
                                            <th scope="col">Descripción</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            System.out.println("");
                                            CategoriaDao cd = new CategoriaDao();
                                            List<CategoriaVo> categorias=cd.obtenerCategorias();
                                            for (CategoriaVo categoria : categorias ) {
                                        %>
                                        <tr>
                                            <td><%= categoria.getNombreCategoria() %></td>
                                            <td><%= categoria.getDescripcionCategoria() %></td>
                                        </tr>
                                        <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div style="width: 40%; height: 22em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto float-end">
                                <h6 class="border-bottom pb-2 mb-0">Registro de categorias</h6>
                                <div class="d-flex text-muted pt-3">
                                    <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
                                        <form action="categoria" method="post" class="d-flex flex-column justify-content-between">
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Nombre</label>
                                                <input name="n_categoria" type="text" class="form-control" id="exampleFormControlInput1">                                                </div>
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Descripción de la categoria</label>
                                                <textarea name="d_categoria" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                            </div>
                                            <button type="submit" name="action" value="en_categoria" class="btn btn-primary">Registrar</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </article>
                </section>
            </div>
        </main>
    </div>
</section>
<div class="offcanvas offcanvas-end o" tabindex="-1" id="news" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h3 class="offcanvas-title" id="offcanvasExampleLabel">Notificaciones</h3>
        <button type="button" class="btn-close text-reset me-3" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body overflow-x-auto">
        <div class="mb-3 border rounded p-2">

            <div>

                <h4  class="mb-3 pb-1 border-bottom">Nueva solucitud</h4>
                <p><b>Propietario:</b> </p>
                <p><b>Prestatario:</b></p>
                <p><b>Fecha de solicitud:</b> </p>
                <p><b>Elemento solicitado:</b></p>
                <p><b>Placa del elemento solicitado:</b></p>
            </div>
            <div class="my-2">
                <button type="button" class="btn btn-success">Success</button>
                <button type="button" class="btn btn-danger">Danger</button>
            </div>
        </div>
        <div class="mb-3 border rounded p-2">
            <div>
                <h4  class="mb-3 pb-1 border-bottom">Se ha notificado un daño</h4>
                <p><b>Profesor:</b> Nombre del profesor.</p>
                <p><b>Fecha de solicitud:</b> 00/00/00.</p>
                <p><b>Elemento:</b> Nombre del elemento.</p>
                <p><b>Placa del elemento:</b> Placa del elemento.</p>
            </div>
            <div class="my-2">
                <button type="button" class="btn btn-success">Success</button>
                <button type="button" class="btn btn-danger">Danger</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="registroElementoModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container"></div>
            <form style="width: 30em" class="col-auto float-start bg-body shadow-sm p-3 rounded" action="elemento" method="post">
                <% if (request.getAttribute("error") != null) { %>
                <div style="color: red; margin-bottom: 10px;">
                    <%= request.getAttribute("error") %>
                </div>
                <% } %>
                <div>
                    <h4>Registro de elementos</h4>
                </div>
                <div class="container py-3">
                    <div class="input-group mb-3">
                        <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                style="fill: rgba(0, 0, 0, 1);">
                            <path
                                    d="M15 4h7v2h-7zm1 4h6v2h-6zm2 4h4v2h-4zM9.307 4l-6 16h2.137l1.875-5h6.363l1.875 5h2.137l-6-16H9.307zm-1.239 9L10.5 6.515 12.932 13H8.068z">
                            </path>
                        </svg></label>
                        <input type="text" placeholder="Nombres" aria-label="First name" class="form-control" name="NombreElemento" id="NombreElemento" required/>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                style="fill: rgba(0, 0, 0, 1);">
                            <circle cx="12" cy="6" r="2"></circle>
                            <circle cx="6" cy="6" r="2"></circle>
                            <circle cx="18" cy="6" r="2"></circle>
                            <circle cx="12" cy="12" r="2"></circle>
                            <circle cx="6" cy="12" r="2"></circle>
                            <circle cx="18" cy="12" r="2"></circle>
                            <circle cx="12" cy="18" r="2"></circle>
                        </svg></label>
                        <input type="text" placeholder="Numero de placa" aria-label="First name" class="form-control" name="N_placa" id="N_placa" required/>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                style="fill: rgba(0, 0, 0, 1);">
                            <path
                                    d="M19.649 5.286 14 8.548V2.025h-4v6.523L4.351 5.286l-2 3.465 5.648 3.261-5.648 3.261 2 3.465L10 15.477V22h4v-6.523l5.649 3.261 2-3.465-5.648-3.261 5.648-3.261z">
                            </path>
                        </svg></label>
                        <input type="text" placeholder="Cantidad" class="form-control" name="cantidad" id="cantidad" required/>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                style="fill: rgba(0, 0, 0, 1);">
                            <path
                                    d="M15.999 8.5h2c0-2.837-2.755-4.131-5-4.429V2h-2v2.071c-2.245.298-5 1.592-5 4.429 0 2.706 2.666 4.113 5 4.43v4.97c-1.448-.251-3-1.024-3-2.4h-2c0 2.589 2.425 4.119 5 4.436V22h2v-2.07c2.245-.298 5-1.593 5-4.43s-2.755-4.131-5-4.429V6.1c1.33.239 3 .941 3 2.4zm-8 0c0-1.459 1.67-2.161 3-2.4v4.799c-1.371-.253-3-1.002-3-2.399zm8 7c0 1.459-1.67 2.161-3 2.4v-4.8c1.33.239 3 .941 3 2.4z">
                            </path>
                        </svg></label>
                        <input type="text" placeholder="Costo" aria-label="First name" class="form-control" name="Costo" id="Costo" required/>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="inputGroupSelect01">Tipo</label>
                        <select class="form-select" name="TipoElemento" id="TipoElemento" required>
                            <option selected disabled>Elige...</option>
                            <option>Consumo</option>
                            <option>Desechable</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                style="fill: rgba(0, 0, 0, 1);">
                            <path
                                    d="M7 11h2v2H7zm0 4h2v2H7zm4-4h2v2h-2zm0 4h2v2h-2zm4-4h2v2h-2zm0 4h2v2h-2z">
                            </path>
                            <path
                                    d="M5 22h14c1.103 0 2-.897 2-2V6c0-1.103-.897-2-2-2h-2V2h-2v2H9V2H7v2H5c-1.103 0-2 .897-2 2v14c0 1.103.897 2 2 2zM19 8l.001 12H5V8h14z">
                            </path>
                        </svg></label>
                        <input type="date" placeholder="Fecha de ingreso" class="form-control" name="FechaIngresoElemento" id="FechaIngresoElemento" required/>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="inputGroupSelect01">Categoria</label>
                        <select class="form-select" name="categoriaElemento" id="categoriaElemento" required>
                            <option selected>Elige una categoria...</option>
                            <%
                                System.out.println("");
                                CategoriaDao ad = new CategoriaDao();
                                List<CategoriaVo> categoriass=cd.obtenerCategorias();
                                for (CategoriaVo categoria : categoriass ) { 
                            %>
                            <option value="<%= categoria.getNombreCategoria() %>"><%= categoria.getNombreCategoria() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                style="fill: rgba(0, 0, 0, 1);">
                            <path
                                    d="M19 2H9c-1.103 0-2 .897-2 2v6H5c-1.103 0-2 .897-2 2v9a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V4c0-1.103-.897-2-2-2zM5 12h6v8H5v-8zm14 8h-6v-8c0-1.103-.897-2-2-2H9V4h10v16z">
                            </path>
                            <path
                                    d="M11 6h2v2h-2zm4 0h2v2h-2zm0 4.031h2V12h-2zM15 14h2v2h-2zm-8 .001h2v2H7z">
                            </path>
                        </svg></label>
                        <input type="text" placeholder="Aula" aria-label="First name" class="form-control" name="NumAula" id="NumAula" required/>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Escriba una descripción del elemento</label>
                        <textarea class="form-control" placeholder="Descripción" name="Descripcion" id="Descripcion" required rows="3"></textarea>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="inputGroupSelect01">Estado del elemento</label>
                        <select class="form-select"name="EstadoElemento" id="EstadoElemento" required>
                            <option selected>Elige...</option>
                            <option value="Activo">Activo</option>
                            <option value="inactivo">Inactivo</option>
                        </select>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="inputGroupSelect01">Cuentadante</label>
                    <select class="form-select" name="usuario_fk" id="usuario_fk" required>
                        <option selected>Elige un cuentadante...</option>
                            <%
                            UsuarioDao Usu = new UsuarioDao();
                            List<UsuarioVo> usuarioss = Usu.listarUsuarios();
                            for (UsuarioVo usua : usuarioss) { %>
                        <option value="<%= usua.getId() %>"><%= usua.getNombre() %></option>
                            <% } %>
                    </select>
                </div>

                <div class="container">
                    <button type="submit" name="accion" value="add" class="btn btn-primary">Registrar</button>
                </div>

            </form>
            <div class="col-auto float-end"></div>
        </div>
    </div>
</div>
</div>
<div class="modal fade" id="registroUsuarioModal" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container">
                <form style="width: 30em" class="col-auto float-start bg-body shadow-sm p-3 rounded" action="Usuario" method="POST">
                    <div>
                        <h4>Registro de usuarios</h4>
                    </div>
                    <div class="container py-3">
                        <div class="input-group mb-3">
                            <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    style="fill: rgba(0, 0, 0, 1);">
                                <path
                                        d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z">
                                </path>
                            </svg></label>
                            <input type="text" placeholder="Nombres completos" aria-label="First name" class="form-control" pattern="[A-Za-z ]{3,40}" id="nombre" name="nombre" required/>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    style="fill: rgba(0, 0, 0, 1);">
                                <path
                                        d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z">
                                </path>
                            </svg></label>
                            <input type="text" placeholder="Apellidos completos" aria-label="First name" class="form-control" pattern="[A-Za-z ]{3,40}" id="apellido" name="apellido" required/>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    style="fill: rgba(0, 0, 0, 1);">
                                <path
                                        d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z">
                                </path>
                            </svg></label>
                            <input type="email" placeholder="Email" aria-label="First name" class="form-control" id="email" name="email" required/>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    style="fill: rgba(0, 0, 0, 1);">
                                <path
                                        d="M19 2H9c-1.103 0-2 .897-2 2v6H5c-1.103 0-2 .897-2 2v9a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V4c0-1.103-.897-2-2-2zM5 12h6v8H5v-8zm14 8h-6v-8c0-1.103-.897-2-2-2H9V4h10v16z">
                                </path>
                                <path
                                        d="M11 6h2v2h-2zm4 0h2v2h-2zm0 4.031h2V12h-2zM15 14h2v2h-2zm-8 .001h2v2H7z">
                                </path>
                            </svg></label>
                            <input type="text" placeholder="Num identificacion" aria-label="First name" class="form-control" pattern="[1-9]\d{0,9}" id="numIdentificacion" name="numIdentificacion" required/>
                        </div>
                        <div class="input-group flex-nowrap">
                                <span class="input-group-text opacity-75" id="addon-wrapping"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1)">
                                        <path
                                                d="M12 2C9.243 2 7 4.243 7 7v3H6c-1.103 0-2 .897-2 2v8c0 1.103.897 2 2 2h12c1.103 0 2-.897 2-2v-8c0-1.103-.897-2-2-2h-1V7c0-2.757-2.243-5-5-5zm6 10 .002 8H6v-8h12zm-9-2V7c0-1.654 1.346-3 3-3s3 1.346 3 3v3H9z">
                                        </path>
                                    </svg></span>
                            <input type="text" class="form-control" placeholder="Contraseña" aria-label aria-describedby="addon-wrapping" id="contrasena" name="contrasena" required />
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="inputGroupSelect01">Categoria</label>
                            <select class="form-select" id="inputGroupSelect01" name="rol_fk" id="rol_fk" required>
                                <option selected>Elige categoria del usuario</option>
                                <option value="3">Instructor</option>
                                <option value="2">Cuentadante</option>
                                <option value="1">Administrador</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <%--@declare id="inputgroupselect01"--%><label class="input-group-text" for="inputGroupSelect01">Estado del Usuario</label>
                            <select class="form-select" name="activo" id="activo" required>
                                <option selected>Elige...</option>
                                <option value="Activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
                            </select>
                        </div>
                    </div>
                    </div>
                    <div class="container">
                        <button type="button buttom__default" class="btn btn-primary" name="action" value="register">Registrar</button>
                    </div>
                </form>
                <div class="col-auto float-end"></div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>
