<%-- 
    Document   : validatepan.jsp
    Created on : 17 Mar, 2020, 4:45:02 PM
    Author     : vishant
--%>

<%@page import="g.GetCon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validate Pan</title>
              <link rel="stylesheet" type="text/css" href="slider.css">
        <link rel="stylesheet" type="text/css" href="register.css">
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
                document.body.style.backgroundColor = "rgba(0,0,0,0.3)";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";
                document.body.style.backgroundColor = "white";
            }
        </script>
        
        <script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>

	<!-- Bootstrap Core CSS -->
	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<!-- pop up box -->
	<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!-- font-awesome icons -->
	<link href="css/fontawesome-all.min.css" rel="stylesheet">
	<!-- //Custom Theme files -->
	<!-- online fonts -->
	<!-- titles -->
	<link href="//fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">
	<!-- body -->
	<link href="//fonts.googleapis.com/css?family=Poppins:400,500,600,700,800" rel="stylesheet">
        <title>Validate PAN</title>
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
             
            String notdone="";
            
                if (session.getAttribute("notdone") !=null) {
                    notdone = "Done";
                    session.removeAttribute("notdone");
                   // System.out.println(request.getParameter("PAN"));
                    session.setAttribute("addpan", "addpan");
                     }%>
                     	<div id="mySidenav" class="sidenav">

		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

		<a href="start.jsp">HOME</a>
		<a href="request1.jsp">Request for passbook book</a>
		<a href="request.jsp">Request for new check book</a>
		<a href="transaction.jsp">Statement of transaction</a>
		<a href="minortomajor.jsp">Minor to Major</a>
		<a href="upcoming">more features</a>

	</div>

	<div id="main">

		<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Enjoy the feature of online
			banking</span>

		<hr />
		<section class="services py-5">
			<div class="container py-md-4 mt-md-3">
				<h2 class="heading-agileinfo"> Enter Pan Details <span>Do nor forgot to upload photo</span></h2>
				<span class="w3-line black"></span>
				<br />
				<br />
                                <br />
				<div id="id01">
					<form action="uploadcheck?msg=notdone" method="post" enctype="multipart/form-data">
						<div id="main">
                                                    <h3><label for="panno"><b>PAN no.</b></label></h3>
                                                    <br />
                                                    <input type="text"  placeholder="must be of 12 charector" name="PAN" pattern="[A-Za-z]{5}\d{4}[A-Za-z]{1}" required>
                                                    <br />
                                                    <br />
                                                    <h3><b>Add Snippet Photo of Pancard:</b></h3><br />
                                                    <br />
                                                    <input type="file" name="snippet" required><input type="submit" value="upload"
									required /><%=notdone%><br><br>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
	<footer>
		<div class="container py-md-4 mt-md-3">
			<div class="row footer-top-w3layouts-agile py-5">
				<div class="col-lg-3 col-md-6 col-sm-6 footer-grid">
					<div class="footer-title">
						<h3>About Us</h3>
					</div>
					<div class="footer-text">
						<p>Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. lacinia eget consectetur
							sed, convallis at tellus..</p>

					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 footer-grid">
					<div class="footer-title">
						<h3>Contact Us</h3>
					</div>
					<div class="footer-office-hour">
						<ul>
							<li class="hd">Address :</li>
							<li>No.27 - 5549436 street lorem, Newyork City, USA</li>

						</ul>
						<ul>
							<li class="hd">Phone:+ 1 (234) 567 8901</li>
							<li class="hd">Email:
								<a href="mailto:info@example.com">info@example.com</a>
							</li>
							<li class="hd">Fax: 1(234) 567 8901</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 footer-grid">
					<div class="footer-title">
						<h3>Follow us</h3>
					</div>
					<div class="footer-office-hour"></div>
					<ul>
						<li>
							<a class="facebook" href="#">
								<i class="fab fa-facebook-f"></i> facebook
							</a>
						</li>
						<li>
							<a class="facebook" href="#">
								<i class="fab fa-twitter"></i> Twitter
							</a>
						</li>
						<li>
							<a class="facebook" href="#">
								<i class="fab fa-google-plus-g"></i> GooglePlus
							</a>
						</li>
						<li>
							<a class="facebook" href="#">
								<i class="fab fa-pinterest-p"></i> Pinterest
							</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</footer>
	<!---->
	<div class="copyright py-3">
		<div class="container">
			<div class="copyrighttop">
				<ul>
					<li>
						<h4>Follow us on:</h4>
					</li>
					<li>
						<a class="facebook" href="#">
							<i class="fab fa-facebook-f"></i>
						</a>
					</li>
					<li>
						<a class="facebook" href="#">
							<i class="fab fa-twitter"></i>
						</a>
					</li>
					<li>
						<a class="facebook" href="#">
							<i class="fab fa-google-plus-g"></i>
						</a>
					</li>
					<li>
						<a class="facebook" href="#">
							<i class="fab fa-pinterest-p"></i>
						</a>
					</li>
				</ul>
			</div>
			<div class="copyrightbottom">
				<p>? 2020 Home Loan. All Rights Reserved
				</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
                     
              
              
              
                <%
                
                System.out.println(request.getParameter("PAN"));%>
    </body>
</html>
