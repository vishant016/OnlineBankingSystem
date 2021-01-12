<%-- 
    Document   : request
    Created on : 7 Mar, 2020, 12:48:10 AM
    Author     : vishant
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="g.GetCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request</title>
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
            int accno = 0;
            String rrequest ="none";
            java.sql.Date date1 = null;
            Connection con = GetCon.getCon();
            String usrname = (String) session.getAttribute("name");
            int i = 0;
            PreparedStatement ps1;
            PreparedStatement ps2;
            try {
                ps1 = con.prepareStatement("select * from bank where username=?");
                ps1.setString(1, usrname);
                ResultSet rs = ps1.executeQuery();
                while (rs.next()) {
                    accno = rs.getInt(1);
                }
                ps2 = con.prepareStatement("select * from requests where accountno=? and request=?");
                ps2.setInt(1, accno);
                ps2.setString(2, "passbook");
                ResultSet rs1 = ps2.executeQuery();
                while (rs1.next()) {
                    rrequest = rs1.getString(3);
                    date1 = rs1.getDate(4);
                }
            } catch (SQLException e) {
                System.out.println("vishant");
            }
        %>
        <%
            if (rrequest.equals("passbook")) {
                if (g.date.Date1(date1).compareTo(new java.sql.Date(System.currentTimeMillis())) < 0) {
                  
                    try {

                        ps2 = con.prepareStatement("insert into requests(accountno,request,date) values(?,?,?)");
                        ps2.setInt(1, accno);
                        ps2.setString(2, "passbook");
                        ps2.setDate(3, new java.sql.Date(System.currentTimeMillis()));
                        i = ps2.executeUpdate();
                        if (i > 0) {
                            out.println("<h1><font color=green>Request for passbook done</font></h1>");
        %>
        <jsp:include page="feature.jsp"></jsp:include>
        <%
                }

            } catch (SQLException e) {
                System.out.println("vishant");
            }
        } else {
                    String date2 =  g.date.Date2(date1);
            out.println("<h3><font color=red>You can request for passbook at"+" "+date2+"</font></h3>");
          %>
          
           
        <jsp:include page="feature.jsp"></jsp:include>
        <%
            }
        } else {
            try {

                ps2 = con.prepareStatement("insert into requests(accountno,request,date) values(?,?,?)");
                ps2.setInt(1, accno);
                ps2.setString(2, "passbook");
                ps2.setDate(3, new java.sql.Date(System.currentTimeMillis()));
                i = ps2.executeUpdate();
                if (i > 0) {
                    out.println("<h1><font color=green>Request for passbook done</font></h1>");
        %>
        <jsp:include page="feature.jsp"></jsp:include>
        <%
                    }

                } catch (SQLException e) {
                    System.out.println("vishant");
                }
            }
        %>

    </body>

</html>
