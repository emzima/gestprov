/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var modalDelete = document.getElementById('modalDelete');
modalDelete.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget;
  // Extract info from data-bs-* attributes
  var invoiceNumCD = button.getAttribute('data-bs-invoicenum');
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  //var modalTitle = modalDelete.querySelector('.modal-title');
  //var modalBodyInput = modalDelete.querySelector('.modal-body input');
  var objInvoiceNumCD = document.getElementById('invoiceNumCD');
  var objInvoiceNumCDView = document.getElementById('invoiceNumCDView');
  var objMessageTextCD = document.getElementById('messageTextCD');
  //modalTitle.textContent = 'Mensaje a ' + recipient;
  objInvoiceNumCD.value = invoiceNumCD;
  objInvoiceNumCDView.value = invoiceNumCD;
  objMessageTextCD.value = "¿Estás seguro? ¡No podrás recuperar la información!";
});