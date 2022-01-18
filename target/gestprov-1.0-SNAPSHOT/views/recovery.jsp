<%-- 
    Document   : recover
    Created on : 10 dic. 2021, 22:09:30
    Author     : gerencia
--%>

<%@include file="/WEB-INF/facelets/templates/partial/header.jsp" %>
<main class="container" id="main-body">
    <form method="POST" action="/Customer/recover" class="ingreso" id="ingreso">
        <!--inicio de contenedor 2 formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">RECUPERACIÓN DE ACCESO AL SISTEMA</h3>
                <h4 style="text-align: center">Bienvenido al sistema</h4>
            </article>
<% 
    boolean isMessNoRecovered = (boolean) session.getAttribute("isMessNoRecovered");
    
    if (isMessNoRecovered){
%>
             <div class="alert alert-danger alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><i class="bi bi-x-circle" style="width:24px; height:24px; font-weight: bolder; color: #DC3545"></i>
                Hay inconsistencia entre los datos que están en nuestras cuentas y los aportados.</br>
                Nos comunicameremos con ud. oportunamente para resolver el problema.</br>
                Será redirigido en 3 segundos a la página de inicio.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                setTimeout( () => window.location.href= "../index.jsp",6000);
            </script>
<%
    session.setAttribute("isMessNoRecovered",false);}
    boolean isMessRecovered = (boolean) session.getAttribute("isMessRecovered");

    if (isMessRecovered){
%>
            <div class="alert alert-success d-flex justify-content-between" role="alert">
                <div><i class="bi bi-check-circle" style="width:24px; height:24px; font-weight: bolder; color: #198754"></i>
                Ha sido realizada la consulta. Debes confirmar el correo electrónio.</br>
                Por favor, debes revisar su cuenta de correo para continuar.</br>
                Será redirigido en 3 segundos a la página de inicio.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                setTimeout( () => window.location.href= "../index.jsp",6000);
            </script>
<%
    session.setAttribute("isMessRecovered",false);}
%>
            <section class="row">
                <div class="col">
                    <div class="form-floating">
                        <input type="number" name="cuitCustomer" class="form-control" placeholder="Ingrese el cuit de la empresa" aria-label="Cuit de la empresa" id="cuitCustomer" required="required"/>
                        <label for="cuitCustomer">Cuit de la empresa que representa</label>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="form-floating">
                        <input type="email" name="email" class="form-control" placeholder="Ingrese el correo electrónico de registro original" aria-label="Correo electrónico de registro original" id="email" required="required"/>
                        <label for="email">Correo electrónico de registro original</label>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary" id="recuperar">Enviar solicitud de recuperación</button>
                    </div>
                </div>
            </section>           
        </div>
        <!-- fin de contenedor 4 formulario -->
    </form>
</main>
<%@include file="/WEB-INF/facelets/templates/partial/footer.jsp" %>