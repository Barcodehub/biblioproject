<%-- 
    Document   : index
    Created on : 19-may-2023, 14:00:16
    Author     : BRAYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Login and register</title>
      <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.0/normalize.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
     <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    
    
    
    
  <div class="container col-lg-3">
      <form action="Controlador">
                <div class="form-group text-center">
                    <img src="img/UFPS-logo.png" height="80" width="80"/>
                    <p><strong>Bienvenidos, por favor Inicia Sesion</strong> </p>
                </div>

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

           <input class="btn btn-primary bottom-right btn-block" type="submit" name="accion" value="Ingresar">
           
           <a class="btn btn-danger btn-block" href="register.jsp">Registrarse</a>
                
               
            </form>
        </div>

    
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>