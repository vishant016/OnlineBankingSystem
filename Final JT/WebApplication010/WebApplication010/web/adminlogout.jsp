<%-- 
    Document   : logout
    Created on : 1 Mar, 2020, 10:58:18 AM
    Author     : vishant
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
         <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout Page</title>
    </head>
    <body>
        <%
            if (session.getAttribute("admin") == null) {
        %>
                <jsp:forward page="adminv.jsp"></jsp:forward>
        <%
            } 
        %>


        <%
            
            session = request.getSession(false);
            session.invalidate();
         %>

        <h2><font color="green">Hi You are log out</font></h2>
        <jsp:include page="start.jsp"></jsp:include>
            </body>
</html>
