<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<%-- HEAD --%>
<jsp:include page="../components/head.jsp"/>

<body class="bg-body-tertiary">
    <section class="container-fluid ">
        <div class="row">
            <aside id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse shadow bg-body" style="height: 100vh; position: fixed;">
                <div class="position-sticky pt-3">
                    <div class="row border-bottom px-3 pb-3">
                        <img src="/img/logo_mono.png" alt="">
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
                            <a class="nav-link active" href="../home.html">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="M19.002 3h-14c-1.103 0-2 .897-2 2v4h2V5h14v14h-14v-4h-2v4c0 1.103.897 2 2 2h14c1.103 0 2-.897 2-2V5c0-1.103-.898-2-2-2z"></path><path d="m11 16 5-4-5-4v3.001H3v2h8z"></path></svg>
                                Salir
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>

            <%-- SECCION DEL CONTENIDO GENERAL --%>
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="chartjs-size-monitor">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-2 border-bottom">
                        <h1 class="h2">Administrador</h1>
                        <a data-bs-toggle="offcanvas" href="#news" role="button" aria-controls="offcanvasExample">
                            <svg class="me-3" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="M19 13.586V10c0-3.217-2.185-5.927-5.145-6.742C13.562 2.52 12.846 2 12 2s-1.562.52-1.855 1.258C7.185 4.074 5 6.783 5 10v3.586l-1.707 1.707A.996.996 0 0 0 3 16v2a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1v-2a.996.996 0 0 0-.293-.707L19 13.586zM19 17H5v-.586l1.707-1.707A.996.996 0 0 0 7 14v-4c0-2.757 2.243-5 5-5s5 2.243 5 5v4c0 .266.105.52.293.707L19 16.414V17zm-7 5a2.98 2.98 0 0 0 2.818-2H9.182A2.98 2.98 0 0 0 12 22z"></path></svg>
                        </a>
                    </div>

                    <%-- TABLA DE ELEMENTOS REGISTRADOS--%>
                    <jsp:include page="components/tables/elementosRegistrados.jsp"/>
                    
                    <%-- TABLA DE USUARIOS REGISTRADOS--%>
                    <jsp:include page="components/tables/usuariosRegistrados.jsp"/>

                    <%-- TABLA DE CATEGORIAS REGISTRADOS--%>
                    <jsp:include page="components/tables/categoriasRegistradas.jsp"/>
                    
                </div>
            </main>
        </div>
    </section>

    <%-- SECCION DE MODALES Y OFFCANVAS --%>
    
    <%-- OFFCANVAS DE NOTIFICACIONES --%>
    <jsp:include page="components/forms/offcanvas/Notificaciones.jsp"/>

    <%-- MODAL DE REGISTRO DE ELEMENTOS --%>
    <jsp:include page="components/forms/modals/registroElementos"/>

    <%-- MODAL DE REGISTRO DE USUARIOS --%>
    <jsp:include page="components/forms/modals/registroUsuarios"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>