<%-- 
    Document   : logout
    Created on : Jun 23, 2016, 2:48:59 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session!=null){
        session.invalidate();
        response.sendRedirect("login.jsp");
        }
            %>
    </body>
</html>
