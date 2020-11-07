<%-- 
    Document   : DatosUsuario
    Created on : 27/06/2020, 01:40:08 PM
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!--  Agregando los botones  de la pagina https://fontawesome.com/icons-->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
            <link rel="stylesheet" href="CSS/estilousuarios.css">

        <title>Datos del Usuario</title>
    </head>
  <body>

        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueo") == null || sesion.getAttribute("logueo").equals("0")) {
                response.sendRedirect("login.jsp");
            }
            Connection con = null;
            Statement st = null;
            encriptar enc=new encriptar();
        %>
        <div class="container">
            <div class="row">
                <div class="col-sm" >
                    <h1>Datos Usuario</h1>
                    <form method="get" action="DatosUsuario.jsp">
                        <div class="form-group ">
                            <label>Nombre de Usuario</label>
                            <input type="text" class="form-control" name="nombre" value="<%= sesion.getAttribute("nombre")  %>" placeholder="Escribe un Nombre de Usuario" >
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="password" placeholder="Escribe una contraseña" >
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="password2" placeholder="Repite la contraseña" >
                        </div>
                        <button type="submit" class="btn btn-primary" name="guardar">Guardar</button>
                        <a href="DB.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                </div>
            </div>
        </div>  
    </body>
   <%    
       if (request.getParameter("guardar")!=null) {
                String nombre = request.getParameter("nombre");
                String password = request.getParameter("password");
                String password2 = request.getParameter("password2");
                if (password.equals(password2)) {
                        try {
                               Class.forName("com.mysql.jdbc.Driver");
                               con = DriverManager.getConnection("jdbc:mysql://localhost:3308/empleados", "root", "");
                               st = con.createStatement();
                               st.executeUpdate("UPDATE usuarios "
                                       + "SET nombre='"+nombre+"',contraseña='"+enc.getMD5(password)+"' "
                                       + "where id='"+sesion.getAttribute("id")+"';");
                               sesion.setAttribute("nombre",nombre);
                               response.sendRedirect("DB.jsp");
                            } catch (Exception e) {
                                out.print(e);
                            }
                    } else {
                            out.print("contraseña invalida");
                    }   
           }
             
    %>
</html>

