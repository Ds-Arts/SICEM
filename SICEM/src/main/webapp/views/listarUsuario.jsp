<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de usuarios</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="assets/CSS/Listas.css">
    <style>
        
        /* Estilos de la tabla y la barra de búsqueda */
        /* ... */
        /* Estilos para el modal */
        .modal-content {
            max-width: 500px;
        }
    </style>
</head>
<body>
    <h1>Lista de usuarios registrados</h1>
    <form action="<%= request.getContextPath() %>/Usuario" method="GET">
        <input type="text" name="searchTerm" placeholder="Buscar por nombre">
        <button type="submit">Buscar</button>
    </form>
    <form action="<%= request.getContextPath() %>/Usuario" method="GET">
        <input type="number" name="idUsuario" placeholder="Buscar por ID">
        <button type="submit" name="action" value="searchById">Buscar por ID</button>
    </form>
    <%-- Verificar si hay un usuario encontrado y mostrar el cuadro de detalles si es el caso --%>
    <% UsuarioVo usuarioEncontrado = (UsuarioVo) request.getAttribute("usuarioEncontrado"); %>
    <% if (usuarioEncontrado != null) { %>
        <div class="alert alert-success" role="alert">
            <p><strong>ID:</strong> <%= usuarioEncontrado.getId() %></p>
            <p><strong>Nombre:</strong> <%= usuarioEncontrado.getNombre() %></p>
            <p><strong>Usuario:</strong> <%= usuarioEncontrado.getUsuario() %></p>
            <p><strong>Activo:</strong> <%= usuarioEncontrado.isActivo() %></p>
        </div>
    <% } %>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Usuario</th>
            <th>Activo</th>
            <th>Detalles</th>
        </tr>
        <% 
            UsuarioDao usuarioDao = new UsuarioDao();
            List<UsuarioVo> usuarios = usuarioDao.listarUsuarios();
            for (UsuarioVo usuario : usuarios) {
        %>
        <tr>
            <td><%= usuario.getId() %></td>
            <td><%= usuario.getNombre() %></td>
            <td><%= usuario.getUsuario() %></td>
            <td><%= usuario.isActivo() %></td>
            <td><a href="#" data-toggle="modal" data-target="#userDetailsModal"
                   data-id="<%= usuario.getId() %>"
                   data-nombre="<%= usuario.getNombre() %>"
                   data-usuario="<%= usuario.getUsuario() %>"
                   data-activo="<%= usuario.isActivo() %>">Ver detalles</a></td>
        </tr>
        <tr class="separador">
            <td colspan="5"></td>
        </tr>
        <% } %>
    </table>

    <!-- Modal para mostrar los detalles del usuario -->
    <div class="modal fade" id="userDetailsModal" tabindex="-1" role="dialog" aria-labelledby="userDetailsModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="userDetailsModalLabel">Detalles del usuario</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>ID:</strong> <span id="userId"></span></p>
                    <p><strong>Nombre:</strong> <span id="userName"></span></p>
                    <p><strong>Usuario:</strong> <span id="userUsername"></span></p>
                    <p><strong>Activo:</strong> <span id="userActive"></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery y Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        $(document).ready(function () {
            // Mostrar los detalles del usuario en el modal al hacer clic en el enlace
            $('#userDetailsModal').on('show.bs.modal', function (event) {
                var link = $(event.relatedTarget); // Enlace que activó el modal
                var modal = $(this);
                // Obtener los datos del usuario del atributo data-* del enlace
                var id = link.data('id');
                var nombre = link.data('nombre');
                var usuario = link.data('usuario');
                var activo = link.data('activo');
                // Mostrar los datos en el modal
                modal.find('#userId').text(id);
                modal.find('#userName').text(nombre);
                modal.find('#userUsername').text(usuario);
                modal.find('#userActive').text(activo);
            });
        });
    </script>
    <div>
        <a href="index.jsp">Volver</a>
    </div>
</body>
</html>
