<%-- 
    Document   : custInfFirtsTime
    Created on : 5 ene. 2022, 09:53:52
    Author     : gerencia
<%= cuitNum %>,  <%= phone %>, <%= direction %>,<%= postalCode %>, <%= city %>, <%= country %>, <%= typeCust %>
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
                <h3 style="text-align: center">DATOS COMPLETOS DEL CLIENTE</h3>
                <h4 style="text-align: center">Información de la empresa</h4>
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
                User user = (User) session.getAttribute("user");
                
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
                <div class="col-7">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="namesCust">Nombre de usuario (fantasia)<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="text" name="namesCust" class="form-control" placeholder="Escriba..." aria-label="Nombre de usario de la empresa" aria-describedby="namesCust" required/>
                    </div>
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="typeCust">Tipo de servicio<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input list="datalistOptions" name="typeCust" class="form-control" placeholder="Seleccione..." aria-label="Escriba el tipo de servicio" aria-describedby="typeCust" required/>
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
                        <span class="input-group-text" id="cuitCus">Cuit</span>
                        <input type="number" name="cuitCus" class="form-control" value="<%= customer.getCuitCustomer() %>" aria-label="Cuit del cliente" aria-describedby="cuitCus" disabled/>
                    </div>
                </div>
                <div class="col-8">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="companyName">Nombre fiscal<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="text" name="companyName" class="form-control" placeholder="Escriba..." aria-label="Escriba el nombre fiscal" aria-describedby="companyName" required/>
                    </div>
                </div>
            </section>
            <h4>Datos de la dirección fiscal de empresa en sede principal</h4>
            <section class="row">
                <div class="col-3">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="country">País<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="text" name="country" class="form-control" placeholder="Escriba..." aria-label="Escriba el país" aria-describedby="country" required/>
                    </div>
                </div>
                <div class="col-4">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="city">Ciudad<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="text" name="city" class="form-control" placeholder="Escriba..." aria-label="Escriba la ciudad" aria-describedby="city" required/>
                    </div>
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="direction">Dirección<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="text" name="direction" class="form-control" placeholder="Indique Calle y Número" aria-label="Escriba la dirección (calle Número)" aria-describedby="direction" required/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col-7">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="phone">Teléfono fijo<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="number" name="phone" class="form-control" placeholder="Escriba..." aria-label="Escriba un teléfono fijo" aria-describedby="phone" required/>
                    </div>    
                </div>
                <div class="col-5">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="postalCode">Código postal<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="number" name="postalCode" class="form-control" placeholder="Escriba..." aria-label="Escriba el código postal" aria-describedby="postalCode" required/>
                    </div>
                </div>
            </section>
            <h4>Datos de la representación de la empresa y sus datos en la aplicación</h4>
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
                        <span class="input-group-text" id="celular">Telefóno móvil</span>
                        <input type="number" name="celular" class="form-control" value="<%= user.getCelular() %>" aria-label="celular" aria-describedby="celular" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="email">Correo eletrónico</span>
                        <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>" aria-label="Correo electrónico" aria-describedby="email" disabled/>
                    </div>
                </div>
            </section>
            <h4>Datos respecto a las condiciones ante el IVA e Ingresos y otros</h4>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="statusIVA">Situación ante el IVA<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input list="datalistStatusIva" name="statusIVA" class="form-control" placeholder="Escriba la situación ante el IVA" aria-label="Situación ante el IVA" aria-describedby="statusIVA" required/>
                        <datalist id="datalistStatusIva">
                            <option value="1 IVA Responsable Inscripto">
                            <option value="2 IVA Responsable no Inscripto">
                            <option value="3 IVA no Responsable">
                            <option value="4 IVA Sujeto Exento">
                            <option value="5 Consumidor Final">
                            <option value="6 Responsable Monotributo">
                            <option value="7 Sujeto no Categorizado">
                            <option value="8 Proveedor del Exterior">
                            <option value="9 Cliente del Exterior">
                            <option value="10 IVA Liberado - Ley N° 19.640">
                            <option value="11 IVA Responsable Inscripto -Agente de Percepción">
                            <option value="12 Pequeño Contribuyente Eventual">
                            <option value="13 Monotributista Social">
                            <option value="14 Pequeño Contribuyente Eventual Social">
                        </datalist>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="statusIncome">Condición frente a retenciones<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="text" name="statusING" class="form-control" placeholder="Escriba la condición frente a retenciones" aria-label="Condición frente a retenciones" aria-describedby="statusING" required/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="typeActivity">Tipo de actividad<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="text" name="typeActivity" class="form-control" placeholder="Escriba el tipo de actividad" aria-label="Tipo de actividad" aria-describedby="typeActivity" required/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="dateStart">Fecha de inicio de actividad<sup style="color:red; font-weight: bolder">*</sup></span>
                        <input type="date" name="dateStart" style="color:grey;" class="form-control" placeholder="Escriba la fecha de inicio de actividad" aria-label="Fecha de inicio de actividad" aria-describedby="dateStart" required/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="form-floating">
                        <textarea name="descriptionActivity" class="form-control" style="height:150px" placeholder="Descripción de la actividad de la empresa" aria-label="Descripción de la actividad" aria-describedby="descriptionActivity" required></textarea>
                        <label for="typeActivity">Descripción de la actividad<sup style="color:red; font-weight: bolder">*</sup></label>
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