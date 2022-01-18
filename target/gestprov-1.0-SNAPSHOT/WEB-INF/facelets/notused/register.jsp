<%-- 
    Document   : registrationCostumer
    Created on : 8 dic. 2021, 21:11:10
    Author     : gerencia
--%>

<%@page import="model.SendMail"%>
<%@page import="database.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/facelets/templates/partial/header.jsp" %>
<main class="container text-center">
        <h1 class="m-5 text-success" >Respecto al registro de su cuenta</h1>
        <h2 class="text-dark"> Le informamos que...
    <%  
        
        boolean validate = (boolean) session.getAttribute("validation");
        
        if (!validate) {
            session.invalidate();
    %>  
        Falta confirmar el correo.
        Revise su cuenta de correo para continuar.</h2>
        <script>
            setTimeout( () => window.location.href= "../index.jsp",1500);  
        </script>
        <a href="../index.jsp" class="text-primary">Volver al menu principal</a>
    <%
        } else {
                session.invalidate();
    %>
        <h1 class="m-5 text-danger" >Ya existe una cuenta para ese cliente, el registro actual no se ha realizado</h1>
        <p>Debe dirigirse al ingreso de usuario y recuperar su clave si no la recuerda.</p>
        <script>
            setTimeout( () => window.location.href= "/Views/login",1500);  
        </script>
        <a href="../index.jsp" class="text-primary">Volver al menu principal</a>
    <%
        }
        
    %> 
</main>
<%@include file="/WEB-INF/facelets/templates/partial/footer.jsp" %>
