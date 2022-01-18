<%-- 
    Document   : zone
    Created on : 14 dic. 2021, 08:45:11
    Author     : gerencia
, <%= customerInvoice %>, <%= dateIssue %>, <%= dateExpire %>
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Invoices"%>
<%@page import="model.Customer"%>
<%@page import="database.AccountDAO"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main class="container" id="main-body" style="width: 85%">
<%
        boolean isLogged = (boolean) session.getAttribute("isLogin");
        
        if (isLogged) {
            session.setAttribute("isMessRegisteredOk",false);
            AccountDAO AccountDB = new AccountDAO();
            Customer customer = (Customer) session.getAttribute("customer");
            
            List<Invoices> toInvoicesDB = AccountDB.getToInvoices(customer.getCuitCustomer());
            session.setAttribute("toInvoicesDB", toInvoicesDB);
            
            List<Invoices> fromInvoicesDB = AccountDB.getFromInvoices(customer.getCuitCustomer());
            session.setAttribute("fromInvoicesDB", fromInvoicesDB);
            
            boolean isMessDeleteOk = (boolean) session.getAttribute("isMessDeleteOk");
            
            if (isMessDeleteOk){
//                    String cuitCustomer = (String) session.getAttribute("cuitCustomer");
//                    String phone = (String) session.getAttribute("phone");
                    String invoiceNum = (String) session.getAttribute("invoiceNum");
//                    String postalCode = (String) session.getAttribute("postalCode");
//                    String city = (String) session.getAttribute("city");
//                    String country = (String) session.getAttribute("country");
//                    String typeCustomer = (String) session.getAttribute("typeCustomer");
//                    String customerInvoice = (String) session.getAttribute("customerInvoice");
//                    String dateIssue = (String) session.getAttribute("dateIssue");
//                    String dateExpire = (String) session.getAttribute("dateExpire");
%>
        <div class="container">
            <div class="alert alert-success alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </symbol></svg>
                    Ha sido borrado el registro con éxito.</br>
                <%= invoiceNum %>
                    <!--En unos segundos será redirigido a la pantalla inicio.-->
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
            <script>
                //setTimeout( () => window.location.href= "/login/custInformation.jsp",3000);
            </script>
<%
    session.setAttribute("isMessDeleteOk",false);}
%>
<table class="table table-dark table-striped table-hover" style="width: 85%" id="tableFpp">
        <h4 style="text-align: center">Facturas por Pagar</h4>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col" style="text-align: center">N° Operación</th>
      <th scope="col"style="align-content: center">Cliente</th>
      <th scope="col"style="align-content: center">Número</br>de Factura</th>
      <!--<th scope="col" style="text-align: center">Fecha</br>Expedición</th>-->
      <th scope="col" style="text-align: center">Fecha</br>Vencimiento</th>
      <th scope="col"style="text-align: center">Monto ($)</th>
      <th scope="col" style="text-align: center">Estatus</br>Vencimiento</th>
      <th colspan="2" style="text-align: center">Estatus</br>Pago</th>
      <th colspan="3" style="text-align: center;  font-weight: bolder">Acciones</th>
    </tr>
  </thead>
  <tbody>
<%
    for(Invoices item:toInvoicesDB) {
%>
    <tr>
      <td scope="row">#</td>
      <td><%= item.getOperationNum() %></td>
      <td><%= item.getCustomer() %></td>
      <td><!--<span>FPP</span>-->
          <%= item.getInvoiceNum() %></td>
      <!--<td><%-- item.getDateIssue() --%></td>-->
      <td>
          <%= item.getDateExpire() %>
      </td>
      <td><%= item.getPayTotal() %></td>
      <td><%= AccountDB.statusCal(item.getDateExpire()) %></td>
      <td>
          <button type="button" class="btn btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalStatus" data-bs-idinvoice = "<%= item.getIdInvoice() %>" data-bs-invoicenum = "<%= item.getInvoiceNum() %>" data-bs-statusinvoice = "<%= item.getStatusInvoice() %>" data-bs-customerinvoice = "<%= item.getCustomer() %>" data-bs-dateissue = "<%= item.getDateIssue() %>" data-bs-dateexpire = "<%= item.getDateExpire() %>" data-bs-paytotal = "<%= item.getPayTotal() %>">
          <svg xmlns="http://www.w3.org/2000/svg" style="color: cornflowerblue" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
          </svg></button>
      </td>
      <td><%= item.getStatusInvoice() %></td>
      <td>
          <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#modalDialog" data-bs-idinvoice = "<%= item.getIdInvoice() %>" data-bs-invoicenum = "<%= item.getInvoiceNum() %>" data-bs-statusinvoice = "<%= item.getStatusInvoice() %>" data-bs-customerinvoice = "<%= item.getCustomer() %>" data-bs-dateissue = "<%= item.getDateIssue() %>" data-bs-dateexpire = "<%= item.getDateExpire() %>" data-bs-paytotal = "<%= item.getPayTotal() %>">
          Aceptar|Rechazar</button>
      </td>
      <td>
          <button id="editModal" type="button" class="btn btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalEdit" data-bs-idinvoice = "<%= item.getIdInvoice() %>" data-bs-operationnum = "<%= item.getOperationNum() %>" data-bs-invoicenum = "<%= item.getInvoiceNum() %>" data-bs-statusinvoice = "<%= item.getStatusInvoice() %>" data-bs-customerinvoice = "<%= item.getCustomer() %>" data-bs-dateissue = "<%= item.getDateIssue() %>" data-bs-dateexpire = "<%= item.getDateExpire() %>" data-bs-paytotal = "<%= item.getPayTotal() %>">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" style="color: #FFC107" viewBox="0 0 16 16">
                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
            </svg>
          </button>
      </td>
      <td>
          <button type="button" class="btn btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalDelete" data-bs-invoicenum = "<%= item.getInvoiceNum() %>">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" style="color: #DC3545" viewBox="0 0 16 16">
                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
              </svg>    
          </button>
      </td>
    </tr>
<%
    }
%>
    </tbody>
</table>
<table class="table table-dark table-striped table-hover" style="width: 85%" id="tableFpc">
        <h4 style="text-align: center">Facturas por Cobrar</h4>
  <thead>
    <tr class="rowFpc">
      <th scope="col">#</th>
      <th scope="col" style="text-align: center">N° Operación</th>
      <th scope="col"style="align-content: center">Cliente</th>
      <th scope="col"style="align-content: center">Número</br>de Factura</th>
      <!--<th scope="col" style="text-align: center">Fecha</br>Expedición</th>-->
      <th scope="col" style="text-align: center">Fecha</br>Vencimiento</th>
      <th scope="col"style="text-align: center">Monto ($)</th>
      <th scope="col" style="text-align: center">Estatus</br>Vencimiento</th>
      <th colspan="2" style="text-align: center">Estatus</br>Cobro</th>
      <th colspan="3" style="text-align: center;  font-weight: bolder">Acciones</th>
    </tr>
  </thead>
  <tbody>
<%
    for(Invoices items:fromInvoicesDB) {
%>
    <tr class="rowFpc">
      <td scope="row">#</td>
      <td><%= items.getOperationNum() %></td>
      <td><%= items.getCustomer() %></td>
      <td><!--<span>FPC</span>-->
          <%= items.getInvoiceNum() %></td>
      <!--<td><%-- items.getDateIssue() --%></td>-->
      <td><%= items.getDateExpire() %></td>
      <td><%= items.getPayTotal() %></td>
      <td><%= AccountDB.statusCal(items.getDateExpire()) %></td>
      <td>
          <button type="button" class="btn btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalStatus" data-bs-idinvoice = "<%= items.getIdInvoice() %>" data-bs-invoicenum = "<%= items.getInvoiceNum() %>" data-bs-statusinvoice = "<%= items.getStatusInvoice() %>" data-bs-customerinvoice = "<%= items.getCustomer() %>" data-bs-dateissue = "<%= items.getDateIssue() %>" data-bs-dateexpire = "<%= items.getDateExpire() %>" data-bs-paytotal = "<%= items.getPayTotal() %>">
          <svg xmlns="http://www.w3.org/2000/svg" style="color: cornflowerblue" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
          </svg></button>
      </td>
      <td><%= items.getStatusInvoice() %></td>
      <td>
          <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#modalDialog" data-bs-idinvoice = "<%= items.getIdInvoice() %>" data-bs-invoicenum = "<%= items.getInvoiceNum() %>" data-bs-statusinvoice = "<%= items.getStatusInvoice() %>" data-bs-customerinvoice = "<%= items.getCustomer() %>" data-bs-dateissue = "<%= items.getDateIssue() %>" data-bs-dateexpire = "<%= items.getDateExpire() %>" data-bs-paytotal = "<%= items.getPayTotal() %>">
          Aceptar|Rechazar</button>
      </td>
      <td>
          <button id="editModal2" type="button" class="btn btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalEdit" data-bs-idinvoice = "<%= items.getIdInvoice() %>" data-bs-operationnum = "<%= items.getOperationNum() %>" data-bs-invoicenum = "<%= items.getInvoiceNum() %>" data-bs-statusinvoice = "<%= items.getStatusInvoice() %>" data-bs-customerinvoice = "<%= items.getCustomer() %>" data-bs-dateissue = "<%= items.getDateIssue() %>" data-bs-dateexpire = "<%= items.getDateExpire() %>" data-bs-paytotal = "<%= items.getPayTotal() %>">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" style="color: #FFC107" viewBox="0 0 16 16">
                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
              </svg>
          </button>
      </td>
      
      <td>
          <button class="btn btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalDelete" data-bs-invoicenum = "<%= items.getInvoiceNum() %>">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" style="color: #DC3545" viewBox="0 0 16 16">
                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
              </button>    
          </a>
      </td>
    </tr>
<%
    }
%>
  </tbody>
</table>
<%
    } else { 
%>
    
    <h1 class="m-5 text-danger" >Debes estar logeado para acceder a esta página</h1>
    <script>
      //setTimeout( () => window.location.href= "/Views/login",1500);  
    </script>
    <a href="/Views/login" class="text-primary"> Volver al login</a>
    
<%
    }
%>
<%@include file="/login/modalEdit.jsp" %>
<%@include file="/login/modalDelete.jsp" %>
<%@include file="/login/modalStatus.jsp" %>
<%@include file="/login/modalDialog.jsp" %>
</main>
<%@include file="/WEB-INF/facelets/templates/partialApp/footerApp.jsp" %>
<script type="text/javascript" src="../public/numberationTable.js"></script>