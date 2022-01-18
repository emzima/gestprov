/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var modalStatus = document.getElementById('modalStatus');
modalStatus.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget;
  // Extract info from data-bs-* attributes
  var invoiceNumCS = button.getAttribute('data-bs-invoicenum');
  var statusInvoiceCS = button.getAttribute('data-bs-statusinvoice');
  //console.log(statusInvoiceCS);
  //console.log(invoiceNumCS);
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  //var modalTitle = modalStatus.querySelector('.modal-title');
  var objInvoiceNumCS = document.getElementById('invoiceNumCS');
  var objInvoiceNumCSViews = document.getElementById('invoiceNumCSViews');
  //var objStatusInvoiceCS = document.getElementById('statusInvoiceCS');
  var objDropdownMenuButtonCS = document.getElementById('dropdownMenuButton');


  //modalTitle.textContent = 'Mensaje a ' + recipient;
  objInvoiceNumCS.value = invoiceNumCS;
  objInvoiceNumCSViews.value = invoiceNumCS;
  //objStatusInvoiceCS.value = statusInvoiceCS;
  objDropdownMenuButtonCS.innerHTML = statusInvoiceCS;
});