<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>

<div id="tabla-registrarUsuarios" class="container mb-5">
    <h3>Registrar usuarios</h3>
    <form class="row g-3 needs-validation" novalidate action="Usuario" method="POST">
        <div class="col-md-6">
          <label class="form-label">Nombres</label>
          <input type="text" class="form-control" placeholder="Escribe tus nombres" id="nombre" name="nombre" required>
        </div>
        <div class="col-md-6">
          <label class="form-label">Apellidos</label>
          <input type="text" class="form-control" placeholder="Escribe tus apellidos" id="apellido" name="apellido" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">N. identificación</label>
            <div class="input-group has-validation">
              <span class="input-group-text">#</span>
              <input type="number" class="form-control" placeholder="Escribe tu numero de identificación" id="numIdentificacion" name="numIdentificacion" required>
            </div>
          </div>
        <div class="col-md-6">
          <label class="form-label">Correo electronico</label>
          <div class="input-group has-validation">
            <span class="input-group-text" id="inputGroupPrepend">@</span>
            <input type="email" class="form-control" placeholder="Escribe tu correo electronico" id="email" name="email" required>
          </div>
        </div>

        <div class="col-md-6">
            <label for="validationCustomUsername" class="form-label">Estado</label>
            <div class="input-group">
                <select class="form-select" name="activo" id="activo">
                  <option selected>Elige...</option>
                  <option value="Activo">Activo</option>
                  <option value="inactivo">Inactivo</option>
                </select>
              </div>
          </div>
        <div class="col-md-6">
          <label for="validationCustomUsername" class="form-label">Categoria</label>
          <div class="input-group">
            <select class="form-select" name="rol_fk" id="rol_fk">
                <option selected>Elige categoria del usuario</option>
                <option>Instructor</option>
                <option>Cuentadante</option>
                <option>Administrador</option>
            </select>
          </div>
        </div>

        <div class="col-md-12">
            <label class="form-label">Contraseña</label>
            <input type="text" class="form-control" placeholder="Escribe una contraseña segura" id="contrasena" name="contrasena" required>
        </div>
        <div class="col-12">
          <button class="btn btn-success" type="submit" name="action" value="register">Registrar</button>
        </div>
      </form>
</div>