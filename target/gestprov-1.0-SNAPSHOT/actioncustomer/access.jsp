<%-- 
    Document   : user
    Created on : 5 dic. 2021, 16:20:14
    Author     : gerencia
--%>

<%@page import="model.User"%>
<%@page import="database.AccountDAO"%>
<%@page import="database.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>

<main class="container text-center">
<%     
        
        boolean isLogged = (boolean) session.getAttribute("isLogin");

        if (isLogged) {
            AccountDAO AccountDB = new AccountDAO();
            User user = (User) session.getAttribute("user");
            Customer customer = (Customer) session.getAttribute("customer");
            
            Information information = AccountDB.getInformationByEmail(user.getEmail());
            session.setAttribute("information",information);
            
            if(user.getEntry() == 0) {

%> 
    <h1 class="m-5 text-success" >Acceso garantizado</h1>
    <h2 class="text-dark">Bienvenido/a <%= user.getNamesRepre() %> al sistema</h2>
    <p>en nombre de la empresa <%= information.getCompanyName() %></p>
    <p class="text-dark">sabemos que es tu primera vez en el sistema</p>
    <br>
    <p>Serás redirigido para completar el formulario de datos de la empresa</p>
    
    <script>
      setTimeout( () => window.location.href= "/Login/custNewInfor",6000);
    </script>
    <p>Si desea puede</p>
    <a href="/Login/logout" class="text-primary"> Salir</a>
<%
    } else {
%> 
    <h1 class="m-5 text-success" >Acceso garantizado</h1>
    <h2 class="text-dark">Bienvenido/a <%= user.getNamesRepre() %> al sistema</h2>
    <p>en nombre de la empresa <%= information.getCompanyName() %></p>
    <p>Será redirigido a su zona de usuario</p>
    
    <script>
      setTimeout( () => window.location.href= "/Login/zone",1200);  
    </script>
    <p>Si desea puede</p>
    <a href="/Login/logout" class="text-primary"> Salir</a>
<%
    };} else { 
%>
    
    <h1 class="m-5 text-danger" >Debes estar logeado para acceder a esta página</h1>
    <script>
      setTimeout( () => window.location.href= "/Views/login",2100);
    </script>
    <a href="/Views/login" class="text-primary"> Volver al login</a>
    
<%
    }
%>
</main>
<%@include file="/WEB-INF/facelets/templates/partialApp/footerApp.jsp" %>
