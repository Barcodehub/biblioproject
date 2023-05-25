<%-- 
    Document   : editLibro
    Created on : 19-may-2023, 21:19:26
    Author     : BRAYAN
--%>

<%@page import="modelo.Libro"%>
<%@page import="modeloDAO.LibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/csscrud/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
              <%
              LibroDAO dao=new LibroDAO();
              int id=Integer.parseInt((String)request.getAttribute("idlib"));
              Libro p=(Libro)dao.list(id);
          %>
            <h1>Modificar Libro</h1>
            <form action="Controlador2">
                Nombres:<br>
                <input class="form-control" type="text" name="txttitulo" value="<%= p.getTitulo()%>"><br>
                Correo: <br>
                <input class="form-control" type="text" name="txtautor" value="<%= p.getAutor()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= p.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorLibro?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
