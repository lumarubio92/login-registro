<%-- 
    Document   : usuarios
    Created on : 30/06/2020, 08:36:07 PM
    Author     : javie
--%>
<%@page import="librerias.encriptar" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Agregando los estilos de Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!--  Agregando los botones  de la pagina https://fontawesome.com/icons-->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
            <link rel="stylesheet" href="CSS/estilousuarios.css">

        <title>Registro</title>
    </head>
  <body>
        <%
            
            Connection con = null;
            Statement st = null;
            encriptar enc=new encriptar();
        %>
        <div class="container ">
            <div class="row">
                <div class="col-sm"> 
                            <h1>Registro</h1>

                            <form action="usuarios.jsp" method="get">
                        <div class="form-group ">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" >
                        </div>
                      <div class="form-group ">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="password" placeholder="Escribe una contraseña" >
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="password2" placeholder="Escribe nuevamente la contraseña" >
                        </div>
                        
                                <button type="submit" name="enviar" class="btn btn-primary">Registrarse</button>
                    </form>

                </div>
            </div>
        </div>
    <%    
       if (request.getParameter("enviar")!=null) {
                String nombre = request.getParameter("nombre");
                String password = request.getParameter("password");
                String password2 = request.getParameter("password2");
                if (password.equals(password2)) {
                        try {
                               Class.forName("com.mysql.jdbc.Driver");
                               con = DriverManager.getConnection("jdbc:mysql://localhost:3308/empleados", "root", "");
                               st = con.createStatement();
                               st.executeUpdate("INSERT INTO usuarios (nombre,contraseña) VALUES ('" +nombre+ "','" +enc.getMD5(password)+ "')");
                               response.sendRedirect("login.jsp");
                            } catch (Exception e) {
                                out.print(e);
                            }
                    } else {
                            out.print("contraseña invalida");
                    }   
           }
             
    %>
    </body>
</html>

