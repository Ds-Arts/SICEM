<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ElementosDao" %>
<%@ page import="model.ElementosVo" %>
<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>
<%@ page import="model.UsuarioDao" %>
<%@ page import="model.UsuarioVo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/CSS/Listas.css">
    <link rel="icon" href="assets/IMG/ventana.png">
    <title>Consultas</title>
</head>
<body>
    <header class="presen">
        <div class="header-content">
            <img src="assets/IMG/sena.png">
            <h1>| Consulta |</h1>
            <div class="salir">
                <a href="elemento?accion=registrar">
                    <img src="assets/IMG/salir.ico">
                </a>
            </div>
        </div>
        <!-- Encabezado del header -->
    </header>
    <article class="contenedor">
        <div class="search-bar">
            <form action="elemento" method="GET">
                <input type="text" name="placa" placeholder="Buscar por N° de placa">
                <button type="submit" name="accion" value="buscar_elementos">Buscar</button>
            </form>
            
            
            <form action="elemento" method="GET">
                <select class="desp" name="TipoElemento" id="TipoElemento">
                    <option disabled selected value="">Seleccionar el tipo</option>
                    <option>Consumo</option>
                    <option>Desechable</option>
                </select>
                <button type="submit" name="accion" value="buscar_tipo">Buscar</button>
            </form>
        </div>
        <div class="subCont">
            <table class="tabla">
                <thead>
                    <tr id="cabecera">
                        <th>Nombre</th>
                        <th>N° placa</th>
                        <th>Cantidad</th>
                        <th>Costo</th>
                        <th>Tipo</th>
                        <th>Fecha de Ingreso</th>
                        <th>Categoría</th>
                        <th>N° aula</th>
                        <th>Descripción</th>
                        <th>Estado</th>
                        <th>Propietario</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    ElementosDao elementosDao = new ElementosDao();
                    UsuarioDao usuarioDao = new UsuarioDao(); // Importa la clase UsuarioDao

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
                        // Obtener el Usuario correspondiente por su ID
                        UsuarioVo usuario = usuarioDao.buscarUsuarioPorId(elemento.getUsu()); // Reemplaza "buscarUsuarioPorId" con el método real de tu clase UsuarioDao
                    %>
                    <tr id="campo">
                        <td><%= elemento.getNombre()%></td>
                        <td><%= elemento.getNumeroPlaca()%></td>
                        <td><%= elemento.getCantidad()%></td>
                        <td><%= elemento.getCosto()%></td>
                        <td><%= elemento.getTipo()%></td>
                        <td><%= elemento.getFechaIngreso()%></td>
                        <td><%= elemento.getCategoria()%></td>
                        <td><%= elemento.getNumeroAula()%></td>
                        <td><%= elemento.getDescripcion()%></td>
                        <td><%= elemento.getEstado()%></td> 
                        <td><%= elemento.getUsu() + " = " + usuario.getNombre() %></td>
                        <td>  
                            <form action="elemento" method="post"> 
                                <input type="number" name="id_cuentadante" value="<%=elemento.getUsu()%>" hidden>
                                <input type="number" name="n_placa_prestamo" value="<%= elemento.getNumeroPlaca()%>" hidden>
                                <button type="submit" name="accion" value="data_prestamo"><center>Prestamo</center></button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </article>
    <footer class="end0">
        <!-- Pie de página -->
    </footer>
</body>
</html>