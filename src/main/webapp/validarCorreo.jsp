<%-- 
    Document   : validarCorreo
    Created on : 27-may-2023, 14:17:52
    Author     : BRAYAN
--%>

<%@page import="modelo.Persona"%>
<%@page import="modeloDAO.PersonaDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.0/normalize.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
     <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        
        
          
          
        
<!--        //-->
<div class="container col-lg-3">
    <h1>Reestablecer Contraseña</h1>
        <form action="Controlador">
        <div class="form-group">
                    <label>Escribe el Correo asociado a tu Cuenta: </label>
                    <input class="form-control" type="email" name="txtCorreo" placeholder="example@gmail.com">
                </div>
                
            <div class="form-group">
                    <label>New Password: </label>
                    <input class="form-control" type="password" name="txtPass1" placeholder="Ingrese Contraseña">
                </div>
            <div class="form-group">
                    <label>Confirma la New Password: </label>
                    <input class="form-control" type="password" name="txtPass2" placeholder="Ingrese Contraseña">
                </div>
            
            <input class="btn btn-primary bottom-right btn-block" type="submit" name="accion" value="ValidarCorreo">
            
            
            
            
<!--            if comparar BD
if ambas passwords iguales
            if numeros aleatorio env al correo con el num escrito por el usuari-->
        </form>
        </div>
        
         <%
                Conexion con = new Conexion();
                Statement smt;
                ResultSet rs;
                smt = con.getConnection().createStatement();
                rs = smt.executeQuery("select * from libro");

                //recorrer hasta el id de ese correo
//          if(p.getId()){
//          
//             }

//             PersonaDAO dao=new PersonaDAO();
//              int id=Integer.parseInt((String)request.getAttribute("idper"));
//              Persona p=(Persona)dao.list(id);
             



            %>
        
        
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
