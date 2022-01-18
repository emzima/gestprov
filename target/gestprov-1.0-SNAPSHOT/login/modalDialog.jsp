<%-- 
    Document   : modalDialog
    Created on : 24 dic. 2021, 22:54:57
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
<div class="modal fade" id="modalDialog" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #198754">
        <h5 class="modal-title" id="modalLabel">Vas a aceptar/rechazar la factura</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form method="POST" action="/Login/dialog" class="dialog" id="dialog">
        <div class="modal-body">
          <div class="mb-3">
            <label for="invoiceNumDiView" class="col-form-label" style="display: inline" >Número:</label>
            <input type="text" class="form-control-plaintext" id="invoiceNumDiView" name="invoiceNumDiView" style="display: inline-block" disabled/> <!--readonly-->
            <input type="hidden" class="form-control" id="idInvoiceDi" name="idInvoiceDi" style="display: inline-block"/>
          </div>
          <hr style="color: grey;"/>
          <section class="justify-content-between">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="accept" value="accept" checked>
              <label class="form-check-label" for="accept">Aceptar</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="reject" value="reject">
              <label class="form-check-label" for="reject">Rechazar</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="deal" value="deal">
              <label class="form-check-label" for="deal">Negociar</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="cancel" value="cancel">
              <label class="form-check-label" for="cancel">Cancelar</label>
            </div>
          </section>
          <hr style="color: grey;"/>
          <div class="mb-3">Indica el motivo para rechazar/negociar/cancelar la factura</div>
          <div class="mb-3">
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorCuit" value="1">
              <label class="form-check-label" for="errorCuit">Cuit</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorRepeat" value="2">
              <label class="form-check-label" for="errorRepeat">Tramitado</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorNonCompliance" value="4">
              <label class="form-check-label" for="errorNonCompliance">Incumplimiento</label>
            </div>
          </div>
          <div class="mb-3">
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorMonto" value="8">
              <label class="form-check-label" for="errorMonto">Monto</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorInvoiceNum" value="16">
              <label class="form-check-label" for="errorInvoiceNum">N° Factura</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorDateExp" value="32">
              <label class="form-check-label" for="errorDateExp">Fec. vencimiento</label>
            </div>
<!--            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="errorOther1" value="errorOther1">
              <label class="form-check-label" for="errorOther1">Otros rela</label>
            </div>-->
          </div>
          <div class="mb-3">
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorConditions" value="64">
              <label class="form-check-label" for="errorConditions">Condiciones</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorInstallments" value="128">
              <label class="form-check-label" for="errorInstallments">N° Cuotas</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="selectPosts" type="checkbox" id="errorOther2" value="256">
              <label class="form-check-label" for="errorOther2">Otros rela2</label>
            </div>
<!--            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="errorOther3" value="errorOther3">
              <label class="form-check-label" for="errorOther3">Otros rela3</label>
            </div>-->
          </div>
          <div class="mb-3">
          <div class="mb-3">
            <label for="message-text" class="col-form-label"></label>
            <textarea class="form-control" name="textPosts" id="message-text" placeholder="Si desea enviar un mensaje corto"></textarea>
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
