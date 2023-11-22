<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<div id="tabla-registrarCategorias" class="container mb-5">
    <h3>Registrar usuarios</h3>
    <form class="row g-3 needs-validation" novalidate action="categoria" method="post" >
        <div class="col-md-6">
          <label class="form-label">Nombres</label>
          <input type="text" class="form-control" placeholder="Escribe tus nombres" name="n_categoria" required>
        </div>
        <div class="col-md-6">
          <label class="form-label">Apellidos</label>
          <input type="text" class="form-control" placeholder="Escribe tus apellidos" name="d_categoria" required>
        </div>
        <div class="col-12">
          <button class="btn btn-success" type="submit" name="action" value="en_categoria">Registrar</button>
        </div>
      </form>
</div>