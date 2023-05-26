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

                <div id="ctn-icon-search">
                    <i class="fas fa-search" id="icon-search"></i>
                </div>
            </div>

            <div id="icon-menu">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <div id="ctn-bars-search">
            <input type="text" id="inputSearch" placeholder="?Qu? deseas buscar?" />
        </div>
        <div id="cover-ctn-search"></div>

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
            <h1>Libros</h1>
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
                    <input class="btn btn" type="submit" value="Buscar" >
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






                    <%                  String nombuscar = request.getParameter("txtbuscar");
                        if (nombuscar != null) {
                            smt = con.getConnection().createStatement();
                            rs = smt.executeQuery("select * from libro where Titulo LIKE" + "'%" + nombuscar + "%'");

                            LibroDAO dao = new LibroDAO();
                            List<Libro> list = dao.listar();
                            Iterator<Libro> iter = list.iterator();
                            Libro lib = null;
                            while (iter.hasNext()) {
                                lib = iter.next();

                                String titulo = lib.getTitulo().toLowerCase();
                                String palabra = nombuscar.toLowerCase();

                                boolean contieneSubcadenas = true;
                                for (int i = 1; i <= palabra.length(); i++) {
                                    String subcadena = palabra.substring(0, i);
                                    if (!titulo.startsWith(subcadena)) {
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
    </body>
</html>
