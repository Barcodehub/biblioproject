<%-- 
    Document   : listarLibro
    Created on : 19-may-2023, 21:19:35
    Author     : BRAYAN
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Config.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Libro"%>
<%@page import="modeloDAO.LibroDAO"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.0/normalize.css" />
        <link rel="stylesheet" href="../css/style_index_barra_busqueda.css" />
        <link rel="stylesheet" href="../css/index_barra_busqueda.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    </head>
    <body>


        <header>
            <div class="header-content">
                <div class="logo">
                    <a href="../Principal.jsp">
                        <h1>Biblioteca<b>UFPS</b></h1>
                    </a>
                </div>

                <div class="menu" id="show-menu">
                    <nav>
                        <ul>
                            <li><a href="mis_reservas.jsp">
                                    <i class="fas fa-home"></i> Mis Reservas</a>

                            </li>
                            <li>
                                <a href="#">
                                    <i class="fas fa-home"></i> Consultar Libro</a>
                            </li>
                            <li><a href="registerBook.jsp">
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


            </div>

            <div id="icon-menu">
                <i class="fas fa-bars"></i>
            </div>
        </header>



        <!--Portada-->

        <div class="container-all" id="move-content">
            <div class="blog-container-cover">
                <div class="container-info-cover">
                    <h1>Prestacion de Libros</h1>
                    <p>
                        Descubre que libros deseas rentar y pide la autorizaci?n a la
                        biblioteca UFPS
                    </p>
                </div>
            </div>
        </div>






        <div class="container">
            <h1>Buscar Libros</h1>
            <%
                Conexion con = new Conexion();
                Statement smt;
                ResultSet rs;
                smt = con.getConnection().createStatement();
                rs = smt.executeQuery("select * from libro");

            %>
            <br>



            <div class="container buscar">
                <!--                method="POST"-->
                <form class="form">
                    <input class="" type="text" name="txtbuscar" >
                    <br><br>
                    <select name="search-select">
                        <option value="titulo">Buscar por Titulo</option>
                        <option value="autor">Buscar por Autor</option>
                        <option value="codigo">Buscar por Codigo</option>
                    </select>
                    <input class="btn-success" type="submit" value="Cargar Lista" >

                </form> 
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">TITULO</th>
                            <th class="text-center">AUTOR</th>
                            <th class="text-center">CODIGO</th>
                            <th class="text-center">FECHA</th>
                        </tr>
                    </thead>






                    <%  
                        String selectedValue = request.getParameter("search-select");
                        String opcion = "";

                        String liste = request.getParameter("liste");
                        System.out.println("liste es: " + liste);

                        String nombuscar = request.getParameter("txtbuscar");
                        if (nombuscar != null) {
                            smt = con.getConnection().createStatement();
                            rs = smt.executeQuery("select * from libro where Titulo LIKE" + "'%" + nombuscar + "%'");

                            LibroDAO dao = new LibroDAO();
                            List<Libro> list = dao.listar();
                            Iterator<Libro> iter = list.iterator();
                            Libro lib = null;

                            while (iter.hasNext()) {
                                lib = iter.next();

                                if ("titulo".equalsIgnoreCase(selectedValue)) {
                                    opcion = lib.getTitulo().toLowerCase();
                                } else if ("autor".equalsIgnoreCase(selectedValue)) {
                                    opcion = lib.getAutor().toLowerCase();
                                } else if ("codigo".equalsIgnoreCase(selectedValue)) {
                                    opcion = lib.getCodigo().toLowerCase();
                                }
                                String palabra = nombuscar.toLowerCase();

                                boolean contieneSubcadenas = true;
                                for (int i = 1; i <= palabra.length(); i++) {
                                    String subcadena = palabra.substring(0, i);
                                    if (!opcion.startsWith(subcadena)) {
                                        contieneSubcadenas = false;
                                        break;
                                    }
                                }

                                if (contieneSubcadenas) {
                    %>
                    <tbody>
                        <tr>
                            <td class="text-center"><%= lib.getId()%></td>
                            <td class="text-center"><%= lib.getTitulo()%></td>
                            <td class="text-center"><%= lib.getAutor()%></td>
                            <td class="text-center"><%= lib.getCodigo()%></td>
                            <td><%= lib.getFecha()%></td>
                        </tr>
                    </tbody>
                    <%
                                }

                            }

                        } else {
                            System.err.println("Error nada");
                        }
                    %>

            </table>

            </div>
            <div class="container-footer">
                <footer class="footer">
                    <h4>Copyright © 2023 - Developed by Brayan Barco, 
                        Sergio Delgado, Kevin Caballero 
                        - Programa de Ingeniería de Sistemas 
                        - UFPS - Todos los Derechos Reservados</h4>
                    
                </footer>
            </div>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            <script src="js/script_barra_busqueda.js"></script>
    </body>
</html>
