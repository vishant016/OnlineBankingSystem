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
            if (session.getAttribute("name") == null) {
        %>
        <jsp:forward page="login.jsp"></jsp:forward>
        <%
            }
        %>

        <div class="card">
            <h1 align="center"><font>Transaction Info</font></h1>
            <table  border=0 align="center" style="background-color:ffeeff;">
                <tr>
                    <th>
                        Id:
                    </th>
                    <th>
                        Accountno:
                    </th>
                    <th>
                        Target AccountNo:
                    </th>
                    <th>
                        Deposit:
                    </th>
                    <th>
                        Withdrawal:
                    </th>
                    <th>
                        Date:
                    </th>
                </tr>
                <%
                    Connection con = GetCon.getCon();
                   
                   String accno1 = (String)session.getAttribute("accno");
                   System.out.println(accno1);
                   int accno=Integer.parseInt(accno1);
                   int taccno=0;
                    int i = 1;
                    int deposit=0,withdrawal=0;
                    String usrname=(String)request.getAttribute("name");
                    java.sql.Date date;
                    PreparedStatement ps2;
               

                    try{       ps2 = con.prepareStatement("select * from transaction where accountno=?");
                            ps2.setInt(1,accno);
                            ResultSet rs1 = ps2.executeQuery();
                            while (rs1.next()) {
                                accno = rs1.getInt(2);
                                System.out.println(accno);
                                 taccno = rs1.getInt(3);
                               deposit = rs1.getInt(4);
                                 withdrawal= rs1.getInt(5);
                        date = rs1.getDate(6);
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=accno%></td> 

                    <td><%=taccno%></td>
                    <td><%=deposit%></td>
                    <td><%=withdrawal%></td>
                    <td><%=date%></td>
                </tr><br>
                <%
                            i++;
                        }

                    }
                catch (SQLException e) {
                        System.out.println("vishant");
                    }

                %>        




            </table>

        </div>
    </body>
</html>
