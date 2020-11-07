<%-- 
    Document   : agregar
    Created on : 22/06/2020, 06:28:15 PM
    Author     : javie
--%>

<%@page import="java.sql.*"%>
<%@page import=" com.mysql.jdbc.Driver "%>
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

        <title>Agregar empleado</title>
    </head>
  <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm"> 
                            <h1>Agregar Usuario</h1>

                            <form action="agregar.jsp" method="get">
                        <div class="form-group ">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" >
                        </div>
                        <div class="form-group">
                            <label for="direccion">Direccion</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Direccion">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Telefono">
                        </div>
                        
                                <button type="submit" name="enviar" class="btn btn-primary">Guardar</button>
                    </form>

                </div>
            </div>
        </div>
        <%
            if(request.getParameter("enviar")!=null)
            {
                String nombre=request.getParameter("nombre");
                String telefono=request.getParameter("telefono");
                String direccion=request.getParameter("direccion");
                try {
                    Connection con=null;
                    Statement st=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3308/empleados","root","");

                    st = con.createStatement();
                    //st.executeUpdate("INSERT INTO ejemplo(nombre,direccion,telefono) VALUES ('" +nombre+ ",''" +direccion+ ",''" +telefono+ ",')") ;
                    st.executeUpdate("INSERT INTO ejemplo (nombre,direccion,telefono) VALUES ('" +nombre+ "','" +direccion+ "', '" +telefono+ "')");
                    //request.getRequestDispatcher("DB.jsp").forward(request, response);
                    response.sendRedirect("DB.jsp");
                    
                    } catch (Exception e) {
                        out.print(e);
                    }
            }
        


        %>

    </body>
</html>
