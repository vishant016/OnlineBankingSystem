<%@ page import="java.security.*,g.*" %>
<%
  String mypassword = "";

  encryption md = new encryption();

  mypassword = "Hello World";
  out.println("Actual String is : " + mypassword +""+ " <br>MD5 String is : " + md.getHashPass(mypassword));
%>