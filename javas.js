// Primero, selecciona el botón de ingresar y los mensajes de error
var submitButton = document.getElementById('submit-button');
var errorMessage = document.getElementById('error-message');
var contrasenaErrorMessage = document.getElementById('contrasena-error-message');

// Luego, agrega un controlador de eventos al botón de ingresar
submitButton.addEventListener('click', function() {
    // Selecciona los valores de los inputs y los inputs en sí
    var numIdentificacionInputValue = document.getElementById('numIdentificacion').value;
    var numIdentificacionInputElement = document.getElementById('numIdentificacion');
    var contrasenaInputValue = document.getElementById('contrasena').value;
    var contrasenaInputElement = document.getElementById('contrasena');

    // Verifica si el valor del input de número de cédula contiene solo números
    if (!/^\d+$/.test(numIdentificacionInputValue)) {
        // Si no lo contiene, cambia el color del borde del input a rojo
        numIdentificacionInputElement.style.borderColor = 'red';

        // Hace que el mensaje de error sea visible
        errorMessage.style.display = 'block';
    } else {
        // Si contiene solo números, restablece el color del borde del input a su valor predeterminado
        numIdentificacionInputElement.style.borderColor = '';

        // Hace que el mensaje de error sea invisible
        errorMessage.style.display = 'none';
    }

    // Verifica si el valor del input de contrasena está vacío
    if (contrasenaInputValue.trim() === '') {
        // Si está vacío, cambia el color del borde del input a rojo
        contrasenaInputElement.style.borderColor = 'red';

        // Hace que el mensaje de error sea visible
        contrasenaErrorMessage.style.display = 'block';
    } else {
        // Si no está vacío, restablece el color del borde del input a su valor predeterminado
        contrasenaInputElement.style.borderColor = '';

        // Hace que el mensaje de error sea invisible
        contrasenaErrorMessage.style.display = 'none';
    }
});