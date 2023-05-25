<%-- 
    Document   : add
    Created on : 19-may-2023, 14:15:17
    Author     : BRAYAN
--%>

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
                <h1>Agregar Persona</h1>
                <form action="/Controlador2">                  
                    Nombres: <br>
                    <input class="form-control" type="text" name="txtnom"><br>
                    
                    Correo: <br>
                    <input class="form-control" type="text" name="txtCorreo"><br>
                    
                    Password: <br>
                    <input class="form-control" type="text" name="txtPass"><br>
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="Controlador2?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
