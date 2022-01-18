<%-- 
    Document   : recovery
    Created on : 10 dic. 2021, 22:19:58
    Author     : gerencia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/facelets/templates/partial/header.jsp" %>
<main class="container text-center">
    <h1 class="m-5 text-success" >Respecto a la recuperación de su cuenta</h1>
    <h2 class="text-dark"> Le informamos que...
        <%

            boolean exists = (boolean) session.getAttribute("validation");

            if (!exists) {

        %>  
        Falta confirmar el correo.
        Revise su cuenta de correo para continuar.</h2>
        <script>
            setTimeout( () => window.location.href= "../index.jsp",1500);  
        </script>
    <a href="../index.jsp" class="text-primary">Volver al menu principal</a>
    <%    } else {
    %>
    <h1 class="m-5 text-danger" >Hay incosistencia entre los datos que estan en nuestras cuentas y sus datos</h1>
    <p>Nos comunicameremos con ud oportunamente para resolver el problema</p>
        <script>
            setTimeout( () => window.location.href= "../index.jsp",1500);  
        </script>
    <a href="../index.jsp" class="text-primary">Volver al menu principal</a>
    <%
        }
    %> 
</main>
<%@include file="/WEB-INF/facelets/templates/partial/footer.jsp" %>
