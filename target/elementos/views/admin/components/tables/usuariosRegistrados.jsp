<%-- IMPORTS DE USUARIOS --%>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<%-- SECCION DE USUARIOS --%>
<section id="usuariosRegistrados" class="container-fluid position-relative py-1 px-1">
    <section>
        <div style="width: 163vh; height: 25em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto">
            <div class="border-bottom pb-2 mb-0 row">
                <h6 class="col mb-0">usuarios registrados</h6>
                <a class="col text-end text" data-bs-toggle="modal" data-bs-target="#registroUsuarioModal">Nuevo usuario</a>
            </div>
            <%-- TABLA --%>
            <div class="table-responsive small">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre y apellido</th>
                            <th scope="col">Email</th>
                            <th scope="col">Identificación</th>
                            <th scope="col">Contraseña</th>
                            <th scope="col">Rol</th>
                            <th scope="col">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            UsuarioDao usuarioDao = new UsuarioDao();
                            List<UsuarioVo> usuarios = usuarioDao.listarUsuarios();
                            for (UsuarioVo usuario : usuarios) {
                        %>
                            <tr>
                                <td><%= usuario.getId() %></td>
                                <td><p><%= usuario.getNombre() %> <%= usuario.getApellido() %></p></td>
                                <td><%= usuario.getEmail() %></td>
                                <td><%= usuario.getNumIdentificacion() %></td>
                                <td><%= usuario.getContrasena() %></td>
                                <td><%= usuario.getRol_fk() %></td>
                                <td><%= usuario.getActivo() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</section>