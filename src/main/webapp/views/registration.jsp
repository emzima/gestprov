<%-- 
    Document   : registration
    Created on : 10 dic. 2021, 18:27:04
    Author     : gerencia
session.setAttribute("isMessRegistered", true);
--%>

<%@include file="/WEB-INF/facelets/templates/partial/header.jsp" %>
<main class="container2" id="main-body">
    <form method="POST" action="/Customer/register" class="registro" name="registro"  id="regsitro">
        <!--inicio de contenedor formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">ALTA DE CLIENTE</h3>
                <!-- <h4>Formulario del cliente</h4> -->
                <p style="text-align: justify; font-size: 11px; color:gray">Estos datos son muy importantes, pueden servir de mecanismo de verificaci�n de usuario.<br/>
                Como son en representaci�n del cliente tenga muy en cuenta la informaci�n aca suministrada.<br/>
                Recuerde que los datos, a excepci�n  del cuit, son de la persona contacto.<br/>
                Pres�ntelos de forma que pueda recordarlos ya que ser�n ser usados como mecanismo de verificaci�n oportunamente.<br/>
                <sup style="color:red; font-weight: bolder">*</sup> �ESTOS CAMPOS SON OBLIGATORIOS!
                </p>
            </article>
<% 
    boolean isMessNoRegistered = (boolean) session.getAttribute("isMessNoRegistered");
    
    if (isMessNoRegistered){
%>
             <div class="alert alert-danger alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><i class="bi bi-x-circle" style="width:24px; height:24px; font-weight: bolder; color: #DC3545"></i>
                   No es posible realizar este registro para ese CUIT, ya que tiene un usuario asignado.</br>
                En unos segundos ser� redirigido a la pantalla para recuperar su clave si no la recuerda.</br>
                Si desea hacerlo m�s tarde, debe dirigirse al ingreso de usuario y luego a recuperar su contrase�a.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                    setTimeout( () => window.location.href= "/Views/recovery",8000);
            </script>
<%
    session.setAttribute("isMessNoRegistered",false);}
    boolean isMessRegistered = (boolean) session.getAttribute("isMessRegistered");


    if (isMessRegistered){
%>
            <div class="alert alert-success alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><i class="bi bi-check-circle" style="width:24px; height:24px; font-weight: bolder; color: #198754"></i>
                    Ha sido realizado el alta de cliente con �xito. Debe confirmar el correo electr�nio.</br>
                    Por favor, revise su cuenta de correo para continuar.</br>
                    En unos segundos ser� redirigido a la pantalla inicio.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                setTimeout( () => window.location.href= "../index.jsp",8000);  
            </script>
<%
    session.setAttribute("isMessRegistered",false);}
%>

            <section class="row">
                <p style="text-align: center">Datos del cliente</p>
                <div class="col">
                    <div class="form-floating">
                        <input type="number" name="cuitCustomer" class="form-control" placeholder="Cuit del cliente" aria-label="Cuit del cliente" id="cuitCustomer" required/>
                        <label for="cuitCustomer">Cuit de la empresa<sup style="color:red; font-weight: bolder">*</sup></label>
                        <p style="font-size: 11px; color:gray">CUIT DE LA EMPRESA NO DEL CONTACTO</p>
                        <span class="error" aria-live="polite" style="color: red"></span>
                    </div>
                </div>
                <div class="col">
                    <div class="form-floating">
                        <input type="email" name="email" class="form-control" placeholder="Correo elect�nico" aria-label="Correo electr�nico" id="correo" required minlength="8"/>
                        <label for="email">Correo electr�nico<sup style="color:red; font-weight: bolder">*</sup></label>
                        <p style="font-size: 11px; color:gray">MINIMO REQUERIDO 8 CARACTERES</p>
                        <span class="error" aria-live="polite" style= "color: red"></span>
                    </div>
                </div>
            </section>
            <section class="row">
                <p style="text-align: center">Datos de la persona contacto</p>
                <div class="col">
                    <div class="form-floating">
                        <input type="text" name="namesRepre" class="form-control" placeholder="Apellidos y Nombres" aria-label="Apellidos y Nombres" id="namesRepre" required="required"/>
                        <label for="namesRepre">Apellidos y nombres<sup style="color:red; font-weight: bolder">*</sup></label>
                        <p style="font-size: 11px; color:gray">SE ACONSEJA QUE SEA COMO EST� EN EL DNI DEL CONTACTO</p>
                        <span class="error" aria-live="polite" style= "color: red"></span>
                    </div>
                </div>
                <div class="col">
                    <div class="form-floating">
                        <input type="tel" name="celular" class="form-control" placeholder="Tel�fono celular" aria-label="Tel�fono celular" id="celular" required="required"/>
                        <label for="celular">Tel�fono celular<sup style="color:red; font-weight: bolder">*</sup></label>
                        <p style="font-size: 11px; color:gray">C�DIGO DE �REA Y N�MERO SIN ESPACIOS EJEM 91112345678</p>
                        <span class="error" aria-live="polite" style="color: red"></span>
                    </div>
                </div>
            </section>
<%
    boolean isMessNoRepeteadPass = (boolean) session.getAttribute("isMessNoRepeteadPass");
    
    if (isMessNoRepeteadPass){
%>
             <div class="alert alert-warning alert-dimissible fade show d-flex justify-content-around" role="alert">
                <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                    No es posible realizar este registro porque las contrase�as deben coincidir.</br></div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
<%
    session.setAttribute("isMessNoRepeteadPass", false);}
%>
            <section class="row">
                <p style="text-align: center">Contrase�a de la cuenta</p>
                <div class="col-5">
                    <div class="form-floating">
                        <input type="password" name="password" class="form-control" placeholder="Contrase�a" aria-label="Contrase�a" id="password" required="required" minlength="8"/>
                        <label for="password">Contrase�a<sup style="color:red; font-weight: bolder">*</sup></label>
                        <span class="error" aria-live="polite" style="color: red"></span>
                    </div>
                </div>
                <div id="validate" class="col-2" style="text-align: center">
                    <i class="bi bi-x-circle" style="font-size: 20px;color: #DC3545"></i>
                    <div id="ariaLabel" class="error" aria-live="polite" style="color: #DC3545; font-size: 12px">No v�lidas</div>
                </div>
<!--                <div id="validate" class="col-2" style="text-align: center" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" style="color: red" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                        <div class="error" aria-live="polite" style="color: red; font-size: 12px">No v�lidas</div>
                </div>-->
                <div class="col-5">
                    <div class="form-floating">
                        <input type="password" name="passwordAgain" class="form-control" placeholder="Repita la Contrase�a" aria-label="Repita la Contrase�a" id="passwordAgain"  minlength="8"/>
                        <label for="passwordAgain">Repita la contrase�a<sup style="color:red; font-weight: bolder">*</sup></label>
                        <span class="error" aria-live="polite" style= "color: red"></span>
                    </div>
                </div>
            </section>
            <section class="row">
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="reset" class="btn btn-danger" id="borrado">Borrar</button>
                    </div>
                </div>
                <div class="col">
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary" id="enviar">Enviar alta de cliente</button>
                    </div>
                </div>
            </section>
        </div>
        <!-- fin de contenedor formulario -->
    </form>
</main>
<%@include file="/WEB-INF/facelets/templates/partial/footer.jsp" %>