/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// ESTABLECIENDO LAS CONSTANTES Y VARIABLES GLOBALES
var tables = document.getElementsByTagName('table');
for (var j = 0; j < tables.length; j++){
var table = tables[j],
    rows = table.getElementsByTagName('tr'),
    text = 'textContent' in document ? 'textContent' : 'innerText';

//EVENTO AL INSERTAR LA TABLA
    for (var i = 1, len = rows.length; i < len; i++){
        rows[i].children[0][text] = i; //+ ': ' + rows[i].children[0][text];
    };
}
//var table = document.getElementsByTagName('table')[1],
//    rows = table.getElementsByTagName('tr'),
//    text = 'textContent' in document ? 'textContent' : 'innerText';
//
////EVENTO AL INSERTAR LA TABLA
//for (var i = 1, len = rows.length; i < len; i++){
//    rows[i].children[0][text] = i; //+ ': ' + rows[i].children[0][text];
//}