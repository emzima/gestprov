/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var modalDialog = document.getElementById('modalDialog');
modalDialog.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget;
  // Extract info from data-bs-* attributes
  var invoiceNumDi = button.getAttribute('data-bs-invoicenum');
  var idInvoiceDi = button.getAttribute('data-bs-idinvoice');
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  //var modalTitle = modalDialog.querySelector('.modal-title');
  var objInvoiceNumDiView = document.getElementById('invoiceNumDiView');
  var objInvoiceNumDi = document.getElementById('invoiceNumDi');

  //modalTitle.textContent = 'Mensaje a ' + recipient;
  objInvoiceNumDiView.value = invoiceNumDi;
  objInvoiceNumDi.value = invoiceNumDi;
});

