<%-- 
    Document   : mis_reservas
    Created on : 19-may-2023, 14:05:37
    Author     : BRAYAN
--%>
<%@page import="modeloDAO.ReservaDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Config.Conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.LibroDAO"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.Reserva"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<jsp:useBean id="ldao" class="modeloDAO.LibroDAO" scope="session"/>
<jsp:useBean id="dao" class="modeloDAO.ReservaDao" scope="session"/>
<%
    if(request.getParameter("idLibro")!=null){
        String idLibro = request.getParameter("idLibro");
        String idUsuario = request.getParameter("idUsuario");
        
        Reserva rvCancel=new Reserva();
        
        rvCancel.setLibroId(Integer.parseInt(idLibro));
        rvCancel.setUsuarioId(Integer.parseInt(idUsuario));
        
        dao.cancelarReserva(rvCancel);
    }    
%>
=======

>>>>>>> 71914fdcdb623ad45d763052510f37ff723fe4f5
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca-UFPS</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <script src="../js/script_reserva.js"></script>

        <link rel="stylesheet" href="../css/style_index_barra_busqueda.css">
        <link rel="stylesheet" href="../css/index_barra_busqueda.css">
        <link rel="stylesheet" href="../css/reservas.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    </head>

    <body>
        <!--Header - menu-->
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
                            <li><a href="#">
                                    <i class="fas fa-home"></i> Mis Reservas</a>
                            </li>
                            <li><a href="ConsultarLibro.jsp">
                                    <i class="fas fa-home"></i> Consultar Libro</a>
                            </li>
                            <li><a href="../paginas/registerBook.jsp">
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
<<<<<<< HEAD
            <div class="list">
                <strong>Mis libros reservados</strong>
                <%ArrayList<Reserva> rvList = dao.listarReserva(session.getAttribute("correo").toString());%>
                <ol class="alternating-colors" id="list">
                    <%for (Reserva rv : rvList) {
                            Libro lb = ldao.list(rv.getLibroId());%>
=======
        </div>





           <br>
            <br>

       

              <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">TITULO</th>
                        <th class="text-center">AUTOR</th>
                        <th class="text-center">CODIGO</th>
                        <th class="text-center">FECHA</th>
                        <th class="text-center">DISPONIBLES</th>
                    </tr>
                </thead>
                <%
                    LibroDAO dao=new LibroDAO();
                    List<Libro>list=dao.listar();
                    Iterator<Libro>iter=list.iterator();
                    Libro lib=null;
                    while(iter.hasNext()){
                        lib=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= lib.getId()%></td>
                        <td class="text-center"><%= lib.getTitulo()%></td>
                        <td class="text-center"><%= lib.getAutor()%></td>
                        <td class="text-center"><%= lib.getCodigo()%></td>
                        <td class="text-center"><%= lib.getFecha()%></td>
                        <td class="text-center"><%= lib.disponiblebook(lib.getCopias(), lib.getPrestados())%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="../ControladorLibro?accion=reservar&id=<%= lib.getId()%>">Reservar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            
            
            
            <%
    
    ReservaDao daoR=new ReservaDao();
    
    if(request.getParameter("idLibro")!=null){
        String idLibro = request.getParameter("idLibro");
        String idUsuario = request.getParameter("idUsuario");
        
        Reserva rvCancel=new Reserva();
        
        rvCancel.setLibroId(Integer.parseInt(idLibro));
        rvCancel.setUsuarioId(Integer.parseInt(idUsuario));
        
        daoR.cancelarReserva(rvCancel);
        
        lib.cancelarreservarbook(lib.getPrestados());
        
    }    
%>
            
         <div class="list">
                <strong>Mis libros reservados</strong>
                <%ArrayList<Reserva> rvList = daoR.listarReserva(session.getAttribute("correo").toString());%>
                <ol class="alternating-colors" id="list">
                    <%for (Reserva rv : rvList) {
                            Libro lb = dao.list(rv.getLibroId());%>
>>>>>>> 71914fdcdb623ad45d763052510f37ff723fe4f5
                    <li><div class="row">
                            <div class="column1">
                                <strong><%= lb.getTitulo()%></strong>
                                <p>Autor: <%= lb.getAutor()%><br>Fecha de Vencimiento: <%= rv.getFechaLimite().toString()%></p>
                            </div>
                            <div class="column2">
                                <form id="reservasForm" name="reservasForm" action="mis_reservas.jsp" method="post">
                                    <input type="hidden" value="<%=rv.getLibroId()%>" id="idLibro" name="idLibro">
                                    <input type="hidden" value="<%=rv.getUsuarioId()%>" id="idUsuario" name="idUsuario">
                                    <input type="submit" value="Cancelar" class="btnx">
                                </form>
                            </div>
                        </div>
                    </li>
                    <%}%>
                </ol>
            </div>   
            
            


            <div class="container-footer">

                <footer class="footer">
                    Copyright © 2023 - Developed by Brayan Barco, 
                    Sergio Delgado, Kevin Caballero 
                    - Programa de Ingeniería de Sistemas 
                    - UFPS - Todos los Derechos Reservados</h4>

                </footer>

            </div>

        

        <script src="../js/script_barra_busqueda.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>

</html>
