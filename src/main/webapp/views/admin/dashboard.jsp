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
    <link rel="shortcut icon" href="assets/IMG/logo1.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>

<body class="bg-body-tertiary">
<%
        // Recupera el usuario de la sesión
        model.UsuarioVo usuarioSesion = (model.UsuarioVo) session.getAttribute("usuarioSesion");

        if (usuarioSesion != null) {
    %>
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

                                <div class="input-group mb-3">
                                    <form class="row g-2"  action="elemento" method="GET">
                                        <div class="col-auto">
                                          <label for="staticEmail2" class="visually-hidden">Email</label>
                                          <input name="placa" type="text" class="form-control" placeholder="Buscar por N° de placa">
                                        </div>
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-success" name="accion" value="buscar_elementos">Buscar</button>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      </form>
                                      <form class="row g-2"  action="elemento" method="GET">
                                        <div class="col-auto">
                                          <select class="form-select" name="TipoElemento" id="TipoElemento" required="">
                                            <option disabled="" selected="" name="accion" value="buscar_tipo">Buscar</option>
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
                                            
                                                <button class="btn btn-light" type="submit" name="accion" value="data_prestamo"><center>Prestamo</center></button>
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
                <section id="usuariosRegistrados" class="container-fluid position-relative py-1 px-1">
                    <section>
                        <div style="width: 163vh; height: 25em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto">
                            <div class="border-bottom pb-2 mb-0 row">
                                <h6 class="col mb-0">Usuarios registrados</h6>
                                <a class="col text-end text" data-bs-toggle="modal" data-bs-target="#registroUsuarioModal">Nuevo usuario</a>
                            </div>
                            <div class="input-group mb-3">
                                <form class="row g-2" action="Usuario" method="GET">
                                    <div class="col-auto">
                                        <input type="text" name="nombre" placeholder="Buscar por nombre" class="form-control rounded"/>
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-success" name="action" value="search">Buscar</button>
                                    </div>
                                </form>
                                <form class="row g-2" action="Usuario" method="GET">
                                    <div class="col-auto">
                                        <input type="text" name="numidusuario" placeholder="Buscar por Num Identificaion" class="form-control rounded"/>
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" name="action" value="searchById" class="btn btn-success">Buscar</button>
                                    </div>
                                </form>
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
                                    String nombre=request.getParameter("nombre");
                                    String numidentificacion= request.getParameter("numidentificacionusuario") ;
                                    System.out.print(numidentificacion);
                                    System.out.print(numidentificacion+"el nombre que llega por busqueda de nombre ");
                                    System.out.print(nombre+"el nombre que llega por busqueda de nombre ");
                                    if(nombre != null  && ! nombre.isEmpty()){
                                    
                                        System.out.println("el nombre llego") ;
                                        UsuarioDao UsuarioDao = new UsuarioDao();
                                        List<UsuarioVo> usu =  usuarioDao.buscarUsuariosPorNombre(nombre);
                                        for (UsuarioVo usuari : usu)
                                      {
                                     %>
                                     <tr>
                                        <td><%= usuari.getId() %></td>
                                        <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                                        <td><%= usuari.getEmail() %></td>
                                        <td><%= usuari.getNumIdentificacion() %></td>
                                        <td><%= usuari.getRol_fk() %></td>
                                        <td><%= usuari.getActivo() %></td>
                                    </tr>
                                    <%
                                     }
                                    }
                                     if (numidentificacion != null  && ! numidentificacion.isEmpty() ){
                                        System.out.println("el id llego") ;
                                        UsuarioDao UsuarioDao = new UsuarioDao();
                                        int id = Integer.parseInt(numidentificacion);
                                        List<UsuarioVo> usu =  usuarioDao.buscarUsuariosPornumIdentificacion(id);
                                        for (UsuarioVo usuari : usu){

                                         %>

                                        <tr>
                                            <td><%= usuari.getId() %></td>
                                            <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                                            <td><%= usuari.getEmail() %></td>
                                            <td><%= usuari.getNumIdentificacion() %></td>
                                            <td><%= usuari.getRol_fk() %></td>
                                            <td><%= usuari.getActivo() %></td>
                                        </tr>
                                    
                      <%             }
                                     }
                                 
                                     else{
                                    %>
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
                                    <% } }%>
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
                <%
                PrestamosDao pDao = new PrestamosDao();
                    UsuarioDao urDao = new UsuarioDao(); // Importa la clase UsuarioDao
                List<PrestamosVo> prest = prestamoDao.listarPrestamos();
                for (PrestamosVo pres : prest) {
                    // Obtener el Usuario correspondiente por su ID
                    UsuarioVo ur = urDao.buscarUsuarioPorId(pres.getUsu());
                    UsuarioVo nazi = urDao.buscarUsuarioPorId(pres.getUs());// Reemplaza "buscarUsuarioPorId" con el método real de tu clase UsuarioDao
                %>
                <h4  class="mb-3 pb-1 border-bottom">Nueva solucitud</h4>
                <p><b>Propietario:</b><%=ur.getNombre()%></p>
                <p><b>Prestatario:</b><%= nazi.getNombre() %></p>
                <p><b>Fecha de solicitud:</b> <%= pres.getFechaInicio() %></p>
                <p><b>Elemento solicitado:</b><%= pres.getFechaFin() %></p>
                <p><b>Placa del elemento solicitado:</b><%=pres.getElementoFk()%></p>
                
            </div>
            <div class="my-2">
                <button type="button" class="btn btn-danger">Cancelar solicitud</button>
            </div>
            <% } %>
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
                            <select class="form-select"  name="rol_fk" id="rol_fk" required>
                                <option selected>Elige categoria del usuario</option>
                                <option>Instructor</option>
                                <option>Cuentadante</option>
                                <option>Administrador</option>
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
        <%
            } else {
        %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>SENA - SICEM</title>
                <!-- BOOTSTRAP -->
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
                <link rel="stylesheet" href="/css/custom.css">
                <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
            </head>

            <body style="color: #1f1f1f;" class="bg-body-tertiary">
                <div class=".container-fluid text-center">
                    <div class="container my-3 border-bottom py-3">
                        <h1><span class="text-success">Ups</span>, parece que ha habido un error.</h1>
                    </div>
                    <div class="container my-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="450" height="350" viewBox="0 0 524.67001 418.27099" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M442.17403,400.47713c2.06599,.12871,3.20692-2.43846,1.64338-3.93389l-.1557-.61814c.0204-.04935,.04089-.09868,.06153-.14794,1.23211-2.94003,4.62545-4.33201,7.57137-3.11404,9.3142,3.85087-.51966,12.69986,.21957,18.68773,.25911,2.06671,8.35473,2.18034,7.89681,4.2086,4.30482-9.41207,6.56835-19.68889,6.56478-30.02306-.0009-2.59653-.14392-5.19297-.43543-7.78281-.23975-2.11845-.56985-4.22389-.9969-6.30999-2.30966-11.27639-7.30614-22.01572-14.51084-30.98461-3.46263-1.89129-1.35074-4.85018-3.09586-8.39544-.62694-1.27868-6.21792-1.30745-6.45092-2.70892,.25019,.03272,3.86434-3.721,2.6705-5.5767-.78555-1.22107-.54106-2.7763,.4681-3.82017,.09887-.1023,.19234-.2103,.27796-.32648,2.98093-4.04443,7.09003-3.33985,9.23695,2.15406,4.58304,2.31107,4.62871,6.14647,1.81834,9.83619-1.78798,2.34745-2.03264,5.52304-3.60129,8.03604,.16157,.20664,.32958,.40684,.49112,.61348,2.96237,3.79686,5.52482,7.87809,7.68524,12.16592-.61182-4.76599,.28705-10.50831,1.8215-14.21023,1.75933-4.24835,5.06953-7.8221,7.96883-11.49665,3.46275-4.38865,10.5104-2.39707,11.12286,3.15951,.00588,.05337,.0116,.10665,.01724,.16003-.42884,.24212-.84895,.49935-1.25929,.77094-2.33882,1.54808-1.52824,5.17442,1.24391,5.60071l.06278,.00965c-.1545,1.54372-5.63258,6.40679-6.01957,7.91187,3.70514,14.30838,.93282,16.19755-10.46624,16.43703l-.59825,.8522c1.08024,3.1058,1.94956,6.2861,2.60235,9.50743,.61462,2.99021,1.042,6.01282,1.28197,9.04845,.29847,3.82994,.27396,7.6795-.04769,11.50325l.01933-.13563c.81879-4.21143,3.1039-8.1457,6.42284-10.87249,4.94421-4.06436,11.93091-5.56281,17.2652-8.83022,2.56778-1.57285,5.85959,.45742,5.41241,3.4352l-.02177,.14262c-.79432,.32315-1.56922,.69808-2.31831,1.11814-.42921,.24237-.84965,.49978-1.26032,.77165-2.33916,1.54848-1.52796,5.1753,1.24498,5.60009l.06281,.00962c.0452,.00645,.08399,.01291,.12913,.0194-1.3617,3.23628-14.33553,7.80147-16.71149,10.39229-2.31031,12.49793-1.17531,12.12596-11.81075,8.49032h-.00647c-1.16085,5.06419-2.8578,10.01225-5.03931,14.72794l-18.0202,.00623c-.06471-.2002-.12288-.40688-.18109-.60712,1.66645,.10285,3.34571,.00534,4.98619-.29875-1.33757-1.64013-2.67509-3.29317-4.01266-4.93324-.0323-.03228-.05819-.06459-.08402-.09686l-.02036-.02517-1.85532-6.10724c.14644-1.35476,.38536-2.69828,.70958-4.02051l.00049-.00037v.00006Z" fill="#f2f2f2"/><path d="M251.74443,416.41995l-159.45702,.05516c-8.01074,.00277-15.18649-4.13684-19.19426-11.07295-2.00413-3.46855-3.00642-7.27337-3.00774-11.07904-.00132-3.80518,.99882-7.61119,3.00007-11.08063l79.67786-145.04905c4.00346-6.93937,11.17634-11.08346,19.18708-11.08623s15.18649,4.13635,19.19475,11.07295l79.78843,145.01196c1.99876,3.45927,2.99861,7.25971,2.99894,11.06293-.00015,3.80322-.99981,7.60874-3.00154,11.07868-4.00297,6.93889-11.17585,11.08346-19.1866,11.08623h.00002Zm-179.65463-22.09948c-.00026,3.46387,17.5953-4.00023,19.41817-.8451,3.64623,6.31026-6.50934,21.00225,.77874,20.99973,0,0,173.27016-3.828,176.91202-10.14078,1.82069-3.15639,2.73062-6.61911,2.72942-10.08102s-.91353-6.92351-2.73688-10.07864l-79.78845-145.01196c-3.63597-6.2922-10.16364-10.05801-17.45172-10.05549-7.28467,.00252-99.86105,161.74891-99.86132,165.21326h.00002Z" fill="#3f3d56"/><path d="M253.51521,414.41934c-1.99862,4.00069,91.61376,2.7712,92.72051,2.77082,0,0,26.3119-.58131,26.86492-1.53993,.27648-.47931,.41466-1.00515,.41448-1.53084s-.13873-1.05137-.4156-1.5305l-12.11626-22.02074c-.55215-.9555-1.54341-1.52736-2.65013-1.52698-.04608,.00002-.11394,.04093-.20168,.11933-16.16328,14.44385-36.0828,23.99237-57.75707,24.31469-23.047,.34272-46.73217,.6899-46.85919,.94416h.00002Z" fill="#3f3d56"/><path d="M0,417.0814c.00023,.66003,.53044,1.18982,1.19047,1.18959l522.28995-.18066c.65997-.00023,1.18982-.53038,1.18959-1.19041-.00023-.65997-.53044-1.18982-1.19041-1.18959l-522.28995,.18066c-.66003,.00023-1.18988,.53044-1.18965,1.19041Z" fill="#ccc"/><g><polygon points="403.87773 411.30541 394.83299 411.30765 390.51828 376.42194 403.86746 376.41823 403.87773 411.30541" fill="#a0616a"/><path d="M372.88925,411.11096h0c-.28145,.4744-.42951,2.00528-.42932,2.55685h0c.00059,1.6954,1.37542,3.06935,3.07089,3.06876l28.01047-.00969c1.15659-.0004,2.09391-.93832,2.09351-2.09496l-.0004-1.16617s1.38444-3.50542-1.46987-7.82444c0,0-3.54448,3.38386-8.84444-1.91244l-1.56336-2.82981-11.30656,8.27506-6.26838,.77377c-1.3714,.16927-2.58738-.02532-3.29241,1.16307h-.00012Z" fill="#2f2e41"/></g><g><polygon points="369.19708 381.46752 360.62951 384.36642 345.36911 352.70019 358.01396 348.42131 369.19708 381.46752" fill="#a0616a"/><path d="M339.77867,391.20807h0c-.11468,.53956,.23535,2.03724,.41217,2.5597h0c.54355,1.60589,2.28601,2.46714,3.89196,1.92358l26.53193-8.98019c1.09554-.3708,1.68312-1.55951,1.31228-2.65512l-.37389-1.10461s.18882-3.76416-3.8984-6.94155c0,0-2.27401,4.34084-8.99107,1.02096l-2.38732-2.18005-8.0607,11.46034-5.69037,2.74062c-1.24494,.59958-2.45919,.80471-2.74651,2.15628l-.00009,.00003Z" fill="#2f2e41"/></g><polygon points="355.22599 179.09003 337.68255 237.19081 316.97199 289.45207 349.76053 364.08569 361.91802 358.67731 347.37062 290.11706 377.87822 243.59436 392.11437 388.82623 404.27349 388.14652 420.76309 212.84336 423.11421 174.67566 355.22599 179.09003" fill="#2f2e41"/><path d="M408.20979,50.38513l-25.66813,4.73752-2.02258,11.48454-15.53439,7.43609-8.07702,84.4428s-13.50433,17.56819-2.69414,22.96862l68.9007-6.77904s3.37327-12.4903-.00473-13.67529-3.38832-31.01955-3.38832-31.01955l15.51573-61.36599-22.97048-8.09829-4.05664-10.13141Z" fill="#e6e6e6"/><circle cx="393.06995" cy="29.43589" r="20.7276" fill="#a0616a"/><path d="M406.79605,32.51227c-1.65401,.9055-.08471,5.22869-1.11848,5.60245-1.19492,.43202-5.55162-4.52715-5.60554-10.08176-.01633-1.68115,.37051-2.48839-.00155-4.48164-.48668-2.6073-1.98045-5.68253-3.36317-5.60089-.81965,.04839-1.62013,1.20723-1.67986,2.2414-.0837,1.44941,1.32419,2.01989,1.12139,2.80064-.38627,1.4871-6.29829,2.5138-8.40308,.00291-1.65013-1.9685-.38463-5.4247-1.12236-5.60167-.54378-.13045-1.12759,1.77241-3.35988,3.9226-.84103,.8101-2.09186,2.0149-2.80044,1.68159-1.02397-.48167-.28003-3.87624-.56157-3.92125-.23314-.03727-.37947,2.3487-1.67908,4.48223-1.66968,2.74103-5.11398,4.85374-6.72112,3.92377-.98466-.56978-1.06245-2.15606-1.12158-3.36084-.1245-2.53816-3.81308-8.37644-2.85882-11.09166,1.94221-5.5263,5.2701-1.63078,6.7752-3.47504,2.03756-2.49669,3.86572-1.15434,7.28133-3.92396,3.33668-2.70564,3.36577-5.42504,5.60011-5.604,2.01221-.16116,2.7278,1.98528,5.04242,1.67887,1.96079-.25957,2.38749-1.92436,3.92087-1.68198,1.40389,.2219,1.49646,1.68849,3.36201,2.23966,1.19101,.35188,1.45267-.15743,2.80103-.00097,2.80559,.32556,4.69002,2.88083,5.043,3.35949,1.36081,1.84526,.83282,2.62341,2.24236,4.48086,1.21555,1.6018,3.90913,.9216,4.92189,1.72162,3.30928,2.61409,4.73124,7.43497,4.75994,12.92962,.0201,3.8431-.48103,5.78482-1.59913,10.63564-.84901,3.6834-4.78175,8.44334-6.94987,10.5659-.58199,.56975-2.21351,2.167-3.36066,1.68178-1.08704-.45979-1.11995-2.52764-1.12139-2.80064-.0049-.93901,.24521-2.1009,2.23907-5.04263,2.09442-3.09006,2.92645-3.44271,2.79948-4.48262-.22445-1.83818-3.16424-3.52123-4.48263-2.79948h.00012Z" fill="#2f2e41"/><g><path d="M334.49457,225.75979c-.64513,5.40264,1.61895,10.11513,5.05699,10.52567s6.7481-3.63632,7.39324-9.03898c.28242-2.36492,.00723-4.59754-.6797-6.39504l2.44642-22.92684-10.7834-.91891-1.26717,22.69891c-1.09088,1.58522-1.88401,3.69026-2.16639,6.05519h.00003Z" fill="#a0616a"/><path d="M365.49095,73.49769s-5.58664,.07946-9.28568,7.30383c-1.96565,3.83897-12.48211,75.62767-12.48211,75.62767l-9.68742,58.80847,16.50214,.08313,12.859-55.69302,10.81723-32.30088-8.72315-53.82921Z" fill="#e6e6e6"/></g><path d="M411.92961,217.13028c-1.58023,5.20651-.17535,10.24237,3.13786,11.24797s7.28015-2.39987,8.86035-7.60638c.69172-2.27906,.81133-4.5254,.44941-6.41533l6.4191-22.14543-10.45641-2.79098-5.21815,22.12729c-1.35133,1.36996-2.50044,3.30383-3.19216,5.58289v-.00003Z" fill="#a0616a"/><path d="M423.41564,69.63219s8.10413-6.08248,14.86262,3.37246c6.75846,9.45495,9.48742,87.1388,9.48742,87.1388l-18.89796,47.96845-14.18755-4.72373,13.49008-58.7749-23.65861-44.57614,18.90403-30.40494h-.00003Z" fill="#e6e6e6"/><g><circle cx="218.47958" cy="311.43145" r="73" fill="#198754"/><g><circle cx="218.49274" cy="349.47878" r="6.70264" fill="#fff"/><path d="M218.4641,266.68145c-.6157,4.0912,.48747,4.94727,.49357,22.58508,.0061,17.63782,3.66579,41.28574-.47148,41.28717s-5.65047-48.80276-20.01681-53.12218c-16.89088-5.07846,21.98785-23.99409,19.99471-10.75007Z" fill="#fff"/></g></g><path d="M120.50313,348.70219l-6.59532,13.93527c7.97328-5.71745,20.42715-10.64598,30.3376-13.28567-9.23403-4.46037-20.53313-11.65189-27.2835-18.77194l3.7934,14.72434c-44.47393-9.0585-76.41138-43.17661-76.4249-82.25924l-1.60648-.5527c.01412,40.82281,31.50971,76.96121,77.7792,86.20995Z" fill="#3f3d56"/></svg>
                        <%-- <img src="../../assets/IMG/undraw_warning_re_eoyh.svg" alt="Imagen de error" width="450"> --%>
                    </div>   
                    <div class="container my-3">
                        <p class="form-control-lg">Debes volver a iniciar sesión para continuar. Si el error persiste, comunicate con los administradores por medio de este correo: <span class="font-monospace text-danger">administracion@sice.sena.co</span>.</p>
                    </div>
                    <div class="container">
                        <a class="btn btn-success" href="Usuario?action=login">Iniciar sesión</a>
                    </div>
                </div>
            </body>
            </html>
        <%
            }
        %>
</body>

</html>

