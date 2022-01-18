<%-- 
    Document   : changePassword
    Created on : 12 ene. 2022, 10:03:53
    Author     : gerencia
--%>

<%@page language= "java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset = "UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link href="../../../public/header_footer.css" rel="stylesheet"/>
        <title>
            gestionProve | Tu App, Gestion
        </title>
    </head>
    
    <body id="main-body">
        <!-- inicio del encabezado -->
        <header class="flex-wrap justify-content-center py-2 mb-2 border-bottom">
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container">
                    <a class="align-items-center mb-2 mb-md-0 me-md-auto text-dark text-decoration-none" id="img">
                        <img src="../../../public/img/metacodo1.png" alt= "imagen" class="bi me-2" width="100" height="50"/>
                        <span class="fs-4">Gestión eficiente</span>
                    </a>
                </div>
            </nav>
        </header>
        <!-- fin del encabezado -->
<main class="container" id="main-body">
    <form method="POST" action="/Customer/changePassword" class="ingreso" id="ingreso">
        <!--inicio de contenedor 2 formulario--> 
        <div class="container">
            <article class="tituloform">
                <h3 style="text-align: center">CAMBIO DE CONTRASEÑA</h3>
                <h4 style="text-align: center">Bienvenido al sistema</h4>
            </article>
<% 
    boolean isMessNoRecovered = (boolean) session.getAttribute("isMessNoRecovered");
    
    if (isMessNoRecovered){
%>
             <div class="alert alert-danger alert-dimissible fade show d-flex justify-content-between" role="alert">
                <div><i class="bi bi-x-circle" style="width:24px; height:24px; font-weight: bolder; color: #DC3545"></i>
                Hay inconsistencia entre los datos que están en nuestras cuentas y los aportados.</br>
                Nos comunicameremos con ud. oportunamente para resolver el problema.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                //setTimeout( () => window.location.href= "../index.jsp",1500);  
            </script>
<%
    session.setAttribute("isMessNoRecovered",false);}
    boolean isMessRecovered = (boolean) session.getAttribute("isMessRecovered");

    if (isMessRecovered){
%>
            <div class="alert alert-success d-flex justify-content-between" role="alert">
                <div><i class="bi bi-check-circle" style="width:24px; height:24px; font-weight: bolder; color: #198754"></i>
                Ha sido realizado el cambio de contraseña.</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <script>
                //setTimeout( () => window.location.href= "../index.jsp",7000);  
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
        </div>
            <div style="width: 85%; margin: 5% auto">
                <section class="row">
                    <div class="col-5">
                        <div class="form-floating">
                            <input type="password" name="password" class="form-control" placeholder="Contraseña" aria-label="Contraseña" id="password" required="required" minlength="8"/>
                            <label for="password">Contraseña<sup style="color:red; font-weight: bolder">*</sup></label>
                            <span class="error" aria-live="polite" style="color: red"></span>
                        </div>
                    </div>
                    <div id="validate" class="col-2" style="text-align: center">
                        <i class="bi bi-x-circle" style="font-size: 20px;color: #DC3545"></i>
                        <div id="ariaLabel" class="error" aria-live="polite" style="color: #DC3545; font-size: 12px">No válidas</div>
                    </div>
                    <div class="col-5">
                        <div class="form-floating">
                            <input type="password" name="passwordAgain" class="form-control" placeholder="Repita la Contraseña" aria-label="Repita la Contraseña" id="passwordAgain"  minlength="8"/>
                            <label for="passwordAgain">Repita la contraseña<sup style="color:red; font-weight: bolder">*</sup></label>
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
                            <button type="submit" class="btn btn-primary" id="recuperar">Enviar cambio de clave</button>
                        </div>
                    </div>
                </section>
            </div>
        <!-- fin de contenedor 4 formulario -->
    </form>
</main>
       <!-- inicio de contenedor pie de pagina"-->  
        <footer class="flex-wrap justify-content-around py-2 mb-2 border-bottom"> 
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-around" id="navbarText">
                        <ul class="navbar-nav me-md-center mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link">Alta de cliente</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">Como funciona</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">Quienes somos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">Ingreso de usuario</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </footer>
        <hr/>     
            <p class="text-center text-muted">Todos los derechos reservados &#169; by metacodo</p>
        <hr/>  
        <!-- fin de contenedor pie de pagina -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <script type="text/javascript" src="../public/validationLogin.js"></script>
    </body>
</html>
