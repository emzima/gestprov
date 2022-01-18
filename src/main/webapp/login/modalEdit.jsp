<%-- 
    Document   : modalEdit
    Created on : 23 dic. 2021, 21:23:49
    Author     : gerencia 
--%>


<%@page import="java.util.List"%>
<%@page import="model.Invoices"%>
<%@page import="database.AccountDAO"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%--
    if (request.getAttribute("operationNum")!=null){
    long operationNum = (long) request.getAttribute("operationNum");
    } else {
    long operationNum = 1000;}
--%>
<%--
    
    //JsonObject data = new Gson().fromJson(request.getReader(), JsonObject.class);
    long operationNum = Long.parseLong(data.get("OperationNum").getAsString());
--%>
<!-- Modal Editar-->
<div class="modal fade" id="modalEdit" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #FFC107">
        <h5 class="modal-title" id="modalLabel"></h5>
        <input type="hidden" class="form-control" id="operationNum" name="operationNum" style="display: inline-block"/>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form method="POST" action="/Login/modalEdit" class="borrar" id="borrar">
        <div class="modal-body">
          <div class="mb-3">
            <label for="invoiceNum" class="col-form-label">Número:</label>
            <input type="text" readonly class="form-control-plaintext" id="invoiceNum" name="invoiceNum"/>
          </div>
<!--          <div class="mb-3">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>-->
          <div class="mb-3">
            <label for="customer" class="col-form-label">Cuit del cliente:</label>
            <input type="text" readonly class="form-control-plaintext" aria-label="Cuit del cliente" id="customerInvoice" name="customerInvoice"/>
          </div>
          <div class="mb-3">
            <label for="payTotal" class="col-form-label">Monto:</label>
            <input type="text" class="form-control" aria-label="Monto ($)" id="payTotal" name="payTotal"/>
          </div>
<!--          <div class="mb-3">
            <label for="dateIssue" class="col-form-label">Fecha de expedición:</label>
            <input type="text" class="form-control" aria-label="Fecha de expedición" id="dateIssue" name="dateIssue"/>
          </div>-->
          <div class="mb-3">
            <label for="dateExpire" class="col-form-label">Fecha de vencimiento:</label>
            <input type="text" class="form-control" aria-label="Fecha de vencimiento" id="dateExpire" name="dateExpire"/>
          </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                </svg>
            </button>
            <button type="submit" class="btn btn-success">
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
