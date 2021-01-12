<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
        %>
   
        <style>
            .header {
  padding: 0px;
  text-align: center;
  body {
  font-family: Arial;
  padding: 0px;
  background: #f1f1f1;
}
 
}
        </style>
    </head>
    <body>
         <%
            if (session.getAttribute("admin") == null) {
        %>
        <jsp:forward page="home.jsp"></jsp:forward>
        <%
            }
        %>
        <br><br><br>
        <div class="header">


            <h2 align="center"><font color="green">Admin section</font></h2>
        </div>
        <div class="body">
            <form action="adminlogout.jsp">
                <table border=0 width="300px" align="center" style="background-color:ffeeff;">
                  
                    <tr><td align="center"> 
                            <a href="saveuser.jsp">Add user</a><br><br>
                        </td></tr><br><br>
                    <tr><td align="right"> 
                            &nbsp;
                        </td></tr>
                    <tr><td align="center"> 
                            <a href="allrequest.jsp">Requests</a><br><br>
                        </td></tr>
                    <tr><td align="center"> 
                            &nbsp;
                        </td></tr>
                    <tr><td align="center"> 
                            <a href="viewaccount.jsp">View Accountdetail</a><br><br>
                        </td></tr>
                    <tr><td align="center"> 
                            &nbsp;
                        </td></tr>
                    <tr>
                        <td>
                            <input type="submit" value="Log out" name="logout">
                        </td>
                    </tr>
                </table>
            </form>

        </div>
    </body>
</html>


