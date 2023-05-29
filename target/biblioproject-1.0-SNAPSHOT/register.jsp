<%-- 
    Document   : register
    Created on : 24-may-2023, 21:26:12
    Author     : BRAYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.0/normalize.css" />
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>

        <main class="p-4 d-flex flex-column align-items-center">
            <div class="card" style="width: 40vw;">
                <div class="card-body">
                    <h3 class="text-center">Registrarse</h3>
                    <form class="pb-4" action="Controlador2">  
                        Nombre de Usuario: <br>
                        <input class="form-control" type="text" name="txtnom"><br>

                        Correo: <br>
                        <input class="form-control" type="email" name="txtCorreo"><br>

                        
                        Password: <br>
                        <input class="form-control" type="password" name="txtPass"><br>
                        
                        <input class="btn btn-primary bottom-right" type="submit" name="accion" value="Agregar">
                        <a href="index.jsp">Regresar</a>
                        </form>
                </div>
               
                        <c:if test="${message != null}">
                            <div class="alert alert-danger text-center">
                                ${message}
                            </div>
                        </c:if>
                    </div>
               
        </main>
              
    </body>
</html>
