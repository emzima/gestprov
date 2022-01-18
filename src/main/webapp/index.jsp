<%-- 
    Document   : index
    Created on : 10 dic. 2021, 09:40:51
    Author     : gerencia
    boolean isMesgLogout = (boolean) session.getAttribute("isMesgLogout");
    
--%>

<%@include file="/WEB-INF/facelets/templates/partial/header.jsp" %>
<main class="container" id="main-body">
<% 
    if (session.isNew()){
        session.setAttribute("isLogin",false);
        session.setAttribute("isMessLogout",false);
        session.setAttribute("isMesslocked", false);
        session.setAttribute("isMessRejected", false);
        session.setAttribute("isMessRegistered", false);
        session.setAttribute("isMessNoRegistered", false);
        session.setAttribute("isMessRecovered", false);
        session.setAttribute("isMessNoRecovered", false);
        session.setAttribute("isMessWithoutLogin", false);
        session.setAttribute("isMessNoRepeteadPass", false);
        session.setAttribute("attempts", 0);
    }
    
    boolean isMessLogout = (boolean) session.getAttribute("isMessLogout");
    
    if (isMessLogout){
%>

            <div class="alert alert-success d-flex justify-content-around" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </symbol></svg>
                   Has cerrado la cuenta y por eso has sido redirigido hasta esta zona</br>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
<%
    };
    
    boolean isMessWithoutLogin = (boolean) session.getAttribute("isMessWithoutLogin");

    if (isMessWithoutLogin) {
%>
            <div class="alert alert-warning d-flex justify-content-around" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg>
                   No tienes permiso de usuario, debes ingresar al sistema por el ingreso de usario</br>
                 por eso has sido redirigido hasta esta zona</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
<%
    }
%>
<h2>Bienvenido a tu aplicación de gestión</h2>
<h4 style="text-align: center">Para proveedores y prestadores</h4>
<p style="text-align: right">La gestión 4.0 para la industria del presente</p>
</main>
<%@include file="/WEB-INF/facelets/templates/partial/footer.jsp" %>
