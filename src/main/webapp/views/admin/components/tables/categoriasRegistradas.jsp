<%-- IMPORTS DE USUARIOS --%>
<%@ page import="model.CategoriaDao" %>
<%@ page import="model.CategoriaVo" %>
<%@ page import="java.util.List" %>

<%-- SECCION DE CATEGORIAS --%>
                    <section id="categoriasRegistrados" class="container-fluid position-relative py-1 px-1">
                        <article class="row">
                            <section>
                                <div style="width: 60%; height: 30em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto float-start">
                                    <h6 class="border-bottom pb-2 mb-0">Categorias registradas</h6>
                                    <div class="table-responsive small">
                                        <%-- TABLA --%>
                                        <table class="table table-striped table-sm">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Nombres</th>
                                                    <th scope="col">Descripción</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%   
                                                    CategoriaDao cd = new CategoriaDao();
                                                    List<CategoriaVo> categorias=cd.obtenerCategorias();
                                                    for (CategoriaVo categoria : categorias ) { 
                                                %> 
                                                    <tr>
                                                        <td><%= categoria.getNombreCategoria() %></td>
                                                        <td><%= categoria.getDescripcionCategoria() %></td>
                                                    </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div style="width: 40%; height: 22em;" class="my-3 p-3 bg-body rounded shadow-sm border overflow-auto float-end">
                                    <h6 class="border-bottom pb-2 mb-0">Registro de categorias</h6>
                                    <div class="d-flex text-muted pt-3">
                                        <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
                                            <form action="categoria" method="post" class="d-flex flex-column justify-content-between">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
                                                    <input name="n_categoria" type="text" class="form-control" id="exampleFormControlInput1">                                                </div>
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1" class="form-label">Descripción de la categoria</label>
                                                    <textarea name="d_categoria" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                                </div>
                                                <button type="submit" name="action" value="en_categoria" class="btn btn-primary">Registrar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </article>
                    </section>