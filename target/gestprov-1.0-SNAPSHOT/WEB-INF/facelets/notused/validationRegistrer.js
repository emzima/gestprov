/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// ESTABLECIENDO LAS CONSTANTES Y VARIABLES GLOBALES
const BOTONBORRAR= document.getElementById('borrado');
const BOTONRESUMEN= document.getElementById('resumen');
const COMPRAR  = document.getElementById('especial');
const NOMBRE  = document.getElementById('nombre');
const APELLIDO  = document.getElementById('apellido');
const CATEGORIA = document.getElementsByName('categoria')[0];
const CANTIDAD = document.getElementsByName('cantidad')[0];
const CORREO = document.getElementsByName('correo')[0];
const TOTAL  = document.getElementById('total');
const NOMBREERROR = document.querySelector('#nombre + span.error');
const APELLIDOERROR = document.querySelector('#apellido + span.error');
const CORREOERROR = document.querySelector('#correo + span.error');
const CANTIDADERROR = document.querySelector('#cantidad + span.error');
const BTN= document.createElement('BUTTON');
const TEXTO= document.createTextNode('PAGAR');
const MNSGERROR= 'Pequeño error que da si no hay boton creado. Ha sido capturado. Este console.log es innecesario sólo es pedagógico';
const MNSGFINAL= 'Sus datos serán enviadoas a una pasarela de pago para su mayor seguridad... Muchas gracias por su selección, confianza y ojalá su participación sea fructifera...';
const ARRAYDESCUENTO=[.2,.5,.85,1];
let isValor= false;

//FUNCION LLAMADA CAMBIO DE COLOR DE LOS INPUTS MENOS NOMBRE Y APELLIDO
function color(valor,tono){ 
    document.getElementById(valor).style.backgroundColor= tono;
};

//FUNCION LLAMADA CONTROL DEL VALOR DE LA CANTIDAD ENTERO MAYOR QUE 0
let controlCantidad = (valor) => {
        if ((parseInt(valor)> 0) && ((parseFloat(valor)-parseInt(valor))===0)) {
            return true;
        } else {
            return false;
        }
};
//FUNCION LLAMADA BORRADO CON FUNCIONES DE LLAMADA Y CON CAPTURA DE UN ERROR
const BORRADO= ()=>{
    document.getElementById('categoria').value= 'estudiante';
    color('categoria','#FFF');
    document.getElementById('cantidad').value= '';
    color('cantidad','#FFF');
    CANTIDADERROR.innerHTML = '';
    document.getElementById('nombre').value= '';
    color('nombre','#FFF');
    NOMBREERROR.innerHTML = '';
    document.getElementById('apellido').value= '';
    color('apellido','#FFF');
    APELLIDOERROR.innerHTML = '';
    document.getElementById('correo').value= '';
    color('correo','#FFF');
    CORREOERROR.innerHTML = '';
    document.getElementById('total').value= '';
    try{
        document.getElementById('piepagina').removeChild(BTN);
    } catch (DOMException){
        console.log(MNSGERROR);
    }
};

//EVENTO AL HACER CLICK EN RESUMEN CON FUNCION EJECUTABLE Y LLAMADA PARA VALIDAR EL ENVIO DEL FORM
BOTONRESUMEN.addEventListener('click', function (event) {
    let cantidadTickets = (document.getElementById('cantidad').value);
    if((!NOMBRE.validity.valid) || (!APELLIDO.validity.valid) || (!CANTIDAD.validity.valid) || (!CORREO.validity.valid)){
        muestreError();
        event.preventDefault();
        alert('Se deben rellenar algunos campos antes de calcular el resumen del presupuesto ');
        isValor = controlCantidad(cantidadTickets);
        if (!isValor){
            alert('Por favor, indicar un número entero mayor que cero');
            document.getElementById('cantidad').value= '';
        }
    } else {
        NOMBREERROR.innerHTML = '';
        APELLIDOERROR.textContent = '';
        CORREOERROR.textContent = '';
        CANTIDADERROR.textContent = '';
        let indice= CATEGORIA.selectedIndex; 
        let totalApagar= ARRAYDESCUENTO[indice]*200*cantidadTickets;
        document.getElementById('total').value= ("    Total a Pagar: $   "+totalApagar); //+
        document.getElementById('total').style.color = 'blue';
        BTN.setAttribute('style','color: red; font-size:10px');
        BTN.appendChild(TEXTO);
        document.getElementById('piepagina').appendChild(BTN);
        BTN.onclick= ()=>{
            BORRADO();
            document.getElementById('total').value= '';
            alert(MNSGFINAL);
        };
    };
});

//EVENTO AL HACER CLICK EN BORRAR CON FUNCION EJECUTABLE Y LLAMADAS   
BOTONBORRAR.addEventListener('click', BORRADO);

