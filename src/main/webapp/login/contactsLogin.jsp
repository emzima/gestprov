<%-- 
    Document   : contactsLogin
    Created on : 21 dic. 2021, 20:00:40
    Author     : gerencia
--%>

<%@include file="/WEB-INF/facelets/templates/partialApp/headerApp.jsp" %>
<main class="container" id="main-body">
<%     
        
        boolean isLogged = (boolean) session.getAttribute("isLogin");

        if (isLogged) {
%>
    <h1 style="text-align: center">En construcción</h1>
    <p>Estamos del lado del usuario (logueado)</p>
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
