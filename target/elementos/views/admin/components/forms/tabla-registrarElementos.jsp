<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- IMPORTS DE ELEMENTOS --%>
<%@ page import="model.ElementosDao" %>
<%@ page import="model.ElementosVo" %>
<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>
<%@ page import="java.util.List" %>

<%-- IMPORTS DE USUARIOS --%>
<%@ page import="model.UsuarioDao" %> 
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<%-- IMPORTS DE PRESTAMOS --%>
<%@ page import="model.PrestamosVo" %>
<%@ page import="model.PrestamosDao" %>

<div id="tabla-registrarUsuarios" class="container mb-5">
    <h3>Registrar elementos</h3>
    <form class="row g-3 needs-validation" novalidate action="elemento" method="post">
        <div class="col-md-6">
          <label class="form-label">Nombres</label>
          <input type="text" placeholder="Nombre del elemento" class="form-control" name="NombreElemento" id="NombreElemento" required/>
        </div>
        <div class="col-md-6">
          <label for="validationCustom02" class="form-label">N. Placa</label>
          <input type="number" placeholder="Numero de placa" class="form-control" name="N_placa" id="N_placa" required/>
        </div>

        <div class="col-md-6">
            <label for="validationCustomUsername" class="form-label">Cantidad</label>
            <div class="input-group has-validation">
              <span class="input-group-text" id="inputGroupPrepend">#</span>
              <input type="text" placeholder="Cantidad" class="form-control" name="cantidad" id="cantidad" required/>
            </div>
          </div>
        <div class="col-md-6">
          <label for="validationCustomUsername" class="form-label">Costo</label>
          <div class="input-group has-validation">
            <span class="input-group-text" id="inputGroupPrepend">$</span>
            <input type="text" placeholder="Costo" aria-label="First name" class="form-control" name="Costo" id="Costo" required/>
          </div>
        </div>

        <div class="col-md-6">
            <label for="validationCustomUsername" class="form-label">Tipo</label>
            <div class="input-group">
              <select class="form-select" name="TipoElemento" id="TipoElemento" required>
                  <option selected disabled>Elige...</option>
                  <option>Consumo</option>
                  <option>Desechable</option>
              </select>
            </div>
          </div>
        <div class="col-md-6">
          <label for="validationCustomUsername" class="form-label">Fecha de ingreso</label>
          <div class="input-group">
            <input type="date" placeholder="Fecha de ingreso" class="form-control" name="FechaIngresoElemento" id="FechaIngresoElemento" required/>
          </div>
        </div>

        <div class="col-md-12">
          <label for="validationCustom03" class="form-label">Categoria</label>
          <select class="form-select" name="categoriaElemento" id="categoriaElemento" required>
            <option selected>Elige una categoria...</option>
            <%
                System.out.println("");
                CategoriaDao ad = new CategoriaDao();
                List<CategoriaVo> categoriass=ad.obtenerCategorias();
                for (CategoriaVo categoria : categoriass ) { 
            %>
            <option value="<%= categoria.getNombreCategoria() %>"><%= categoria.getNombreCategoria() %></option>
            <% } %>
          </select>
        </div>
        <div class="col-md-12">
          <label for="exampleFormControlTextarea1" class="form-label">Escriba una descripción del elemento</label>
          <textarea class="form-control" placeholder="Descripción" name="Descripcion" id="Descripcion" required rows="3"></textarea>
        </div>
        <div class="col-md-6">
          <label class="input-group-text" for="inputGroupSelect01">Estado del elemento</label>
          <select class="form-select"name="EstadoElemento" id="EstadoElemento" required>
              <option selected>Elige...</option>
              <option value="Activo">Activo</option>
              <option value="inactivo">Inactivo</option>
          </select>
        </div>
        <div class="col-md-6">
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

        <div class="col-12">
          <button type="submit" name="accion" value="add" class="btn btn-primary">Registrar</button>
        </div>
      </form>
</div>