//EVENTO AL CAMBIAR LA CATEGORIA CON FUNCION EJECUTABLE Y LLAMADA, CON CAPTURA DE UN ERROR
CATEGORIA.addEventListener('change',()=>{
    document.getElementById('total').value= '';
    try{
        document.getElementById('piepagina').removeChild(BTN);
    } catch (DOMException){
        console.log(MNSGERROR);
    }
    color('categoria','#E8F0FE');
});

//EVENTO AL CAMBIAR LA CANTIDAD CON FUNCION EJECUTABLE Y LLAMADA
CANTIDAD.addEventListener('change',()=>{
    color('cantidad','#E8F0FE');
});

//EVENTO CON FUNCION EJECUTABLE AL CAMBIAR EL CORREO
CORREO.addEventListener('change', function (event) {
    color('correo','#E8F0FE');
    if (CORREO.validity.valid) {
        CORREOERROR.innerHTML = '';
        CORREOERROR.className = 'error';
    } else {
        muestreErrorCorreo();
    }
});

//FUNCION LLAMADA PARA VALIDAR EL ENVIO DEL FORM
function muestreError() {
    if(NOMBRE.validity.valueMissing) {
        color('nombre','pink');
        NOMBREERROR.textContent = 'Falta el Nombre.';
    } else {
        NOMBREERROR.innerHTML = '';}
    if(APELLIDO.validity.valueMissing) {
        color('apellido','pink');
        APELLIDOERROR.textContent = 'Falta el Apellido.';
    } else {
        APELLIDOERROR.innerHTML = '';
    }
    if(CANTIDAD.validity.valueMissing) {
        color('cantidad','pink');
        CANTIDADERROR.textContent = 'Falta la Cantidad.';
    } else {
        CANTIDADERROR.innerHTML = '';
    }
    muestreErrorCorreo();
}
//FUNCION LLAMADA PARA VALIDAR EL FORMATO DEL CORREO
function muestreErrorCorreo() {
    if(CORREO.validity.valueMissing) {
        CORREOERROR.textContent = 'Falta la dirección de Correo Electrónico.';
        color('correo','pink');
    } else if(CORREO.validity.typeMismatch) {
        CORREOERROR.textContent = 'El valor introducido debe ser una dirección de Correo Electrónico (puede faltar el @ y la longitud miníma de 8 carácteres).';
        color('correo','pink');
    } else if(CORREO.validity.tooShort) {
        CORREOERROR.textContent = `El correo electrónico debe tener al menos ${minLength} carácteres; ha introducido ${ CORREO.value.length }.`;
        color('correo','pink');
    }
    CORREOERROR.className = 'error activo';
};


/*este es el codigo

   
        const PASSWORD  = document.getElementById('password');
        const PASSWORDREPETIDA  = document.getElementById('passwordRepetida');
        const PASSWORDERROR = document.getElementById('passwordC');
        const BOTONENVIAR= document.getElementById('enviar');
             
        //EVENTO AL HACER CLICK EN RESUMEN CON FUNCION EJECUTABLE Y LLAMADA PARA VALIDAR EL ENVIO DEL FORM
        BOTONENVIAR.addEventListener('click', function (event) {
            if(!passwordValidate(event)){
                PASSWORDERROR.innerHTML = '';
                document.regristro.submit();
            };
        });
        //FUNCIONES CON EVENTO CON FUNCION EJECUTABLE AL CAMBIAR EL PASSWORD
        function passwordValidate(event){
//            PASSWORD.addEventListener('change', function (event) {
//                PASSWORDREPETIDA.addEventListener('change', function (event) {
                    if (PASSWORD.validity.valid && PASSWORD.value === PASSWORDREPETIDA.value && PASSWORD !== null) {
                        PASSWORDERROR.innerHTML = '';
                        PASSWORDERROR.className = 'error';
                        return false;
                    } else {
                        muestreErrorPassword();
                    return true;
                    }
//                });
//            });
        }

        //FUNCION LLAMADA PARA VALIDAR EL PASSWORD
        function muestreErrorPassword() {
            if(!(PASSWORD.value === PASSWORDREPETIDA.value)) {
                PASSWORDERROR.textContent = 'El Password debe ser correctamente repetido.';
                //color('password',FFC0B);
            } else if(PASSWORD.valueMissing) {
                PASSWORDERROR.textContent = 'El Password no puede ser nulo.';
                //color('password','pink');
            } else if(PASSWORD.validity.tooShort) {
                PASSWORDERROR.textContent = `El Password debe tener al menos 8 carácteres.`;
                //color('password','pink');
            }
            PASSWORDERROR.className = 'error activo';
        };
    */