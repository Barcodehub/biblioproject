<%-- 
    Document   : listarLibro
    Created on : 19-may-2023, 21:19:35
    Author     : BRAYAN
--%>


<%@page import="Config.Conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
          <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      
    </head>
    <body>
        <div class="container">
            <h1>Libros</h1>
            
             <div class="container buscar">
             
               <form class="form">
                      
           <a class="btn btn-success" href="/biblioproject/vistas/addLibro.jsp">Agregar Nuevo</a>
            </form> 
               
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
                        <td><%= lib.getFecha()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="../ControladorLibro?accion=editar&id=<%= lib.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="../ControladorLibro?accion=eliminar&id=<%= lib.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
