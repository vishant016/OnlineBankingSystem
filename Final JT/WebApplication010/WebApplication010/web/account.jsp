<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="g.GetCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : balance
    Created on : 4 Mar, 2020, 11:14:00 AM
    Author     : vishant
--%>



<!DOCTYPE html>
<html>
    <head>
    <a href="start.jsp">Home</a>
      
        <%
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

        <title>Account page</title>
    </head>
    <body>
        
        <%
            if(session.getAttribute("admin") == null){
            if (session.getAttribute("name") == null )  {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <%
            }
            }else{
                %>
                        <jsp:forward page="start.jsp"></jsp:forward>
                <%
            }
            
        %>
<!--        <div class="header">
            
        </div>-->
        <%
            Connection con = GetCon.getCon();
            String usrname = (String) session.getAttribute("name");
            String uname = null;
            String name = null;
            int accno = 0;
            String cifs = null;
            String phne = null;
            String emails = null;
            String balance = null;
            String address = null;
            PreparedStatement ps1;
            try {
                ps1 = con.prepareStatement("select * from bank where username=?");
                ps1.setString(1, usrname);
                ResultSet rs = ps1.executeQuery();
                while (rs.next()) {
                    accno = rs.getInt(1);
                    uname = rs.getString(2);
                    phne = rs.getString(4);
                    emails = rs.getString(5);
                    cifs = rs.getString(6);
                    balance = rs.getString(8);
                    address = rs.getString(10);
                    name = rs.getString(9);
                }

            } catch (SQLException e) {
                System.out.println("vishant");
            }
        %>

        <div class="card">
                  <h1 align="center"><font>Account Info</font></h1>
            <table  border=0 align="center" style="background-color:ffeeff;">
            

                <tr>
                    <td>UserName: </td>
                    <td><%=uname%></td>
                </tr><br>
                <tr>
                    <td>Name: </td>
                    <td><%=name%></td>
                </tr><br>
                <tr>
                    <td>Account No: </td>
                    <td><%=accno%></td>
                </tr><br>
                <tr>
                    <td>Cif No: </td>
                    <td><%=cifs%></td>
                </tr><br>
                <tr>
                    <td>Email: </td>
                    <td><%=emails%></td>
                </tr><br>
                <tr>
                    <td>Phone No: </td>
                    <td><%=phne%></td>
                </tr><br>
                <tr>
                    <td>Address: </td>
                    <td><%=address%></td>
                </tr><br>
                <tr>
                    <td>Balance: </td>
                    <td><%=balance%></td>
                </tr><br>
            </table>

        </div>
    </body>
</html>
