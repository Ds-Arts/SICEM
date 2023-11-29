var submitButton = document.getElementById('submit-button');
var errorMessage = document.getElementById('error-message');
var contrasenaErrorMessage = document.getElementById('contrasena-error-message');
document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var numIdentificacionInputValue = document.getElementById('numIdentificacion').value;
    var numIdentificacionInputElement = document.getElementById('numIdentificacion');
    var contrasenaInputValue = document.getElementById('contrasena').value;
    var contrasenaInputElement = document.getElementById('contrasena');
    if (!/^\d+$/.test(numIdentificacionInputValue)) {
        numIdentificacionInputElement.style.borderColor = 'red';
        errorMessage.style.display = 'block';
    } else {
        numIdentificacionInputElement.style.borderColor = '';
        errorMessage.style.display = 'none';
    }
    if (contrasenaInputValue.trim() === '' ) {
        contrasenaInputElement.style.borderColor = 'red';
        contrasenaErrorMessage.style.display = 'block';
    } else {
        contrasenaInputElement.style.borderColor = '';
        contrasenaErrorMessage.style.display = 'none';
    }

});
