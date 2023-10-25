function mostrarComponente(rutaComponente) {
    fetch(rutaComponente)
        .then(response => response.text())
        .then(data => {
            document.getElementById('contenedor-tablas').innerHTML = data;
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

//Funcion para la barra de busqueda de la tabla dinamica de usuarios.
function cambiarBusqueda(IDBarraBusqueda) {
    var components = document.getElementsByClassName('barra-busqueda-usuario');
    for (var i = 0; i < components.length; i++) {
        components[i].style.display = 'none';
    }
    var component = document.getElementById(IDBarraBusqueda);
    if (component) {
        component.style.display = 'block';
    }
}