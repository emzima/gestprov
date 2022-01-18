/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// ESTABLECIENDO LAS CONSTANTES Y VARIABLES GLOBALES

const BOTONACCESS= document.getElementById('access');
const PASSWORD  = document.getElementById('password');
const REPASSWORD  = document.getElementById('passwordAgain');
const PASSWORVALIDATED = document.querySelector('#validate');

let isValor= false;

//EVENTO AL HACER CLICK EN INGRESAR CON FUNCION EJECUTABLE Y LLAMADA PARA VALIDAR EL ENVIO DEL FORM
console.log(PASSWORD.value);
console.log(REPASSWORD.value);
REPASSWORD.addEventListener('change', function (event) {
console.log(PASSWORD.value);
console.log(REPASSWORD.value);
    if(PASSWORD.value === REPASSWORD.value && REPASSWORD.value!== null){
        console.log("aca");
//        var insert = "<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' class='bi bi-check-circle' viewBox='0 0 16 16'>
//  <path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/>
//  <path d='M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z'/>
//</svg>"
        //const icon = document.createElement("i");
        //icon.class = "bi bi-check-circle";
        //document.body.replaceChild(icon, PASSWORVALIDATED);
        PASSWORVALIDATED.innerHTML ='<i class="bi bi-check-circle" style="font-size: 20px;color:#198754"></i><div id="ariaLabel" class="error" aria-live="polite" style="color: #198754; font-size: 12px">Valido</div>';
        //PASSWORVALIDATED.innerHTML = '';
    };
});


//FUNCION LLAMADA PARA VALIDAR EL ENVIO DEL FORM
//function muestreError() {
//    if(PASSWORD.validity.valueMissing) {
//        color('password','pink');
//        PASSWORDERROR.textContent = 'Falta la contraseña.';
//    } else {
//        PASSWORDERROR.innerHTML = '';}
//    muestreErrorCorreo();
//}

//FUNCION LLAMADA PARA EVITAR EL BACK EN LAS VENTANAS
function nobackbutton(){
    window.location.hash="no-back-button";
    window.location.hash="Again-No-back-button";
    window.onhashchange= function(){
        window.location.hash="no-back-button";
    };
}

