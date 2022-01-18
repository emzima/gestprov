<%-- 
    Document   : custinformation
    Created on : 14 dic. 2021, 09:00:28
    Author     : gerencia
--%>

<%@page import="model.User"%>
<%@page import="model.Information"%>
<%@page import="model.Customer"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main>
    <form method="POST" action="/Login/custInforEdit">
        <!--inicio de contenedor formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">EDICI�N DE DATOS DEL CLIENTE</h3>
                <h4 style="text-align: center">Informaci�n de la empresa</h4>
            </article>
            <%  
            
            
            boolean isLogged = (boolean) session.getAttribute("isLogin");

            if (isLogged) {
                Customer customer = (Customer) session.getAttribute("customer");
                Information information = (Information) session.getAttribute("information");
                User user = (User) session.getAttribute("user");
            %>
            <section class="row">
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="namesCust">Nombre de usario</span>
                        <input type="text" name="namesCust" class="form-control" value="<%= information.getNamesCust() %>" aria-label="Nombre de usario de la empresa" aria-describedby="namesCust" disabled/>
                    </div>
                </div>
                <div class="col-7">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="typeCust">Tipo de servicio</span>
                        <input list="datalistOptions" name="typeCustomer" class="form-control" value="<% out.print(customer.getTypeCustomer()); %>" aria-label="Tipo de servicio que desea recibir o prestar" aria-describedby="typeCust"/>
                        <datalist id="datalistOptions">
                            <option value="Prestador">
                            <option value="Proveedor">
                            <option value="Prestador y Proveedor">
                        </datalist>
                    </div>    
                </div>
            </section>
            <h4>Datos fiscales de la empresa</h4>
            <section class="row">
                <div class="col-4">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="cuitViews">Cuit</span>
                        <input type="number" name="cuitViews" class="form-control" value="<% out.print(customer.getCuitCustomer()); %>" aria-label="Cuit del cliente" aria-describedby="cuitViews" disabled/>
                        <input type="hidden" name="cuitCustomer" class="form-control"  value="<% out.print(customer.getCuitCustomer()); %>" id="cuitCus"/>
                    </div>
                </div>
                <div class="col-8">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="companyName">Nombre fiscal</span>
                        <input type="text" name="companyName" class="form-control" value="<%= information.getCompanyName() %>" aria-label="Nombre fiscal de la empresa" aria-describedby="companyName" disabled/>
                    </div>
                </div>
            </section>
            <h4>Datos de la direcci�n fiscal de empresa</h4>
            <section class="row">
                <div class="col-3">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="country">Pa�s</span>
                        <input type="text" name="country" class="form-control" value="<% out.print(information.getCountry()); %>" aria-label="Pa�s" aria-describedby="country"/>
                    </div>
                </div>
                <div class="col-4">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="city">Ciudad</span>
                        <input type="text" name="city" class="form-control" value="<% out.print(information.getCity()); %>" aria-label="Ciudad" aria-describedby="city"/>
                    </div>
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="direction">Direcci�n</span>
                        <input type="text" name="direction" class="form-control" value="<% out.print(information.getDirection()); %>" aria-label="Direcci�n"/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col-7">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="phone">Tel�fono fijo</span>
                        <input type="number" name="phone" class="form-control" value="<% out.print(information.getPhone()); %>" aria-label="T�lefono de contacto en la empresa" aria-describedby="phone"/>
                    </div>    
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="postalCode">C�digo Postal</span>
                        <input type="number" name="postalCode" class="form-control" value="<% out.print(information.getPostalCode()); %>" aria-label="C�digo Postal" aria-describedby="postalCode"/>
                    </div>
                </div>
            </section>
            <h4>Datos de la representaci�n de la empresa y sus datos en la aplicaci�n</h4>
            <section class="row">
                <h5>Persona contacto</h5>
                <div class="col-7">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="namesRepre">Apellidos y Nombres</span>
                        <input type="text" name="namesRepre" class="form-control" value="<%= user.getNamesRepre() %>" aria-label="Apellidos y Nombres" aria-describedby="namesRepre" disabled/>
                    </div>
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="celular">Telef�no m�vil</span>
                        <input type="number" name="celular" class="form-control" value="<%= user.getCelular() %>" aria-label="celular" aria-describedby="celular" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="email">Correo eletr�nico</span>
                        <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>" aria-label="Correo electr�nico" aria-describedby="email" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-success">Guardar cambios</button>
                    </div>
                </div>
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" formaction="/Login/custInfor" class="btn btn-warning" id="borrado">Descartar cambios</button>
                    </div>
                </div>
            </section>

        </div>
        <!-- fin de contenedor formulario -->
    </form>
    <%
        } else {
    %>
    <h1 class="m-5 text-danger" >Debes estar logeado para acceder a esta p�gina</h1>
    <script>
      setTimeout( () => window.location.href= "/Views/login",1500);  
    </script>
    <a href="/Views/login" class="text-primary"> Volver al login</a>
    <%
        }
    %> 

<%@include file="/WEB-INF/facelets/templates/partialApp/footerApp.jsp" %>