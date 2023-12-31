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

<%-- IMPORTS DE CATEGORIAS --%>
<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>

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
        <link rel="icon" href="assets/IMG/favicon.ico">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <!-- JAVASCRIPT IMPORTANTE -->
        <script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>\views\admin\js\dashboard.js"></script>
    </head>
<%
                // Recupera el usuario de la sesión
                model.UsuarioVo usuarioSesion = (model.UsuarioVo) session.getAttribute("usuarioSesion");

                if (usuarioSesion != null) {
            %>
    <body class="bg-body-tertiary">
        
        <%
            System.out.println("Estas en la vista Dashboard(rediseñado)");
        %>

        <!-- HEADER -->
        <nav class="navbar navbar-light bg-body border-bottom position-sticky ">
            <!-- ORGANIZADOR DEL CONTENIDO -->
            <div class="container-fluid justify-content-between">
                <!-- LOGO -->
                <a class="navbar-brand col-9" href="#"><!-- C:\AJCV_DEV_STUDIO\SICEM\SICEM\src\main\webapp\views\admin\dashboard(rediseñado).jsp -->
                    <img
                        src="assets\IMG\logo_mono.png"
                        alt="Logo_Sena_Sicem"
                        width="150"
                        height="50"
                        class="d-inline-block align-text-top me-1" />
                </a>
                <div class="d-flex flex-row col-2">
                    <form action="Usuario" method="get">
                        <input type="hidden" name="action" value="lll">
                        <button type="submit" class="btn btn-success-underline me-3">perfil</button>
                    </form> 
                    <form action="Usuario" method="POST">
                        <button name="action" value="logout" class="btn btn-danger">Salir</button>
                    </form>
                </div>
                <!-- CONTENEDOR DE BOTONES -->
                
                <ul class="navbar-nav col-4">
                    
                </ul> 
            </div>
        </nav>

        <!-- BIENVENIDA Y CONTENEDORES -->
        <section class="container-fluid py-3">
            <div class="container-sm h-100 py-3">
                <h3><span class=" text-success">!Bienvenido,</span> Andres Julian Cordoba Ventura!</h3>
                <p>Hasta ahora así llevamos nuestros <span class="text-success">contadores</span>.</p>
            </div>
            
            <!-- CONTADORES -->
            <div class="container border-bottom pb-5">
                <div class="container px-5">
                    <div class="row">
                        
                        <!-- USUARIOS -->
                        <div class="col">
                            <div class="rounded-3 shadow-sm border">
                                <div class="border-3 border-start border-success p-3 rounded-3">
                                    <p class="h6">Usuarios</p>
                                    <%
                                        System.out.println("");
                                        UsuarioDao usuarioDao = new UsuarioDao();
                    
                                        List<UsuarioVo> usuarios;
                                        String cantidadUsuarios = request.getParameter("cantidad");
                                        usuarios = usuarioDao.contadorUsuarios();
                    
                                        for (UsuarioVo usuario : usuarios) {
                                    %>
                                    <p class="h2 text-success mt-1"><%=usuario.getId()%></p>
                                    <% } %>    
                                    <button onclick="mostrarComponente('views/admin/components/tables/tabla-registrosUsuarios.jsp')" class="btn px-1 link-success"><i class="bi bi-arrow-down-square-fill"></i> Ver mas</button>
                                </div>
                            </div>
                            
                        </div>
                        <!-- ELEMENTOS -->
                        <div class="col">
                            <div class="rounded-3 shadow-sm border">
                                <div class="border-3 border-start border-success p-3 rounded-3">
                                    <p class="h6">Elementos</p>
                                    <%
                                        System.out.println("");
                                        ElementosDao elementosDao = new ElementosDao();
                    
                                        List<ElementosVo> elementos;
                                        String cantidadElementos = request.getParameter("cantidad");
                                        elementos = elementosDao.contadorElementos();
                    
                                        for (ElementosVo elemento : elementos) {
                                    %>
                                    <p class="h2 text-success mt-1">
                                        <%=elemento.getCantidad()%>
                                    </p>   
                                    <% } %>
                                    <button onclick="mostrarComponente('views/admin/components/tables/tabla-registrosElementos.jsp')" class="btn px-1 link-success"><i class="bi bi-arrow-down-square-fill"></i> Ver mas</button>
                                </div>
                            </div>
                            
                        </div>
                        
                        <!-- PRESTAMO -->
                        <div class="col">
                            <div class="rounded-3 shadow-sm border">
                                <div class="border-3 border-start border-success p-3 rounded-3">
                                    <p class="h6">Prestamos</p>
                                    <%
                                        System.out.println("");
                                        PrestamosDao prestamosDao = new PrestamosDao();
                    
                                        List<PrestamosVo> prestamos;
                                        String cantidadPrestamos = request.getParameter("cantidad");
                                        prestamos = prestamosDao.contadorPrestamos();
                    
                                        for (PrestamosVo prestamo : prestamos) {
                                    %>
                                        <p class="h2 text-success mt-1">
                                            <%=prestamo.getUs()%>
                                        </p>    
                                    <% } %>
                                    <button onclick="mostrarComponente('views/admin/components/tables/tabla-registrosPrestamos.jsp')" class="btn px-1 link-success"><i class="bi bi-arrow-down-square-fill"></i> Ver mas</button>
                                </div>
                            </div>
                        </div>
                        <!-- CATEGORIAS -->
                        <div class="col">
                            <div class="rounded-3 shadow-sm border">
                                <div class="border-3 border-start border-success p-3 rounded-3">
                                    <p class="h6">Categorias</p>
                                    <%
                                        System.out.println("");
                                        CategoriaDao categoriaDao = new CategoriaDao();

                                        List<CategoriaVo> categorias;
                                        String cantidadcategorias = request.getParameter("cantidad");
                                        categorias = categoriaDao.contadorCategorias();

                                        for (CategoriaVo categoria : categorias) {
                                    %>
                                    <p class="h2 text-success mt-1"><%=categoria.getIdCategoria()%></p>
                                    <% } %>
                                    <button onclick="mostrarComponente('views/admin/components/tables/tabla-registrosCategorias.jsp')" class="btn px-1 link-success"><i class="bi bi-arrow-down-square-fill"></i> Ver mas</button>
                                </div>
                            </div>

                        </div>
                        <div class="row mt-5 text-center opacity-50">
                            <p><i class="bi bi-info-circle-fill"></i> Selecciona uno de los contadores para ver los <span class="text-success">registros</span>.</p>
                        </div>

                    </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- TABLAS -->
        <div id="contenedor-tablas" class="container-fluid">
            <!-- AQUI SE MUESTRAN LOS COMPONENTES QUE VOY A ASIGNAR EN DASHBOARD.JS -->
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
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
                <link rel="shortcut icon" href="assets/IMG/favicon.ico" type="image/x-icon">
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
