<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- IMPORTS DE ELEMENTOS --%>
<%@ page import="model.ElementosDao" %>
<%@ page import="model.ElementosVo" %>
<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>
<%@ page import="java.util.List" %>

<%-- TABLA DE ELEMENTOS --%>
<section id="elementosRegistrados" class="container-fluid position-relative py-1 px-1">
    <section>
        <div style="width: 163vh; height: 25em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto">
            <div class="border-bottom pb-2 mb-0 row">
                <h6 class="col mb-0">Elementos registrados</h6>
                <a class="col text-end text" data-bs-toggle="modal" data-bs-target="#registroElementoModal">Nuevo elemento</a>
            </div>
            <div class="table-responsive small">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Num. placa</th>
                            <th scope="col">Costo</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Aula</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Cuadrante</th>
                            <th scope="col">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            ElementosDao elementosDao = new ElementosDao();
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
                        %>
                            <tr>
                                <td><%=elemento.getNombre()%></td>
                                <td><%= elemento.getNumeroPlaca()%></td>
                                <td><%=elemento.getCosto()%></td>
                                <td><%=elemento.getTipo()%></td>
                                <td><%=elemento.getFechaIngreso()%></td>
                                <td><%=elemento.getCategoria()%></td>
                                <td><%=elemento.getNumeroAula()%></td>
                                <td><%=elemento.getDescripcion()%></td>
                                <td><%=elemento.getUsu()%></td>
                                <td><%=elemento.getEstado()%></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</section>