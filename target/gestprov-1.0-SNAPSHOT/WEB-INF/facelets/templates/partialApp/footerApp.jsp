<%-- 
    Document   : footer
    Created on : 10 dic. 2021, 09:22:04
    Author     : gerencia
--%>

<%@page import="model.Information"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <!-- inicio de contenedor pie de pagina -->
        <%
            Information information = (Information) session.getAttribute("information");
        %>
        <footer class="flex-wrap justify-content-around py-2 mb-2 border-bottom"> 
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container">
                    <a href="/Login/custNewInfor" class="nav-link"><span class="fs-4"> Bienvenido <%= information.getNamesCust() %> </span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-around" id="navbarText">
                        <ul class="navbar-nav me-md-center mb-2 mb-lg-0">
<!--                            <li class="nav-item">
                                <a href="${'/Login/contacts'}">${"COMO<Br/>FUNCIONA"}</a>
                            </li>-->
                            <li class="nav-item">
                                <a href="/Login/contacts" class="nav-link">Contáctenos</a>
                            </li>
<!--                            <li class="nav-item">
                                <a href="${'/Customer/contacts'}">${"QUIENES<Br/>SOMOS"}</a>
                            </li>-->
            <!--                <li class="nav-item">
                                <a href="#" class="nav-link px-2 text-start">link 3</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link px-2 text-start">link 4</a>
                            </li>-->
                        </ul>
                    </div>
                </div>
            </nav>
        </footer>
        <hr/>     
            <p class="text-center text-muted">Todos los derechos reservados &#169; by metacodo</p>
        <hr/>  
        <!-- fin de contenedor pie de pagina -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script type="text/javascript" src="../public/modalEdit.js"></script>
        <script type="text/javascript" src="../public/modalDelete.js"></script>
        <script type="text/javascript" src="../public/modalStatus.js"></script>
        <script type="text/javascript" src="../public/modalDialog.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<!--        <script>
            function nobackbutton(){
                window.location.hash="no-back-button";
                window.location.hash="Again-No-back-button";
                window.onhashchange= function(){
                    window.location.hash="no-back-button";
                };
            }
        </script>-->
        
<!--        <script src="public/main.js"></script>    -->
        
    </body>
</html>