<%-- 
    Document   : allrequest
    Created on : 7 Mar, 2020, 5:14:11 PM
    Author     : vishant
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="g.GetCon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
        %>
         <style>
            .card {
  background-color: white;
  padding: 0px;
  margin-top: 0px;
}
           table{
                border-collapse: collapse;
                width: 50%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {background-color: #f2f2f2;}
            .header {
                padding: 0px;
                text-align: center;
                body {
                    font-family: Arial;
                    padding: 0px;
                    background: #f1f1f1;
                }

            }
            h1 {
                text-shadow: 2px 2px #FF0000;
            }</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Allrequest</title>
    </head>
    <body>
            <%
            if (session.getAttribute("admin") == null) {
        %>
        <jsp:forward page="adminv.jsp"></jsp:forward>
        <%
            }
        %>

         <div class="card">
                  <h1 align="center"><font>Requests Info</font></h1>
            <table  border=0 align="center" style="background-color:ffeeff;">
                <tr>
                    <th>
                        Id:
                    </th>
                    <th>
                        Accountno:
                    </th>
                    <th>
                        Request:
                    </th>
                    <th>
                        Date:
                    </th>
                </tr>
        <%
            Connection con = GetCon.getCon();
              PreparedStatement ps1;
              int accno=0;
              int i=1;
              String rrequest="none";
              java.sql.Date date;
              try{
                  ps1=con.prepareStatement("select * from requests");
                   ResultSet rs = ps1.executeQuery();
                while (rs.next()) {
                    accno = rs.getInt(2);
         rrequest=rs.getString(3);
            date=rs.getDate(4);%>
            <tr>
                <td><%=i%></td>
                        
                    <td><%=accno%></td> 
                
                    <td><%=rrequest%></td>
                    <td><%=date%></td>
            </tr><br>
                    <%
                     i++;
                }
                
              }catch (SQLException e) 
              {
                System.out.println("vishant");
            }
            
%>        
            

                
              
            </table>

        </div>
    </body>
</html>
