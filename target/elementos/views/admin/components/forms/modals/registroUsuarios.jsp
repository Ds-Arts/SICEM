<div class="modal fade" id="registroUsuarioModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="container">
                    <form style="width: 30em" class="col-auto float-start bg-body shadow-sm p-3 rounded" action method>
                        <div>
                            <h4>Registro de usuarios</h4>
                        </div>
                        <div class="container py-3">
                            <div class="input-group mb-3">
                                <label class="input-group-text opacity-75" for="inputGroupSelect01"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1);">
                                        <path
                                            d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z">
                                        </path>
                                    </svg></label>
                                <input type="text" placeholder="Nombres" aria-label="First name" class="form-control" />
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="inputGroupSelect01">Categoria</label>
                                <select class="form-select" id="inputGroupSelect01">
                                    <option selected>Elige...</option>
                                    <option value="profesor">Profesor</option>
                                    <option value="admin">Administrador</option>
                                    <option value="cuentadante">Cuantadatnte</option>
                                </select>
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text opacity-75" id="addon-wrapping"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        style="fill: rgba(0, 0, 0, 1)">
                                        <path
                                            d="M12 2C9.243 2 7 4.243 7 7v3H6c-1.103 0-2 .897-2 2v8c0 1.103.897 2 2 2h12c1.103 0 2-.897 2-2v-8c0-1.103-.897-2-2-2h-1V7c0-2.757-2.243-5-5-5zm6 10 .002 8H6v-8h12zm-9-2V7c0-1.654 1.346-3 3-3s3 1.346 3 3v3H9z">
                                        </path>
                                    </svg></span>
                                <input type="text" class="form-control" placeholder="Contraseña" aria-label
                                    aria-describedby="addon-wrapping" />
                            </div>
                        </div>
                        <div class="container">
                            <button type="button buttom__default" class="btn btn-primary">Registrar</button>
                        </div>
                    </form>
                    <div class="col-auto float-end"></div>
                </div>
            </div>
        </div>
    </div>    