<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<div id="tabla-registrarUsuarios" class="container mb-5">
    <h3>Registrar usuarios</h3>
    <form class="row g-3 needs-validation" novalidate>
        <div class="col-md-6">
          <label for="validationCustom01" class="form-label">Nombres</label>
          <input type="text" class="form-control" id="validationCustom01" required>
        </div>
        <div class="col-md-6">
          <label for="validationCustom02" class="form-label">Apellidos</label>
          <input type="text" class="form-control" id="validationCustom02" required>
        </div>

        <div class="col-md-6">
            <label for="validationCustomUsername" class="form-label">N. identificación</label>
            <div class="input-group has-validation">
              <span class="input-group-text" id="inputGroupPrepend">#</span>
              <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
            </div>
          </div>
        <div class="col-md-6">
          <label for="validationCustomUsername" class="form-label">Correo electronico</label>
          <div class="input-group has-validation">
            <span class="input-group-text" id="inputGroupPrepend">@</span>
            <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
          </div>
        </div>

        <div class="col-md-6">
            <label for="validationCustomUsername" class="form-label">Estado</label>
            <div class="input-group">
                <label class="input-group-text" for="inputGroupSelect01">Options</label>
                <select class="form-select" id="inputGroupSelect01">
                  <option selected>Choose...</option>
                  <option value="1">One</option>
                </select>
              </div>
          </div>
        <div class="col-md-6">
          <label for="validationCustomUsername" class="form-label">Categoria</label>
          <div class="input-group">
            <label class="input-group-text" for="inputGroupSelect01">Options</label>
            <select class="form-select" id="inputGroupSelect01">
              <option selected>Choose...</option>
              <option value="1">One</option>
            </select>
          </div>
        </div>

        <div class="col-md-12">
          <label for="validationCustom03" class="form-label">Contraseña</label>
          <input type="text" class="form-control" id="validationCustom03" required>
        </div>
        <div class="col-12">
          <button class="btn btn-success" type="submit">Registrar</button>
        </div>
      </form>
</div>