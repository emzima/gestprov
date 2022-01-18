<%-- 
    Document   : generate
    Created on : 14 dic. 2021, 08:45:59
    Author     : gerencia
<%= cuitNum %>,  <%= phone %>, <%= direction %>,<%= postalCode %>, <%= city %>, <%= country %>, <%= typeCust %>
--%>

<%@page import="database.AccountDAO"%>
<%@page import="model.Information"%>
<%@page import="model.Customer"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main>
    <form method="POST" action="/Login/inforEdit">
        <!--inicio de contenedor formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">GENERAR FACTURA</h3>
                <p style="color:gray"><sup style="color:red; font-weight: bolder">*</sup>¡ESTOS CAMPOS SON OBLIGATORIOS!</p>
                <h4 style="text-align: center"></h4>
            </article>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2" style="width: 100%">
                        <button type="submit" class="btn btn-success">Registrar</button>
                    </div>
                </div>
            </section>
            <%  

            boolean isLogged = (boolean) session.getAttribute("isLogin");

            if (isLogged) {
                AccountDAO AccountDB = new AccountDAO();
                Customer customer = (Customer) session.getAttribute("customer");
                boolean isMessRegisteredOk = (boolean) session.getAttribute("isMessRegisteredOk");
    
                if (isMessRegisteredOk){
                    String cuit = (String) session.getAttribute("cuit");
                    String phone = (String) session.getAttribute("phone");
                    String direction = (String) session.getAttribute("direction");
                    String postalCode = (String) session.getAttribute("postalCode");
                    String city = (String) session.getAttribute("city");
                    String country = (String) session.getAttribute("country");
                    String typeCust = (String) session.getAttribute("typeCust");
%>
        <div class="container">
            <div class="alert alert-success alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </symbol></svg>
                    Ha sido realizado con éxito el registro.</br>
                    <!--En unos segundos será redirigido a la pantalla inicio.-->
                    <%= cuit %>,  <%= phone %>, <%= direction %>,<%= postalCode %>, <%= city %>, <%= country %>, <%= typeCust %>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
            <script>
                //setTimeout( () => window.location.href= "/login/custInformation.jsp",3000);
            </script>
<%
    session.setAttribute("isMessRegisteredOk",false);}
%>
            <section class="row">
                <div class="col">Tipo de factura que desea generar<sup style="color:red; font-weight: bolder">*</sup></div>
<!--                <div class="col">
                </div>-->
<!--                <div class="col">
                    <input type="text" name="typeCust" class="form-control-plaintext" placeholder="" aria-label="Tipo de servicio que desea recibir o prestar" id="typeCust"/>
                    <span class="error" aria-live="polite" style="color: red"></span>
                </div>-->
                <div class="col">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="typeInvoice" aria-label="Por pagar" id="toInvoice" value = "toInvoice" required/>
                        <label class="form-check-label" for="toInvoice">Por pagar</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="typeInvoice" aria-label="Por cobrar" id="fromInvoice" value = "fromInvoice"/>
                        <label class="form-check-label" for="provider">Por cobrar</label>
                    </div>
                </div>
            </section>
            <h4>Datos fiscales de la empresa</h4>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="cuitCus">Cuit de la empresa cliente<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="number" name="cuitCus" class="form-control" placeholder="Escriba el cuit de la empresa cliente" aria-label="Cuit del cliente" aria-describedby="cuitCus" required/>
                    </div>
                </div>
            </section>
            <h4>Datos generales de la factura</h4>
            <section class="row">
                <div class="col-6">
                    <label class="form-label" for="invoiceNum">Número de la factura<sup style="color:red; font-weight: bolder">*</sup></label>
                    <input type="number" name="invoiceNum" class="form-control" placeholder="Escriba el número de la factura" aria-label="Número de la factura" id="invoiceNum" required/>
                </div>
                <div class="col-6">
                    <label class="form-label" for="payTotal">Monto total de la factura (en $)<sup style="color:red; font-weight: bolder">*</sup></label>
                    <input type="number" name="payTotal" class="form-control" placeholder="Escriba el monto total" aria-label="Monto total de la factura" id="payTotal" required/>
                </div>
            </section>
            <section class="row">
                <div class="col-6">
                    <label class="form-label" for="dateIssue">Fecha de expedición<sup style="color:red; font-weight: bolder">*</sup></label>
                    <input type="date" name="dateIssue" class="form-control"  aria-label="Fecha de expedición" id="dateIssue" required/>
                </div>
                <div class="col-6">
                    <label class="form-label" for="dateExpire">Fecha de vencimiento<sup style="color:red; font-weight: bolder">*</sup></label>
                    <input type="date" name="dateExpire" class="form-control"  aria-label="Fecha de vencimiento" id="dateExpire" required/>
                </div>
            </section>
        </div>
        <div style="width: 85%; margin: 5% auto">
            <h4>Condiciones de Pago</h4>
            <section class="row">
                <div class="col-2">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="quotas">Coutas</span>
                        <input list="datalistQuotas" name="quotas" class="form-control" placeholder="Seleccione..." aria-label="Cuotas" aria-describedby="quotas"/>
                        <datalist id="datalistQuotas">
                            <option value="1">
                            <option value="2">
                            <option value="3">
                            <option value="4">
                            <option value="5">
                            <option value="6">
                            <option value="7">
                            <option value="8">
                            <option value="9">
                            <option value="10">
                            <option value="11">
                            <option value="12">
                            <option value="24">
                            <option value="30">
                        </datalist>
                    </div>
                </div>
                <div class="col-3">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="exchange">Valor Dólar (U$D)</span>
                        <input type="Number" name="exchange" class="form-control" placeholder="Indique..." aria-label="Valor Dólar" aria-describedby="exchange"/>
                    </div>
                </div>
                <div class="col-3">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="interestRate">Tasa de interés (%)</span>
                        <input list="datalistInterestRate" name="interestRate" class="form-control" placeholder="Indique..." aria-label="Tasa de interés" aria-describedby="interestRate"/>
                        <datalist id="datalistInterestRate">
                            <option value="2">
                            <option value="4">
                            <option value="5">
                            <option value="6">
                            <option value="8">
                            <option value="10">
                            <option value="12">
                            <option value="14">
                            <option value="15">
                            <option value="16">
                            <option value="18">
                            <option value="20">
                            <option value="25">
                            <option value="30">
                        </datalist>
                    </div>
                </div>
<!--                </section>
                <section class="row">-->
                <div class="col-4">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="typeInterestRate">Tipo de tasa de interés</span>
                        <input list="datalistTypeInterest" name="typeInterestRate" class="form-control" placeholder="Seleccione..." aria-label="Tipo de tasa de interés" aria-describedby="typeInterestRate"/>
                        <datalist id="datalistTypeInterest">
                            <option value="Ninguna">
                            <option value="Tasa fija">
                            <option value="Tasa variable">
                        </datalist>
                    </div>
                </div>
            </section>
            <h4>Condiciones particulares</h4>
            <section class="row">
                <div class="col">
                    <label class="form-label" for="caeNum">Número CAE de la factura</label>
                    <input type="number" name="caeNum" class="form-control" placeholder="Escriba el número CAE de la factura" aria-label="Número CAE de la factura" id="caeNum"/>
                </div>
                <div class="col">
                    <label class="form-label" for="purchaseOrder">Número de orden de compra asociada</label>
                    <input type="email" name="purchaseOrder" class="form-control" placeholder="Escriba el número de orden de compra" aria-label="Número de orden de compra asociada" id="purchaseOrder"/>
                </div>
            </section>
            <h5>Respecto a los artículos de la factura</h5>
            <section class="row">
                <div class="col-12">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="article">Artículo</span>
                        <input type="number" name="item" class="form-control" placeholder="Descripción del artículo" aria-label="Artíulo" id="item"/>
                    </div>
                </div>
                <div class="col-1">
                    <label class="form-label" for="item">#</label>
                    <input type="number" name="item" class="form-control" value="1" aria-label="Item" id="item" disabled/>
                </div>
                <div class="col-2">
                    <label class="form-label" for="payTotal">Cantidad</label>
                    <input type="number" name="celular" class="form-control" placeholder="" aria-label="celular" id="celular"/>
                </div>
                <div class="col-3">
                    <label class="form-label" for="unit">Unidad</label>
                    <input type="number" name="unit" class="form-control" placeholder="" aria-label="Unidad" id="unit"/>
                </div>
                <div class="col-3">
                    <label class="form-label" for="priceUnit">Precio/unidad</label>
                    <input type="number" name="priceUnit" class="form-control" placeholder="" aria-label="Precio/Unidad" id="priceUnit"/>
                </div>
                <div class="col-3">
                    <label class="form-label" for="subPrice">Sub total</label>
                    <input type="number" name="subPrice" class="form-control" placeholder="" aria-label="Sub total" id="subPrice"/>
                </div>
                <div class="col-12">
                    <p>Descripción de la factura</p>
                    <textarea name="descriptionActivity" class="form-control" rows="5" placeholder=Descripción de la actividad de la empresa" aria-label="Descripción de la actividad" id="descriptionActivity"></textarea>
                    <span class="error" aria-live="polite" style= "color: red"></span>
                </div>
            </section>
        </div>
        <table class="table table-secondary table-striped table-hover" style="width: 85%; margin: 5% auto">
            <thead>
              <tr>
                <th colspan="12" style="text-align: center">Mensaje</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colspan="1">#</td>
                <td colspan="1"></td>
                <td colspan="2">Enviado por:</td>
                <td colspan="2"></td>
                <td colspan="2">En fecha</td>
                <td colspan="4"></td>
              </tr>
              <tr>
                <td colspan="2">Asunto:</td>
                <td colspan="2"></td>
                <td colspan="2">Error en:</td>
                <td colspan="6"></td>
              </tr>
              <tr>
                <td colspan="12">Asunto:</td>
              </tr>
            </tbody>
        </table>
        <!-- fin de contenedor formulario -->
    </form>
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
     
</main>    
<%@include file="/WEB-INF/facelets/templates/partialApp/footerApp.jsp" %>
