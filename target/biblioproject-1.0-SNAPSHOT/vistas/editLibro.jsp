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
          <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      
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
            <form action="ControladorLibro">
              
                  Titulo <br>
                    <input class="form-control" type="text" name="txttitulo" value="<%= p.getTitulo()%>"><br>
                    
                    Autor: <br>
                    <input class="form-control" type="text" name="txtautor" value="<%= p.getAutor()%>"><br>
                    
                    Codigo: <br>
                    <input class="form-control" type="text" name="txtcodigo" value="<%= p.getCodigo()%>"><br>
                    
                    Fecha: <br>
                    <input class="form-control" type="date" name="txtfecha" value="<%= p.getFecha()%>"><br>
                
                
                
                <input type="hidden" name="txtid" value="<%= p.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="/biblioproject/vistas/listarLibro.jsp">Regresar</a>
            </form>
          </div>
          
        </div>
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
