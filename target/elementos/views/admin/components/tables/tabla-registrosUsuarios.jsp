<section id="tabla-registrosUsuarios" class="container-fluid mt-3">
    <!-- TABLA DE USUARIOS -->
    <div class="container">
        <table class="table table-striped shadow border rounded-3">
            <thead class="">
                <div class="row mx-0">
                    <!-- TITULO DE LA TABLA -->
                    <div class="col-4">
                        <h3>Usuarios</h3>
                    </div>
                    <!-- BARRA DE BUSQUEDA -->
                    <div class="col-4">
                        <div class="input-group mb-3">
                            <span class="input-group-text bg-transparent" id="basic-addon1">Buscar</span>
                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                            <span class="input-group-text" id="basic-addon1"><div class="btn btn-success"><i class="bi bi-search"></i></div></span>
                        </div>
                    </div>
                    <!-- BORDENAR POR -->
                    <div class="col-4">
                            <div class="row">
                                <div class="col-4">
                                    <p>Ordenar por:</p>
                                </div>
                                <div class="col-8 btn-group">
                                    <button 
                                        class="btn btn-outline-secondary"
                                        type="button"
                                        data-bs-toggle="tooltip" 
                                        data-bs-placement="top"
                                        data-bs-custom-class="custom-tooltip"
                                        data-bs-title="Nombre y apellido"
                                    >
                                        <i class="bi bi-alphabet-uppercase"></i>
                                    </button>
                                    <button class="btn btn-outline-secondary">
                                        <i class="bi bi-envelope-at"></i>
                                    </button>
                                    <button class="btn btn-outline-secondary">
                                        <i class="bi bi-list-ol"></i>
                                    </button>
                                </div>
                            </div>
                    </div>
                </div>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre y apellido</th>
                    <th scope="col">N. Identificación</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Rol</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Correo</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>@fat</td>
                    <td>@fat</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>