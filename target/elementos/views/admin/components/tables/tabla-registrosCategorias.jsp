<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>
<%@ page import="java.util.List" %>

<section id="tabla-registroscategorias" class="container-fluid mt-3">
    <!-- TABLA DE USUARIOS -->
    <div class="container">
        <table class="table table-striped shadow border rounded-3 mb-3">
            <div class="row mx-0 mb-3">
                <div class="hstack gap-3">
                    <h3>categorias</h3>
                    <div class="vr"></div>
                    <!-- BOTON DE AGREGAR NUEVO USUARIO -->
                    <h5>Agregar</h5>
                    <input class="btn-check">
                    <button class="btn btn-outline-success" onclick="mostrarComponente('views/admin/components/forms/tabla-registrarCategorias.jsp')">
                        <i class="bi bi-plus-lg"></i>
                    </button>
                    <div class="vr"></div>
                    <!-- BOTONES PARA ORGANIZAR LOS REGISTROS CONSULTADOS (INCOMPLETO) -->
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
                    <th scope="col">Nombre</th>
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
                    <td><p><%= categoria.getNombreCategoria() %></p></td>
                    <td><%= categoria.getDescripcionCategoria() %></td>
                </tr>
                <%
                    } 
                %>
            </tbody>
        </table>
    </div>
</section>