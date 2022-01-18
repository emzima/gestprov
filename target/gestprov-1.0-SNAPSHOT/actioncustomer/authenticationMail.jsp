<%-- 
    Document   : authenticationMail
    Created on : 10 ene. 2022, 12:15:59
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
                    <a href="../index.jsp" class="align-items-center mb-2 mb-md-0 me-md-auto text-dark text-decoration-none" id="img">
                        <img src="../../../public/img/metacodo1.png" alt= "imagen" class="bi me-2" width="100" height="50"/>
                        <span class="fs-4">Gestión eficiente</span>
                    </a>
                </div>
            </nav>
        </header>
        <!-- fin del encabezado -->
<main class="container" id="main-body">
<%-- 
    Cookie[] cookies = request.getCookies();
    String nombre;
    for (int i = 0; i < cookies.length; i++){
        if (cookies[i].getName().equals("activated")) {
            
        }
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
--%>
<h2>Bienvenido a tu aplicación de gestión</h2>
<h4 style="text-align: center">Tu correo fue validado</h4>
<p style="text-align: right">Será cerrada la ventana en 5 segundos... gracias</p>
<script>
    setTimeout( () => window.close(),7000);
</script>
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
                                <a href="#" class="nav-link">Alta de cliente</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">Como funciona</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">Quienes somos</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">Ingreso de usuario</a>
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
    </body>
</html>