<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<section id="tabla-registrosUsuarios" class="container-fluid mt-3">
    <!-- TABLA DE USUARIOS -->
    <div class="container">
        <table class="table table-striped shadow border rounded-3 mb-3">
            <div class="row mx-0 mb-3">
                <div class="hstack gap-3">
                    <h3>Usuarios</h3>
                    <div class="vr"></div>
                    <!-- BOTON DE AGREGAR NUEVO USUARIO -->
                    <h5>Agregar</h5>
                    <input class="btn-check">
                    <button class="btn btn-outline-success" onclick="mostrarComponente('views/admin/components/forms/tabla-registrarUsuarios.jsp')">
                        <i class="bi bi-plus-lg"></i>
                    </button>
                    <div class="vr"></div>
                    <form id="buscar-x-id" action="Usuario" method="GET" style="display: none;" class="input-group d-flex">
                        <input id="buscar-x-id" type="text" name="numidusuario"  PLACEHOLDER="Buscar por ID" class="form-control">
                        <button id="buscar-x-id" type="submit" class="btn btn-success" name="action" value="searchById">Buscar</button>
                    </form>
                    <form id="buscar-x-nombre" action="Usuario" method="GET" style="display: none;" class="input-group d-flex">
                        <input id="buscar-x-nombre" type="text" name="nombre"  PLACEHOLDER="Buscar por nombre" class="form-control">
                        <button id="buscar-x-nombre"  type="submit" class="btn btn-success" name="action" value="search">Buscar</button>
                    </form>
                </div>
            </div>
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre y apellido</th>
                    <th scope="col">N. Identificación</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Rol</th>
                    <th scope="col">Estado</th>
                </tr>
            </thead>
            <tbody>



                <%

                   if (request.getAttribute("numerodecaso") == null ) {
                       String numerocaso ="0";
                       request.setAttribute("numerodecaso",numerocaso);
                       String numcaso = request.getAttribute("numerodecaso").toString();
                       System.out.println(numcaso);
                   }

                    String numcaso = request.getAttribute("numerodecaso").toString();
                    System.out.println(numcaso);

                    switch (numcaso){

                        case "1":
                            System.out.println("el nombre llego") ;
                            String  nombre = request.getParameter("nombre");
                            UsuarioDao Usuario1Dao = new UsuarioDao();

                            List<UsuarioVo> usu1 =  Usuario1Dao.buscarUsuariosPorNombre(nombre);

                            for (UsuarioVo usuari : usu1) {
                                 %>

                <tr>
                    <th scope="row"><%= usuari.getId() %></th>
                    <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                    <td><%= usuari.getNumIdentificacion() %></td>
                    <td><%= usuari.getEmail() %></td>
                    <td><%= usuari.getRol_fk() %></td>
                    <td><%= usuari.getActivo() %></td>
                </tr>
                <%
                    };
                %>
                    <%
                            break;

                        case "2":

                            System.out.println("el id llego") ;
                            UsuarioDao UsuarioDao2 = new UsuarioDao();
                            String numidentificacion = request.getParameter("numidusuario");
                            int id = Integer.parseInt(numidentificacion);
                            List<UsuarioVo> usu2 =  UsuarioDao2.buscarUsuariosPornumIdentificacion(id);
                            for (UsuarioVo usuari : usu2){
                    %>
                <tr>
                    <th scope="row"><%= usuari.getId() %></th>
                    <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                    <td><%= usuari.getNumIdentificacion() %></td>
                    <td><%= usuari.getEmail() %></td>
                    <td><%= usuari.getRol_fk() %></td>
                    <td><%= usuari.getActivo() %></td>
                </tr>
                <%
                            };


                %>


                <%
                        break;
                    default:
                            System.out.println("el caso viene por default");
                            UsuarioDao UsuarioDao = new UsuarioDao();
                            List<UsuarioVo> usu = UsuarioDao.listarUsuarios();
                        for (UsuarioVo usuari : usu) {
                %>
                <tr>
                    <th scope="row"><%= usuari.getId() %></th>
                    <td><p><%= usuari.getNombre() %> <%= usuari.getApellido() %></p></td>
                    <td><%= usuari.getNumIdentificacion() %></td>
                    <td><%= usuari.getEmail() %></td>
                    <td><%= usuari.getRol_fk() %></td>
                    <td><%= usuari.getActivo() %></td>
                </tr>
                <%};%>

            <%    
                break;
                    }
             %>



            </tbody>
        </table>
    </div>
</section>