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
        <link href="../css/csscrud/bootstrap.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div class="container">
            <h1>Libros</h1>
             <%
               Conexion con=new Conexion();
                Statement smt;
                ResultSet rs;
                  smt = con.getConnection().createStatement();
                  rs = smt.executeQuery("select * from libro");
                  
                  %>
            <br>
            
            
            
            <div class="container buscar">
                
               <form class="form">
                <input class="" type="text" name="txtbuscar" >
                <input class="btn btn" type="submit" name="Buscar" >
            </form> 
                
              <%
                  String nombuscar=request.getParameter("txtbuscar");
                  if(nombuscar != null){
                  smt = con.getConnection().createStatement();
                  rs = smt.executeQuery("select * from libro where Titulo LIKE" + "'%"+nombuscar+"%'");
                  }else{
                  System.err.println("Error");
                  }
                  %>
                
                
                
                
            </div>
            
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">TITULO</th>
                        <th class="text-center">AUTOR</th>
                        <th class="text-center">CODIGO</th>
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
                        <td><%= lib.getCodigo()%></td>
                        
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
