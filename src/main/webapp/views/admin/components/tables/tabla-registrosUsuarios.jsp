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
                    <input id="buscar-x-id" class="form-control me-auto barra-busqueda-usuario"  style="display: none;" type="text" placeholder="Buscar por ID">
                    <input id="buscar-x-nombre" class="form-control me-auto barra-busqueda-usuario" type="text" placeholder="Buscar por nombre">
                    <div class="btn-group">
                        <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            Buscar por...
                        </button>
                        <ul class="dropdown-menu">
                            <li><button onclick="cambiarBusqueda('buscar-x-id')" class="dropdown-item" href="#">ID</button></li>
                            <li><button onclick="cambiarBusqueda('buscar-x-nombre')" class="dropdown-item" href="#">Nombre</button></li>
                        </ul>
                    </div>
                    <div class="vr"></div>
                    <h5>Organizar</h5>
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                        <label class="btn btn-outline-success" for="btnradio1">Aa</label>
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                        <label class="btn btn-outline-success" for="btnradio2">#</label>
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                        <label class="btn btn-outline-success" for="btnradio3">@</label>
                    </div>
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
                <%} %>
            </tbody>
        </table>
    </div>
</section>