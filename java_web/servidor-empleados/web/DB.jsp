<%-- 
    Document   : Datos
    Created on : 29/06/2020, 07:52:15 PM
    Author     : javie
--%>

<%@page import="java.sql.*"%>
<%@page import=" com.mysql.jdbc.Driver"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Agregando los estilos de Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!--  Agregando los botones  de la pagina https://fontawesome.com/icons-->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueo") == null || sesion.getAttribute("logueo").equals("0")) {
                response.sendRedirect("login.jsp");
            }
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

        %>
        <div class="container ">
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand">Base de Usuarios</a>
                <form class="form-inline" action="csesion.jsp">
                    <a href="DatosUsuario.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>
                        <%=sesion.getAttribute("nombre")%></a>
                    <button class="btn btn-primary my-2 my-sm-0 ml-3" type="submit">Cerrar sesion</button>
                </form>
            </nav>
            <div class="row mt-2">
                <div class="col-sm">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4">Empleados</th>
                                <th scope="col" colspan="4">
                                <a href="agregar.jsp"> <i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </th>            
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Acciones</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3308/empleados","root","");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM ejemplo;");
                                while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td>
                                    <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%=rs.getString(2)%>&direccion=<%=rs.getString(3)%>&telefono=<%=rs.getString(4)%> "> <i class="fa fa-edit" aria-hidden="true"></i></a>
                                    <a href="eliminar.jsp?id=<%= rs.getString(1)%>" class="ml-1"><i class="fa fa-user-times" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            <%
                                }
                                  } catch (Exception e) {
                                      out.print(e);
                                    }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>