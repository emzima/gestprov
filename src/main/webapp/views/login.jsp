<%-- 
    Document   : login
    Created on : 10 dic. 2021, 13:43:22
    Author     : gerencia

    
    
--%>



<%@include file="/WEB-INF/facelets/templates/partial/header.jsp" %>
<main class="container" id="main-body">
    <form method="POST" action="/Customer/access" class="ingreso" id="ingreso">
        <!--inicio de contenedor 2 formulario--> 

<% 
    boolean isMesslocked = (boolean) session.getAttribute("isMesslocked");
    
    if (isMesslocked){
%>
        <div class="container">
            <div class="alert alert-danger alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                   La clave ha sido bloqueada por el número de intentos debe recuperarla.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
            <script>
                    setTimeout( () => window.location.href= "../index.jsp",7000);
            </script>
<%
    session.setAttribute("isMesslocked",false);}
    boolean isMessRejected = (boolean) session.getAttribute("isMessRejected");

    if (isMessRejected){
    int attempts = (int) session.getAttribute("attempts");
%>
            <div class="alert alert-warning d-flex justify-content-between" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg>
                   La contraseña y/o el usuario no fueron introducidos adecuadamente.</br>
                Debe tener cuidado que luego de 3 intentos, la clave será bloqueada.</br>
                Lleva usted <% out.print(attempts); %> intento(s).</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
<%
    session.setAttribute("isMessRejected",false);}
%>
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">INGRESO DE USUARIO AL SISTEMA</h3>
                <h4 style="text-align: center">Bienvenido al sistema</h4>
            </article>
            <section class="row">
                <div class="col">
                    <p>Ingrese su usuario</p>
                    <input type="email" name="email" class="form-control" placeholder="Ingrese su Usuario" aria-label="Ingrese su usuario" id="email" minlength="8" required="required"/>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <p>Ingrese su contraseña</p>
                    <input type="password" name="password" class="form-control" placeholder="Ingrese su Contraseña" aria-label="Ingrese su contraseña" id="password" minlength="8" required="required"/>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary" id="access">Ingresar</button>
                    </div>
                </div>
            </section>
            <div>
                <span>¿Olvidaste el usuario o la contraseña? Hacé clic </span>
                <a href="/Views/recovery" class="text-primary">acá</a>
                <span>y recupera tu cuenta.</span>
            </div>            
        </div>
        <!-- fin de contenedor 4 formulario -->
    </form>
</main>
<!-- <script src="../public/validationLogin.js"></script> -->
<%@include file="/WEB-INF/facelets/templates/partial/footer.jsp" %>