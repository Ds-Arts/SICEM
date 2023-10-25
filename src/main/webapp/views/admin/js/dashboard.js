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
