<!DOCTYPE HTML>
<html lang="zxx">

<head>
	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
%>

<script>
	// Get the modal
	var modal = document.getElementById('id01');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function (event) {
		if (event.target === modal) {
			modal.style.display = "none";
		}
	}
</script>
<style>
	body {font-family: Arial, Helvetica, sans-serif;}
	form {border: 10px solid #f1f1f1;}

	input[type=text], input[type=password] {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		box-sizing: border-box;
	}

	button {
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 100%;
	}

	button:hover {
		opacity: 0.8;
	}

	.cancelbtn {
		width: auto;
		padding: 10px 18px;
		background-color: #f44336;
	}

	.imgcontainer {
		text-align: center;
		margin: 24px 0 12px 0;
	}

	.container {
		padding: 16px;
	}

	span.psw {
		float: right;
		padding-top: 16px;
	}

	/* Change styles for span and cancel button on extra small screens */
	@media screen and (max-width: 300px) {
		span.psw {
			display: block;
			float: none;
		}
		.cancelbtn {
			width: 100%;
		}
	}
</style>


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


	<!-- header -->
	<header>
		<div class="top">
			<div class="container">
				<div class="t-op row">
					<div class="col-sm-6 top-middle">
						<ul>
							<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
							<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
						</ul>
					</div>
					<div class="col-sm-6 top-left">
						<ul>
							<li><i class="fas fa-phone"></i> +021 365 777</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light">
				<h1>
					<a class="navbar-brand text-capitalize" href="start.jsp">
						Home Bank
					</a>
				</h1>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav text-center  ml-lg-auto">

						<li class="nav-item active  mr-3">
							<a class="nav-link" href="start.jsp">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>

						<li class="nav-item  mr-3">
							<a class="nav-link" href="account.jsp">Account</a>
						</li>
						<li class="nav-item  mr-3">
							<a class="nav-link" href="transfer.jsp">Transfer</a>
						</li>

						<li class="nav-item  mr-3">
							<a class="nav-link" href="feature.jsp">Features</a>
						</li>

						<li class="nav-item  mr-3">
							<a class="nav-link" href="logout.jsp" style="float:right">Logout</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	<!-- //header -->

	<section class="services py-5">
		<div class="container py-md-4 mt-md-3">
			<h2 class="heading-agileinfo"> Transfer Amount Form<span>Please fill up this form for transection</span>
			</h2>
			<span class="w3-line black"></span>
			<br />
			<br />
			<br />
			<div id="id01">

                <div id="id01">

                    <form class="modal-content animate" action="transfer1.jsp">
                        <div class="container">
                            <label for="Target Account no:"><b>Account no:</b></label>
                            <input type="text" placeholder="Target Account Number " name="taccno" required>
                            <label for="Amount:"><b>Ammount:</b></label>
                            <input type="text" placeholder="Amount" name="amt" required>
                            <button type="submit">Transfer</button>

                        </div>

                        <div class="container" style="background-color:#f1f1f1">
                            <button type="cancel" onclick="window.location = 'http://localhost:8084/WebApplication10/start.jsp'" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancel</button>

                        </div>
                    </form>
                </div>
			</div>

		</div>
	</section>


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
				<p>© 2020 Home Loan. All Rights Reserved
				</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>


</body>

</html>