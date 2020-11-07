<%-- 
    Document   : eliminar
    Created on : 22/06/2020, 06:28:55 PM
    Author     : javie
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
               
               String id=request.getParameter("id");
                
                
               try {
                    Connection con=null;
                    Statement st=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3308/empleados","root","");

                    st = con.createStatement();
                    st.executeUpdate("delete FROM ejemplo where id='"+id+"';");
                   // request.getRequestDispatcher("DB.jsp").forward(request, response);
                    response.sendRedirect("DB.jsp");
                    
                    } catch (Exception e) {
                        out.print(e);
                    }
        %>    
    </body>
</html>
