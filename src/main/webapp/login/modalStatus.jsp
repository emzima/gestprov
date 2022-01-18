<%-- 
    Document   : modalStatus
    Created on : 24 dic. 2021, 22:01:45
    Author     : gerencia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%--
    AccountDAO AccountDB = new AccountDAO();
    long operationNum= Long.parseLong(request.getParameter("OperationNum"));
    Invoices invoice = AccountDB.getInvoiceByOperationNum(operationNum);
    
--%>
<!-- Modal Editar-->
<div class="modal fade" id="modalStatus" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #0D6EFD">
        <h5 class="modal-title" id="modalLabel">Vas a editar el estatus del pago/cobro</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form method="POST" action="/Login/status" class="estatus" id="estatus">
        <div class="modal-body">
          <div class="mb-3">
            <label for="invoiceNumCSViews" class="col-form-label">de la fáctura número:</label>
            <input type="text" class="form-control-plaintext" id="invoiceNumCSViews" name="invoiceNumCSViews" disabled>
            <input type="hidden" class="form-control" id="invoiceNumCS" name="invoiceNumCS" style="display: inline-block"/>
          </div>
<!--          <div class="mb-3">
            <label for="statusInvoiceCS" class="col-form-label">Estatus</label>
            <input type="text" class="form-control" id="statusInvoiceCS">
          </div>-->
          <div class="dropdown mt-3">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <li><a class="dropdown-item" href="#">Pagada/Cobrada</a></li>
              <li><a class="dropdown-item" href="#">Impagada/No cobrada</a></li>
              <li><a class="dropdown-item" href="#">Cancelada</a></li>
            </ul>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
              </svg>
          </button>
          <button type="button" class="btn btn-success">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-square" viewBox="0 0 16 16">
                  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                  <path d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.235.235 0 0 1 .02-.022z"/>
              </svg>
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
</html>