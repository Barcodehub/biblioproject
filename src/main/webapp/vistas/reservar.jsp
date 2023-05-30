<%-- 
    Document   : reservar
    Created on : 29-may-2023, 18:16:43
    Author     : BRAYAN
--%>

<%@page import="modelo.Libro"%>
<%@page import="modeloDAO.LibroDAO"%>
<%@page import="modelo.Persona"%>
<%@page import="modeloDAO.PersonaDAO"%>
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
          
          <%
//              PersonaDAO dao2=new PersonaDAO();
//              int id2=Integer.parseInt((String)request.getAttribute("idper"));
//              Persona p2=(Persona)dao2.list(id2);
          %>
          
          
            <%
              if(p.disponiblebook(p.getCopias(), p.getPrestados())>0){
              
              System.out.println(p.getPrestados());
              p.reservarbook(p.getPrestados());
              System.out.println(p.getPrestados());
              
              
                }else{
                System.out.println("NO HAY DISPONIBILIDAD DEL LIBRO");
                }
          %>
          
          
            <h1>Reservar Libro</h1>
            <form action="ControladorLibro">
              
              <div class="form-group">
                    <label>Email:</label>
                    <input class="form-control" type="email" name="txtCorreo" placeholder="example@gmail.com">
                </div>
                
                <div class="form-group">
                    <label>Password:</label>
                    <input class="form-control" type="password" name="txtPass" placeholder="Ingrese Contraseña">
                </div>
                
                <div class="form-group">
                    <label>Nombre de Usuario:</label>
                    <input class="form-control" type="text" name="txtnom" placeholder="Ingrese Nombres">
                </div>
                
                    
                    Fecha: <br>
                    <input class="form-control" type="date" name="txtfecha" value="<%= p.getFecha()%>"><br>
                    
                    
                
                <input type="hidden" name="txtid" value="<%= p.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="reservar1"> 
                <a href="/biblioproject/vistas/listarLibro.jsp">Regresar</a>
            </form>
          </div>
          
        </div>
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
