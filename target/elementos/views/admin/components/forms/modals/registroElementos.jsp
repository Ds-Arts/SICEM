<div class="modal fade" id="registroElementoModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="container"></div>
                    <form style="width: 30em" class="col-auto float-start bg-body shadow-sm p-3 rounded" action method>
                        <% if (request.getAttribute("error") != null) { %>
                            <div style="color: red; margin-bottom: 10px;">
                                <%= request.getAttribute("error") %>
                            </div>
                        <% } %>
                        <div>
                            <h4>Registro de elementos</h4>
                        </div>
                        <div class="container py-3">
                            <div class="input-group mb-3">
                                <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1);">
                                        <path
                                            d="M15 4h7v2h-7zm1 4h6v2h-6zm2 4h4v2h-4zM9.307 4l-6 16h2.137l1.875-5h6.363l1.875 5h2.137l-6-16H9.307zm-1.239 9L10.5 6.515 12.932 13H8.068z">
                                        </path>
                                    </svg></label>
                                <input type="text" placeholder="Nombres" aria-label="First name" class="form-control" name="NombreElemento" id="NombreElemento" required/>
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1);">
                                        <circle cx="12" cy="6" r="2"></circle>
                                        <circle cx="6" cy="6" r="2"></circle>
                                        <circle cx="18" cy="6" r="2"></circle>
                                        <circle cx="12" cy="12" r="2"></circle>
                                        <circle cx="6" cy="12" r="2"></circle>
                                        <circle cx="18" cy="12" r="2"></circle>
                                        <circle cx="12" cy="18" r="2"></circle>
                                    </svg></label>
                                <input type="text" placeholder="Numero de placa" aria-label="First name"
                                    class="form-control" name="N_placa" id="N_placa" required/>
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1);">
                                        <path
                                            d="M19.649 5.286 14 8.548V2.025h-4v6.523L4.351 5.286l-2 3.465 5.648 3.261-5.648 3.261 2 3.465L10 15.477V22h4v-6.523l5.649 3.261 2-3.465-5.648-3.261 5.648-3.261z">
                                        </path>
                                    </svg></label>
                                <input type="text" placeholder="Cantidad" aria-label="First name"
                                    class="form-control" name="cantidad" id="cantidad" required/>
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1);">
                                        <path
                                            d="M15.999 8.5h2c0-2.837-2.755-4.131-5-4.429V2h-2v2.071c-2.245.298-5 1.592-5 4.429 0 2.706 2.666 4.113 5 4.43v4.97c-1.448-.251-3-1.024-3-2.4h-2c0 2.589 2.425 4.119 5 4.436V22h2v-2.07c2.245-.298 5-1.593 5-4.43s-2.755-4.131-5-4.429V6.1c1.33.239 3 .941 3 2.4zm-8 0c0-1.459 1.67-2.161 3-2.4v4.799c-1.371-.253-3-1.002-3-2.399zm8 7c0 1.459-1.67 2.161-3 2.4v-4.8c1.33.239 3 .941 3 2.4z">
                                        </path>
                                    </svg></label>
                                <input type="text" placeholder="Costo" aria-label="First name" class="form-control" name="Costo" id="Costo" required/>
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="inputGroupSelect01">Tipo</label>
                                <select class="form-select" name="TipoElemento" id="TipoElemento" required>
                                    <option selected disabled>Elige...</option>
                                    <option>Consumo</option>
                                    <option>Desechable</option>
                                </select>
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1);">
                                        <path
                                            d="M7 11h2v2H7zm0 4h2v2H7zm4-4h2v2h-2zm0 4h2v2h-2zm4-4h2v2h-2zm0 4h2v2h-2z">
                                        </path>
                                        <path
                                            d="M5 22h14c1.103 0 2-.897 2-2V6c0-1.103-.897-2-2-2h-2V2h-2v2H9V2H7v2H5c-1.103 0-2 .897-2 2v14c0 1.103.897 2 2 2zM19 8l.001 12H5V8h14z">
                                        </path>
                                    </svg></label>
                                <input type="date" placeholder="Fecha de ingreso" aria-label="First name"
                                    class="form-control" name="FechaIngresoElemento" id="FechaIngresoElemento" required/>
                            </div>
                            <label>Categoría:</label>
                            <select class="desp" name="categoriaElemento" id="categoriaElemento" required>
                                <option disabled selected value="">Seleccionar una categoria</option> 
                            </select>
                            <div class="input-group mb-3">
                                <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1);">
                                        <path
                                            d="M19 2H9c-1.103 0-2 .897-2 2v6H5c-1.103 0-2 .897-2 2v9a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V4c0-1.103-.897-2-2-2zM5 12h6v8H5v-8zm14 8h-6v-8c0-1.103-.897-2-2-2H9V4h10v16z">
                                        </path>
                                        <path
                                            d="M11 6h2v2h-2zm4 0h2v2h-2zm0 4.031h2V12h-2zM15 14h2v2h-2zm-8 .001h2v2H7z">
                                        </path>
                                    </svg></label>
                                <input type="text" placeholder="Aula" aria-label="First name" class="form-control" name="NumAula" id="NumAula" required/>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">Escriba una descripción del
                                    elemento</label>
                                <textarea class="form-control" placeholder="Descripción"
                                name="Descripcion" id="Descripcion" required rows="3"></textarea>
                            </div>
                            <div class="input-group mb-3">
                                <label>Cuentadante:</label>
                                <select class="desp" name="usuario_fk" id="usuario_fk" required>
                                    <option disabled selected value="">Seleccionar una Cuentadante </option>
                                </select>
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="inputGroupSelect01">Estado del elemento</label>
                                <select class="form-select"name="EstadoElemento" id="EstadoElemento" required>
                                    <option selected>Elige...</option>
                                    <option value="Activo">Activo</option>
                                    <option value="inactivo">Inactivo</option>
                                </select>
                            </div>
                        </div>
                        <div class="container">
                            <button type="submit" name="accion" value="add" class="btn btn-primary">Registrar</button>
                        </div>
                    </form>
                    <div class="col-auto float-end"></div>
                </div>
            </div>
        </div>
    </div>