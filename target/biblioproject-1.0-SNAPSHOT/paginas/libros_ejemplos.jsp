<%-- 
    Document   : libros_ejemplos
    Created on : 19-may-2023, 14:04:39
    Author     : BRAYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diseño web tipo blog - para practica</title>

        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="../css/index_barra_busqueda.css">
        <link rel="stylesheet" href="../css/style_index_barra_busqueda.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    </head>

    <body>

        <!--Header - menu-->
        <header>

            <div class="header-content">

                <div class="logo">
                    <a href="../index.jsp">
                        <h1>Biblioteca<b>UFPS</b></h1>
                    </a>
                </div>

                <div class="menu" id="show-menu">

                    <nav>
                        <ul>
                            <li><a href="/paginas/mis_reservas.jsp">
                                    <i class="fas fa-home"></i> Mis Reservas</a>
                            </li>
                            <li><a href="/index_barraBusqueda.jsp"> <i class="fas fa-home"></i> Consultar Libro</a></li>
                            <li><a href="/paginas/registerBook.jsp">
                                    <i class="fas fa-heart"></i> Registrar Libro</a>
                            </li>
                            
                            <li>
                            <div class="dropdown">
                                <a style="color: gray" href="#" class="dropdown-toggle" data-toggle="dropdown">Cerrar Session </a>

                                <div class="dropdown-menu text-center">
                                    <a><img src="../img/R.png" height="80" width="80"/> </a><br>
                                    <a>${nom}</a>
                                    <a>${correo}</a>
                                    <div class="dropdown-divider"></div>
                                    <a href="../Controlador?accion=Salir" class="dropdown-item">Salir</a>
                                </div>
                            </div>
                        </li>
                        </ul>
                    </nav>

                </div>

                <div id="ctn-icon-search">
                    <i class="fas fa-search" id="icon-search"></i>
                </div>

            </div>

            <div id="icon-menu">
                <i class="fas fa-bars"></i>
            </div>

        </header>

        <!--Portada-->

        <div class="container-all" id="move-content">


            <div class="article-container-cover">
                <div class="container-info-cover">

                </div>
            </div>

            <div class="container-content">
                <article>

                    <h1>Titulo del Libro de Ejemplo</h1>

                    <p>Titulo del libro de ejemplo que se quiere rentar/alquilar</p>

                    <h1>Información del Libro de Ejemplo</h1>

                    <p>Información sobre el libro de ejemplo que se quiere rentar/alquilar</p>
                    <img src="/img/img2.jpg" alt="">
                    <button class="btn" type="button" onclick="toAlert()">Reservar</button>

                </article>


            </div>

            <div class="container-footer">

                <footer>
                    <h4>Brayan Alexander Barco Cardenas - Todos los Derechos Reservados</h4>
                    <h4>Kevin Arturo Caballero Cano - Todos los Derechos Reservados</h4>
                    <h4>Sergio Andres Delgado Barrera - Todos los Derechos Reservados</h4>
                </footer>

            </div>

        </div>


        <script src="../js/script_barra_busqueda.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>

</html>