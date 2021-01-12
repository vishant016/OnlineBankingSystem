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
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout Page</title>
    </head>
    <body>
        <%
            if (session.getAttribute("name") == null) {
        %>
                <jsp:forward page="login.jsp"></jsp:forward>
        <%
            } 
        %>


        <%
            
            String user = (String) session.getAttribute("name");
            session.invalidate();
         %>

      
        
        <%
            ServletContext ctx = getServletContext();
            int t = (Integer) ctx.getAttribute("totalusers");
            int c = (Integer) ctx.getAttribute("currentusers");
        %>
          <h3><font color="green">Hi <%=user%> You are log out</font></h3>
        <jsp:include page="start.jsp"></jsp:include>
        <center>
            <p> no. of total login user<%= t%></p><br>
            <p> no. of current login user<%= c%></p>
        </center>
    </body>
</html>
