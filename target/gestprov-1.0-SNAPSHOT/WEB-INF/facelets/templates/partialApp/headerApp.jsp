<%-- 
    Document   : header
    Created on : 10 dic. 2021, 09:21:42
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
                    <a href="/Login/zone" class="align-items-center mb-2 mb-md-0 me-md-auto text-dark text-decoration-none" id="img">
                        <img src="../../../public/img/metacodo1.png" alt= "imagen" class="bi me-2" width="100" height="50"/>
                        <span class="fs-4">Gestión eficiente</span>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarText">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a href="/Login/generate" class="nav-link">Generar<Br/>Factura</a>
                            </li>
                            <li class="nav-item">
                                <a href="/Login/custInfor" class="nav-link">Datos<Br/>Cliente</a>
                            </li>
                            <li class="nav-item">
                                <a href="/Login/zone" class="nav-link">Vista<Br/>Principal</a>
                            </li>
                            <li class="nav-item">
                                <a href="/Login/logout" class="nav-link">Salir</a>
                            </li>
<!--                            <li class="nav-item">
                                <a href="#" class="nav-link disabled">link 5</a>
                            </li>-->
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- fin del encabezado -->
