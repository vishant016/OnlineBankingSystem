<%-- 
    Document   : transfer1
    Created on : 5 Mar, 2020, 9:21:53 PM
    Author     : vishant
--%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="sun.util.calendar.LocalGregorianCalendar.Date"%>
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
        <title>Transfer</title>
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
            Connection con = GetCon.getCon();
            String usrname = (String) session.getAttribute("name");
            PreparedStatement ps1;
            PreparedStatement ps2;
            PreparedStatement ps3;
            PreparedStatement ps4;
            PreparedStatement ps5;

            int tuamount = 0, ttamount = 0;
            int edituamount = 0, edittamount = 0;
            int uaccno = 0;
            int i3=0,i4=0,i=0,j=0;
            String useraccno = (String) session.getAttribute("accno");
            String accno = request.getParameter("taccno");
            if(useraccno.equals(accno))
            {
                 out.println("<h3><font color=red>This is your account no..</font></h3>");%>
                <jsp:include page="transfer.jsp"></jsp:include>
                <%
            }
            else
            {
            String amount = request.getParameter("amt");
            try {

                ps1 = con.prepareStatement("select * from bank where username=?");
                ps1.setString(1, usrname);
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    tuamount = rs1.getInt(8);
                    uaccno = rs1.getInt(1);
                }
                ps2 = con.prepareStatement("select * from bank where accountno=?");
                ps2.setInt(1, Integer.parseInt(accno));
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    ttamount = rs2.getInt(8);
                }
                if (Integer.parseInt(amount) > tuamount) {
                    out.println("<h3><font color=red>Amount is greatar than total balance</font></h3>"); %>
        <jsp:include page="transfer.jsp"></jsp:include>
        <%

        } else {
            edituamount = tuamount - Integer.parseInt(amount);
            edittamount = ttamount + Integer.parseInt(amount);

            ps3 = con.prepareStatement("Update bank set amount=? where username=?");
            ps3.setInt(1, edituamount);
            ps3.setString(2, usrname);
          i3 = ps3.executeUpdate();
            ps4 = con.prepareStatement("Update bank set amount=? where accountno=?");
            ps4.setInt(1, edittamount);
            ps4.setInt(2, Integer.parseInt(accno));
          i4 = ps4.executeUpdate();
            if (i3 > 0 && i4 > 0) {

                try {
                    ps4 = con.prepareStatement("insert into transaction(accountno,targetaccno,withdrawal,date) values(?,?,?,?)");
                    ps4.setInt(3, Integer.parseInt(amount));
                    ps4.setInt(1, uaccno);
                    ps4.setInt(2, Integer.parseInt(accno));
                    ps4.setDate(4, new java.sql.Date(System.currentTimeMillis()));
                    
                 j = ps4.executeUpdate();
                    if (j > 0) {
                        try {
                            ps5 = con.prepareStatement("insert into transaction(accountno,targetaccno,deposit,date) values(?,?,?,?)");

                            ps5.setInt(1, Integer.parseInt(accno));
                            ps5.setInt(2, uaccno);
                            ps5.setInt(3, Integer.parseInt(amount));
                            ps5.setDate(4, new java.sql.Date(System.currentTimeMillis()));
                            i = ps5.executeUpdate();
                            System.out.println(j);
                            System.out.println(i);
                        } catch (SQLException e) {
                            System.out.println("vishant2");
                            System.out.println(e);
                        }
                    }
                } catch (SQLException e) {
                    System.out.println("vishant1");
                    System.out.println(e);
                }
            } else {%>
        <jsp:include page="transfer.jsp"></jsp:include>
        <% }

                }
            } catch (SQLException e) {
                System.out.println("vishant");
            }
            if(i3>0 && i4>0){
            out.println("<h1><font color=green>Transfer done</font></h1>");
            
        %>
        <jsp:include page="account.jsp"></jsp:include>
        <%
            }
            else
            {
                out.println("<h1><font color=red>Transfer error</font></h1>");
                %>
                 <jsp:include page="transfer.jsp"></jsp:include>
           <% }
            }
            %>
        
    </body>
</html>