<%-- 
    Document   : custinformation
    Created on : 14 dic. 2021, 09:00:28
    Author     : gerencia
<%= cuitCustomer %>,  <%= phone %>, <%= direction %>,<%= postalCode %>, <%= city %>, <%= country %>, <%= typeCustomer %>, <%= email %>
--%>

<%@page import="model.User"%>
<%@page import="database.AccountDAO"%>
<%@page import="model.Information"%>
<%@page import="model.Customer"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main>
    <form method="POST" action="/Login/inforEdit">
        <!--inicio de contenedor formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">DATOS DEL CLIENTE</h3>
                <h4 style="text-align: center">Información de la empresa</h4>
            </article>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2" style="width: 100%">
                        <button type="submit" class="btn btn-primary">Editar información de la empresa</button>
                    </div>
                </div>
            </section>
            <%  

            boolean isLogged = (boolean) session.getAttribute("isLogin");

            if (isLogged) {
                AccountDAO AccountDB = new AccountDAO();
                Customer customer = (Customer) session.getAttribute("customer");
                User user = (User) session.getAttribute("user");
               
                Information information = AccountDB.getInformationByEmail(user.getEmail());
                session.setAttribute("information",information);
               
                boolean isMessRegisteredOk = (boolean) session.getAttribute("isMessRegisteredOk");    
                if (isMessRegisteredOk){
//                    String cuitCustomer = (String) session.getAttribute("cuitCustomer");
//                    String phone = (String) session.getAttribute("phone");
//                    String direction = (String) session.getAttribute("direction");
//                    String postalCode = (String) session.getAttribute("postalCode");
//                    String city = (String) session.getAttribute("city");
//                    String country = (String) session.getAttribute("country");
//                    String typeCustomer = (String) session.getAttribute("typeCustomer");
//                    String email = (String) session.getAttribute("email");
%>
        <div class="container">
            <div class="alert alert-success alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </symbol></svg>
                    Ha sido realizado con éxito el registro.</br>
                    <!--En unos segundos será redirigido a la pantalla inicio.-->
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
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="namesCust">Nombre de usario</span>
                        <input type="text" name="namesCust" class="form-control" value="<%= information.getNamesCust() %>" aria-label="Nombre de usario de la empresa" aria-describedby="namesCust" style="background-color: white" disabled/>
                    </div>
                </div>
                <div class="col-7">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="typeCust">Tipo de servicio</span>
                        <input type="text" name="typeCust" class="form-control" value="<%= customer.getTypeCustomer() %>" aria-label="Tipo de servicio que desea recibir o prestar" aria-describedby="typeCust" style="background-color: white" disabled/>
                    </div>
                </div>
            </section>
            <h4>Datos fiscales de la empresa</h4>
            <section class="row">
                <div class="col-4">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="cuitCus">Cuit</span>
                        <input type="number" name="cuitCus" class="form-control" value="<%= customer.getCuitCustomer() %>" aria-label="Cuit del cliente" aria-describedby="cuitCus" style="background-color: white" disabled/>
                    </div>
                </div>
                <div class="col-8">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="companyName">Nombre fiscal</span>
                        <input type="text" name="companyName" class="form-control" value="<%= information.getCompanyName() %>" aria-label="Nombre fiscal de la empresa" aria-describedby="companyName" style="background-color: white" disabled/>
                    </div>
                </div>
            </section>
            <h4>Datos de la dirección fiscal de empresa</h4>
            <section class="row">
                <div class="col-3">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="country">País</span>
                        <input type="text" name="country" class="form-control" value="<%= information.getCountry() %>" aria-label="País" aria-describedby="country" style="background-color: white" disabled/>
                    </div>
                </div>
                <div class="col-4">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="city">Ciudad</span>
                        <input type="text" name="city" class="form-control" value="<%= information.getCity() %>" aria-label="Ciudad" aria-describedby="city" style="background-color: white" disabled/>
                    </div>
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="direction">Dirección</span>
                        <input type="text" name="direction" class="form-control" value="<%= information.getDirection() %>" aria-label="Dirección" aria-describedby="direction" style="background-color: white" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col-7">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="phone">Teléfono fijo</span>
                        <input type="number" name="phone" class="form-control" value="<%= information.getPhone() %>" aria-label="Télefono de contacto en la empresa" aria-describedby="phone" style="background-color: white" disabled/>
                    </div>    
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="postalCode">Código Postal</span>
                        <input type="number" name="postalCode" class="form-control" value="<%= information.getPostalCode() %>" aria-label="Código Postal" aria-describedby="postalCode" style="background-color: white" disabled/>
                    </div>
                </div>
            </section>
            <h4>Datos de la representación de la empresa y sus datos en la aplicación</h4>
            <section class="row">
                <div class="col-8" style="text-align: right">
                    <h5>Persona contacto</h5>
                </div>
                <div class="col-4">
                    <div class="d-grid gap-2" style="width: 100%">
                        <button type="button" class="btn btn-primary" disabled>Añadir</button>    
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col-7">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="namesRepre">Apellidos y Nombres</span>
                        <input type="text" name="namesRepre" class="form-control" value="<%= user.getNamesRepre() %>" aria-label="Apellidos y Nombres" aria-describedby="namesRepre" style="background-color: white" disabled/>
                    </div>
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="celular">Telefóno móvil</span>
                        <input type="number" name="celular" class="form-control" value="<%= user.getCelular() %>" aria-label="celular" aria-describedby="celular" style="background-color: white" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="email">Correo eletrónico</span>
                        <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>" aria-label="Correo electrónico" aria-describedby="email" style="background-color: white" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2" style="width: 100%">
                        <button type="submit" formaction="/Login/inforAdditional" class="btn btn-success">Ver condiciones ante el IVA e Ingresos y otros</button>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2" style="width: 100%">
                        <button type="submit" formaction="/Login/inforAdditional" class="btn btn-danger" disabled>Dar de baja el servicio</button>
                    </div>
                </div>
            </section>
        </div>
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