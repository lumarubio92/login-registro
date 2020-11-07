<%-- 
    Document   : DB
    Created on : 18/06/2020, 06:18:21 PM
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
                    <link rel="stylesheet" href="CSS/fondo.css">

        <title>Base de Datos</title>
    </head>
  <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueo") == null || sesion.getAttribute("logueo").equals("0")) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="container ">
            <nav class="navbar navbar-dark bg-dark">
                <a class="navbar-brand">Base de Usuarios</a>
                <form class="form-inline" action="csesion.jsp">
                    <a href="DatosUsuario.jsp"><i class="fa fa-user-circle" aria-hidden="true" ></i>
                        <%=sesion.getAttribute("nombre")%></a>
                    <button class="btn btn-primary my-2 my-sm-0 ml-3" type="submit">Cerrar sesion</button>
                </form>
            </nav>
            <div class="row mt-2">
                <div class="col-sm">
                    <form action="DB.jsp" method="GET">
                    
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col" ></th>
                                <th scope="col">
                                    <input type="text" name="nom" class="form-control" placeholder="Buscar por Nombre" />                                    
                                </th>
                                <th scope="col" class="text-left">
                                    <input type="submit" value="buscar" class="btn btn-outline-success " />
                                </th>
                                <th scope="col" ></th>
                                <th scope="col" class="text-left">
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
                            <jsp:include page="newddd"/>

                        </tbody>
                    </table>
                            </form>
                </div>
            </div>
        </div>
    </body>
</html>