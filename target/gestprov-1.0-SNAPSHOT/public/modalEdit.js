/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var modalEdit = document.getElementById('modalEdit');
modalEdit.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget;
  // Extract info from data-bs-* attributes
  var invoiceNum = button.getAttribute('data-bs-invoicenum');
  var customerInvoice = button.getAttribute('data-bs-customerinvoice');
  /*var dateIssue = button.getAttribute('data-bs-dateissue');*/
  var dateExpire = button.getAttribute('data-bs-dateexpire');
  var payTotal = button.getAttribute('data-bs-paytotal');
  var operationNum = button.getAttribute('data-bs-operationnum');
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.

//     var params = {"invoiceNum":invoiceNum};
//     console.log(invoiceNum);
//     $.post("/Login/ModalEdit",$.param(params),function(responseText){
//         $("#invoiceNum").text(responseText);
//     });

  // Update the modal's content.
  var modalTitle = modalEdit.querySelector('.modal-title');
  //var objOperationNum = document.getElementById('operationNum');
  var objInvoiceNum = document.getElementById('invoiceNum');
  var objCustomerInvoice = document.getElementById('customerInvoice');
  //var objDateIssue = document.getElementById('dateIssue');
  var objDateExpire = document.getElementById('dateExpire');
  var objPayTotal = document.getElementById('payTotal');
  //var objStatusInvoice = document.getElementById('statusInvoice');

  modalTitle.textContent = 'Vas a editar los datos de la Operación ' + operationNum;
  //objOperationNum.value = operationNum;
  objInvoiceNum.value = invoiceNum;
  objCustomerInvoice.value = customerInvoice;
  //objDateIssue.value = dateIssue;
  objDateExpire.value = dateExpire;
  objPayTotal.value = payTotal;
  //objStatusInvoice.value = statusInvoice;
});
