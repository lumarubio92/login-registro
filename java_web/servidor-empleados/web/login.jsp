<%-- 
    Document   : login
    Created on : 23/06/2020, 08:01:26 PM
    Author     : javie
--%>
<%@page import="librerias.encriptar" %>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!--  Agregando los botones  de la pagina https://fontawesome.com/icons-->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="text-center">Bienvenido</h1>
        <div class="container">

            <div class="row">
                <div class="col-sm">

                    <form method="post" action="login.jsp" >
                        <div class="form-group col-4">
                            <label>Nombre de usuario</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Escribe tu usuario">
                        </div>
                        <div class="form-group col-4">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="password"   placeholder="Escribe tu contraseña">
                        </div>
                        <div class="form-group form-check">
                        </div>
                        <button type="submit" class="btn btn-primary ml-3" name="login" >Entrar</button>
                        <a class="btn btn-danger">Registrarse</a>
                    </form>
                    <%

                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        encriptar enc=new encriptar();
                        if (request.getParameter("login") != null) {
                            String nombre = request.getParameter("nombre");
                            String password = request.getParameter("password");
                            HttpSession sesion = request.getSession();
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3308/empleados", "root", "");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT *FROM usuarios where nombre='" + nombre + "' and contraseña='" + enc.getMD5(password) + "';");

                                while (rs.next()) {
                                    sesion.setAttribute("logueo", "1");
                                    sesion.setAttribute("nombre", rs.getString("nombre"));
                                    sesion.setAttribute("id", rs.getString("id"));
                                    response.sendRedirect("DB.jsp");
                                }
                                out.print("<div class=\"alert alert-primary\" role=\"alert\">Usuario no valido</div>");
                            } catch (Exception e) {
                            }

                        }

                        /*
       if (request.getParameter("login") != null) {
           String nombre = request.getParameter("nombre");
           String password = request.getParameter("password");
           HttpSession sesion = request.getSession();
           if (nombre.equals("admin") && password.equals("admin")) {
               sesion.setAttribute("logueo", "1");
               sesion.setAttribute("nombre", nombre);
               response.sendRedirect("DB.jsp");
           } else {
               out.print("Usuario no encontrado intente de nuevo");
           }
       }
                         */

                    %>

                </div>
            </div>
        </div>

    </body>

</html>

