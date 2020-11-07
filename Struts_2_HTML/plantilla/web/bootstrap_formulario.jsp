<%-- 
    Document   : bootstrap_fromulario
    Created on : 14/06/2020, 09:19:20 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Agregando los estilos de Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>


        <div class="container mt-5">  
            <div class="row" >
                <div class="col-sm">


                    <h1>Este es un Fomulario implementando Bootstrap y Java!</h1>

                    <form action="bootstrap_fromulario.jsp" method="get">
                        <div class="form-group">
                            <label>Escribe tu Nombre</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label>Escribe tu Edad</label>
                            <input type="text" class="form-control" name="edad" placeholder="Edad">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>  
            </div>
            <div class="row"> 
                <div class="col-sm">
                    <div class="alert alert-primary" role="alert">
                        <%
                            String nombre=request.getParameter("nombre");
                            String edad=request.getParameter("edad");
                            String saludo="bienvenido "+nombre+" tienes "+edad;
                            if(nombre!=null && edad!=null)
                            {
                             int Edad= Integer.parseInt(edad);
                             if(Edad<18){
                               out.println("Usted es menor de edad");
                             }
                             else{
                               out.println("Usted es mayor de edad");
                             }
                                
                             out.println(saludo);
                            }
                            else
                            {
                             out.println("Ingresa tus datos");

                            }


                        %>
                    </div>
                </div>
            </div>




        </div>

    </body>
</html>
