<%-- 
    Document   : csesion
    Created on : 26/06/2020, 09:32:15 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            HttpSession sesion=request.getSession();
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        
        %>
    </body>
</html>
