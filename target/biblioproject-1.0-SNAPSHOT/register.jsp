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
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
     <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>

        <main class="p-4 d-flex flex-column align-items-center">
            <div class="card" style="width: 40vw;">
                <div class="card-body">
                    <h3 class="text-center">Registrarse</h3>
                    <form class="pb-4" action="Controlador2">  
                        Nombres: <br>
                        <input class="form-control" type="text" name="txtnom"><br>

                        Correo: <br>
                        <input class="form-control" type="text" name="txtCorreo"><br>

                        
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
                            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
