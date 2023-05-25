<%-- 
    Document   : addLibro
    Created on : 19-may-2023, 21:19:20
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
                <h1>Agregar Libro</h1>
                <form action="ControladorLibro">                  
                    Titulo <br>
                    <input class="form-control" type="text" name="texttitulo"><br>
                    
                    Autor: <br>
                    <input class="form-control" type="text" name="textautor"><br>
                    
                    Codigo: <br>
                    <input class="form-control" type="text" name="textcodigo"><br>
                    
                    Fecha: <br>
                    <input class="form-control" type="date" name="txtPass"><br>
                    
                    
                    
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorLibro?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
