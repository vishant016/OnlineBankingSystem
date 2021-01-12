<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="g.GetCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

<head>
	<%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
        %>
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

</head>

<body>
	<%
            if (session.getAttribute("name") == null) {
        %>
	<jsp:forward page="login.jsp"></jsp:forward>
	<%
            }
        %>


	<% String notdone = "";
            String count=(String)session.getAttribute("count");
            //System.out.println(count);
              Connection con = GetCon.getCon();
              String accno = (String)session.getAttribute("accno");
              String requests="none";
              PreparedStatement ps1;
               try 
               {
                ps1 = con.prepareStatement("select * from requests where accountno=? and request=?" );
                
                ps1.setInt(1,Integer.parseInt(accno));
                ps1.setString(2,"kyc" );
                ResultSet rs = ps1.executeQuery();
                while (rs.next()) {
                    requests = rs.getString(3);
                }
              
            if(requests.equals("kyc") )
            {
                out.println("you have done kyc early");
                %>
	<jsp:include page="feature.jsp"></jsp:include>
	<%
            }
            else{
                if (session.getAttribute("notdone") != null) {
                    notdone = "Done";
                    session.removeAttribute("notdone");
                  
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
				<h2 class="heading-agileinfo"> Minor to Major <span>Convert bank account into Major</span></h2>
				<span class="w3-line black"></span>
				<br />
				<br />
				<div id="id01">
					<form action="fileuploader">
						<label for="email"><b>Email ID</b></label><br />
						<input type="text" placeholder="Enter Email" name="email" required>
						<br />
						<label for="birthdate"><b>Date of Birth</b></label> <br /><br />
						<input type="date" name="dob" required>
						<br />
						<br />
						<label for="phonenumber"><b>Phone Number</b></label>
						<br /> <input type="text" pattern="[0-9]{10}" placeholder="enter phone number" name="phone"
							required>
						<br />
						<input type="submit" class="registerbtn" value="request">
						<input type="reset" class="registerbtn" value="Reset">
					</form>
				</div>
			</div>
		</section>

	</div>


	<%
                  
                
               }
                
            }
               
               catch (SQLException e) 
                        {
                System.out.println("vishant");
            }
                    %>



	<!--footer-->
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


</body>

</html>