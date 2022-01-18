<%-- 
    Document   : inforAddiitonal
    Created on : 13 ene. 2022, 09:48:45
    Author     : gerencia
<%= cuit %>,  <%= phone %>, <%= direction %>,<%= postalCode %>, <%= city %>, <%= country %>, <%= typeCust %>
--%>

<%@page import="model.User"%>
<%@page import="database.AccountDAO"%>
<%@page import="model.Information"%>
<%@page import="model.Customer"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main>
    <form method="POST" action="/Login/additionalEdit">
        <!--inicio de contenedor formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">Información de la empresa</h3>
                <h4 style="text-align: center">Datos respecto a las condiciones ante el IVA e Ingresos y otros</h4>
            </article>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2" style="width: 100%">
                        <button type="submit" class="btn btn-primary">Editar datos respecto a las condiciones ante el IVA e Ingresos y otros</button>    
                    </div>
                </div>
            </section>
            <%  

            boolean isLogged = (boolean) session.getAttribute("isLogin");

            if (isLogged) {
                AccountDAO AccountDB = new AccountDAO();
                Customer customer = (Customer) session.getAttribute("customer");
                User user = (User) session.getAttribute("user");
                Information information = (Information) session.getAttribute("information");
                
                boolean isMessRegisteredOk = (boolean) session.getAttribute("isMessRegisteredOk");
    
                if (isMessRegisteredOk){
//                    String cuit = (String) session.getAttribute("cuit");
//                    String phone = (String) session.getAttribute("phone");
//                    String direction = (String) session.getAttribute("direction");
//                    String postalCode = (String) session.getAttribute("postalCode");
//                    String city = (String) session.getAttribute("city");
//                    String country = (String) session.getAttribute("country");
//                    String typeCust = (String) session.getAttribute("typeCust");
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
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="statusIVA">Situación ante el IVA</span>
                        <input list="datalistStatusIva" name="statusIVA" style="background-color: #ffffff;" class="form-control" value="<%= information.getStatusIVA() %>" aria-label="Situación ante el IVA" aria-describedby="statusIVA" disabled/>
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
                        <span class="input-group-text" id="statusIncome">Condición frente a retenciones</span>
                        <input type="text" name="statusING" style="background-color: #ffffff;" class="form-control" value="<%= information.getStatusIncome() %>" aria-label="Condición frente a retenciones" aria-describedby="statusING" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="typeActivity">Tipo de actividad</span>
                        <input type="text" name="typeActivity" style="background-color: #ffffff;" class="form-control" value="<%= information.getTypeActivity() %>" aria-label="Tipo de actividad" aria-describedby="typeActivity" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="dateStart">Fecha de inicio de actividad</span>
                        <input type="date" name="dateStart" style="background-color: #ffffff;" class="form-control" value="<%= information.getDateStart() %>" aria-label="Fecha de inicio de actividad" aria-describedby="dateStart" disabled/>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="form-floating">
                        <textarea name="descriptionActivity" class="form-control" style="background-color: #ffffff; height:150px" aria-label="Descripción de la actividad" aria-describedby="descriptionActivity" disabled><%= information.getDescriptionActivity() %></textarea>
                        <label for="typeActivity">Descripción de la actividad</label>
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
