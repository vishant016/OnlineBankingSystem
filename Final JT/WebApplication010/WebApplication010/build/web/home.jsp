<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
	<%
	response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
   %>
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
      
     String name = (String) session.getAttribute("name");
         if (session.getAttribute("name") != null) {
           
            out.print("Hello, " + name + "   Welcome to your Profile");
         } else {
            response.sendRedirect("login.jsp");
         }
         %>
            <% 
         int accno=0;try 
                    {
                        Connection con=g.GetCon.getCon();
                        PreparedStatement ps1;
                        ps1 = con.prepareStatement("select * from bank where username=?");
                        ps1.setString(1,name);
                        ResultSet rs = ps1.executeQuery();
                        while (rs.next()) {
                            accno = rs.getInt(1);
                        }
                    }  catch (SQLException e) {
                        System.out.println("vishant");
                    }
            session.setAttribute("accno",Integer.toString(accno));
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
							<li><i class="fas fa-phone"></i> +91 7041295305</li>
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
        <!-- banner -->
        <section class="banner">
            <div class="callbacks_container">
                <ul class="rslides" id="slider3">
                    <li>
                        <div class="slider-info bg1">
                            <div class="banner-text container">
                                <h4 class="movetxt text-left mb-3 agile-title text-capitalize">Don't Miss Your Perfect
                                    Bank!</h4>
                                <p class="text-white mb-3">There were many online banking site are availabel but our HOME BANKING is some thing different from others must visite it.</p>
                                <a class="bt text-capitalize" href="about.html" role="button"> read more
                                    <i class="fas fa-angle-double-right"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slider-info bg2">
                            <div class="banner-text container">
                                <h4 class="movetxt text-left mb-3 agile-title text-capitalize">The Fastest Way To Your Online
                                    Banking</h4>
                                <p class="text-white mb-3">This site will give you an amaizing expirience.This provide you a esay and smoothness access and it is also easy in use.Visit it and enjoy !!</p>
                                <a class="bt text-capitalize" href="about.html" role="button"> read more
                                    <i class="fas fa-angle-double-right"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slider-info bg3">
                            <div class="banner-text container">
                                <h4 class="movetxt text-left mb-3 agile-title text-capitalize">Make Your Dreams Come True
                                </h4>
                   
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- //banner -->
        <!-- Products -->
        <section class="services py-5">
            <div class="container py-md-4 mt-md-3">
                <h2 class="heading-agileinfo">Service we provide <span>Speed Up the Banking Process</span></h2>
                <span class="w3-line black"></span>
                <div class="row inner_w3l_agile_grids-1 mt-md-5 pt-4">
                    <div class="col-md-4 w3layouts_news_left_grid1">
                        <div class="new_top">
                            <i class="fas fa-home"></i>
                            <h3 class="mb-3 mt-3">1.Minor to Major</h3>
                            <p>By this feature you can conver you bank account into Major from minor without standing into long queue of bank.
                            Do login and send request for major account.
                            Provide needed information.
                            Here is your Work is done !!!</p>
                        </div>
                    </div>
                    <div class="col-md-4 w3layouts_news_left_grid2">
                        <div class="new_top">
                            <i class="fas fa-building"></i>
                            <h3 class="mb-3 mt-3">2.Quick Balance</h3>
                            <p>You can easily check you balance through this feature.
                            Do login and click on to "Account" there you can see the balance
                            You can also check last transection by ministatements on features.
                            Enjoy it !!!</p>
                        </div>
                    </div>
                    <div class="col-md-4 w3layouts_news_left_grid3">
                        <div class="new_top">
                            <i class="fas fa-credit-card"></i>
                            <h3 class="mb-3 mt-3">3.Credit Service</h3>
                            <p>You can also do transection through this site !!!
                            For that first do login then visit "Transfer" in it enter the traget a/c no. and adn amount.
                            Now work is done by on click on Transfer.And money is transfer thats amazing !!!
                            
                          </p>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- //Products -->

        
    <%
	ServletContext ctx=getServletContext();  
   int t=(Integer)ctx.getAttribute("totalusers");  
   int c=(Integer)ctx.getAttribute("currentusers");  
   %>
    <!-- details -->
        <section class="details-books py-5">
            <div class="container py-md-4 mt-md-3">
                <h2 class="heading-agileinfo">Fast & Easy Application Process<span>Speed Up the Banking Process</span></h2>
                <span class="w3-line black"></span>
                <div class="row mt-md-5 pt-4">
                    <div class="col-lg-6 agileits_updates_grid_right">
                        <div id="accordion">
                            <div class="card w3l-acd">
                                <div class="card-header wl3_head" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"
                                                aria-expanded="true" aria-controls="collapseOne">
                                            <span class="fa fa-check mr-2" aria-hidden="true"></span>
                                            Register your self and Do login
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                                     data-parent="#accordion">
                                    <div class="card-body">
                                        <p>First Goto Bank and activate online banking, you will get one temperory username
                                           .Do login through it then Register your self and generate another username 
                                            and password. Your work is Done !!!</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card w3l-acd">
                                <div class="card-header wl3_head" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-toggle="collapse"
                                                data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <span class="fa fa-check mr-2" aria-hidden="true"></span>
                                            Enjoy the features of Banking
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                     data-parent="#accordion">
                                    <div class="card-body">
                                        <p>We are providing many features.After Compeleting first setp of Registration and login
                                            you can visit or enjoy the features of online banking instend of visiting bank
                                            branch you can do that all work from you PC at Home.That is the beauty 
                                            of our Home Banking. Don't wait Enjoy it !!!
                                            </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 details-w3l">
                        <img src="images/g4.jpg" class="img-fluid" alt="" />
                    </div>
                </div>
            </div>
        </section>
        <!-- //details -->
        	<!-- stats -->
	<section class="stats pb-5">
		<div class="container py-md-4 mt-md-3">
			<div class="row inner_w3l_agile_grids-1">
				<div class="col-lg-3 col-sm-6 w3layouts_stats_left w3_counter_grid1">
					<p class="counter"><%= c%></p>
					<h3>current login user</h3>
				</div>
				
				<div class="col-lg-3 col-sm-6 w3layouts_stats_left w3_counter_grid2">
					<p class="counter"><%= t%></p>
					<h3>total login user</h3>
				</div>
				
				<div class="col-lg-3 col-sm-6 w3layouts_stats_left w3_counter_grid2">
					<p class="counter">150</p>
					<h3>Happy Clients</h3>
				</div>
			</div>
		</div>
	</section>
	<!-- //stats -->
        <!-- clients -->
        <section class="features py-md-5">
            <div class="container py-md-4 mt-md-3">
                <h3 class="heading-agileinfo text-white">Great Thoughts <span class="text-white">Speed Up the Banking
                        Process</span></h3>
                <span class="w3-line black"></span>
                <div class="row about-main pt-5 mt-md-5">
                    <div class="col-lg-6 about-right">
                        <!-- stats -->
                        <div class="stats1">
                            <div class="row stats_inner">
                                <div class="col-md-6 col-sm-6 col-xs-6 stat-grids">
                                    <img src="images/logo1.jpg" alt="logo1" class=" img-fluid">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 stat-grids">
                                    <img src="images/logo2.jpg" alt="logo1" class=" img-fluid">
                                </div>
                            </div>
                            <div class="row stats_inner top-st">
                                <div class="col-md-6 col-sm-6 col-xs-6 stat-grids">
                                    <img src="images/logo3.jpg" alt="logo1" class=" img-fluid">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 stat-grids">
                                    <img src="images/logo1.jpg" alt="logo1" class=" img-fluid">
                                </div>

                            </div>
                            <div class="row stats_inner top-st">
                                <div class="col-md-6 col-sm-6 col-xs-6 stat-grids">
                                    <img src="images/logo1.jpg" alt="logo1" class=" img-fluid">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 stat-grids">
                                    <img src="images/logo3.jpg" alt="logo1" class=" img-fluid">
                                </div>
                                <!-- insert logo  -->
                            </div>
                        </div>
                        <!-- //stats -->

                    </div>
                    <div class="col-lg-6 about-left">
                        <!-- testimonials -->
                        <div class="w3_agile-section testimonials text-center" id="testimonials">
                            <div class=" w3ls-team-info test-bg">
                                <div class="testi-left">
                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">
                                            </li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="row thumbnail adjust1">
                                                    <div class="col-md-3 col-sm-3">
                                                        <img class="media-object img-fluid" src="images/ts1.jpg" alt="" />
                                                    </div>
                                                    <div class="col-md-9 col-sm-9">
                                                        <div class="caption testi-text">
                                                            <h4>Sonny Bill Williams,</h4>
                                                            <h5>Athelet</h5>
                                                        </div>
                                                    </div>
                                                    <p class="mt-3">
                                                        <span class="fa fa-quote-left pr-3" aria-hidden="true"></span>I'm a lot more comfortable in the ring. I'm comfortable catching punches, and defensively, I feel like I've improved a lot. I am banking on my athleticism. I've worked hard on my footwork.
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="row thumbnail adjust1">
                                                    <div class="col-md-3 col-sm-3">
                                                        <img class="media-object img-fluid" src="images/ts2.jpg" alt="" />
                                                    </div>
                                                    <div class="col-md-9 col-sm-9">
                                                        <div class="caption testi-text">
                                                            <h4>Henry Ford</h4>
                                                            <h5>Businessman</h5>
                                                        </div>
                                                    </div>
                                                    <p class="mt-3">
                                                        <span class="fa fa-quote-left pr-3" aria-hidden="true"></span>It is well enough that people of the nation do not understand our banking and monetary system, for if they did, I believe there would be a revolution before tomorrow morning.</p>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="row thumbnail adjust1">
                                                    <div class="col-md-3 col-sm-3">
                                                        <img class="media-object img-fluid" src="images/ts3.jpg" alt="" />
                                                    </div>
                                                    <div class="col-md-9 col-sm-9">
                                                        <div class="caption testi-text">
                                                            <h4>Elizabeth Warren</h4>
                                                            <h5>Public Servant</h5>
                                                        </div>
                                                    </div>
                                                    <p class="mt-3">
                                                        <span class="fa fa-quote-left pr-3" aria-hidden="true"></span>With post offices and postal workers already on the ground, USPS could partner with banks to make a critical difference for millions of Americans who don't have basic banking services because there are almost no banks or bank branches in their neighborhoods.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //testimonials-->
                    </div>
                </div>
            </div>
        </section>
        <!-- clients -->

        <!-- news -->
        <section class="wthree-row w3-about py-5">
            <div class="container py-md-4 mt-md-3">
                <h3 class="heading-agileinfo">Benifits of Home Banking<span>Speed Up the Banking Process</span></h3>
                <span class="w3-line black"></span>
                <div class="card-deck mt-md-5 pt-5">
                    <div class="card">
                        <img src="images/g7.jpg" class="img-fluid" alt="Card image cap">
                        <div class="card-body w3ls-card">
                            <h5 class="card-title">Smart Moving Tips</h5>
                            <p class="card-text mb-3 ">It is easy to use and having simple interface which make it helpful. </p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="images/g6.jpg" class="img-fluid" alt="Card image cap">
                        <div class="card-body w3ls-card">
                            <h5 class="card-title">A Big Time Saver</h5>
                            <p class="card-text mb-3 ">You don't need to visit bank nothing better then it to save your time .</p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="images/g8.jpg" class="img-fluid" alt="Card image cap">
                        <div class="card-body w3ls-card">
                            <h5 class="card-title">Is Now the Time to Fix?</h5>
                            <p class="card-text mb-3">It is useful to fix some problem of traditional Banking system.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //news -->
        <!--footer-->
        <footer>
            <div class="container py-md-4 mt-md-3">
                <div class="row footer-top-w3layouts-agile py-5">
                    <div class="col-lg-3 col-md-6 col-sm-6 footer-grid">
                        <div class="footer-title">
                            <h3>About Us</h3>
                        </div>
                        <div class="footer-text">
                            <p>Our perpose of creating it is to overcome banking problem and make it pure and fast.</p>

                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 footer-grid">
                        <div class="footer-title">
                            <h3>Contact Us</h3>
                        </div>
                        <div class="footer-office-hour">
                            <ul>
                                <li class="hd">Address :</li>
                                <li>College Road,Nadiad,Gujrat,INDIA</li>

                            </ul>
                            <ul>
                                <li class="hd">Phone:</li><li> +917041295305</li>
                                <li class="hd">Email:
                                    <a href="mailto:info@example.com">onlineBankingo@gamil.com</a>
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
				<p>© 2018 Home Loan. All Rights Reserved
				</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>



	<!-- js-->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- js-->
	<!-- Banner Responsiveslides -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function () {
			// Slideshow 4
			$("#slider3").responsiveSlides({
				auto: true,
				pager: true,
				nav: false,
				speed: 500,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!-- // Banner Responsiveslides -->
	<!-- stats -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->
	<!--pop-up-box -->
	<script src="js/jquery.magnific-popup.js"></script>
	<script>
		$(document).ready(function () {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});
		});
	</script>
	<!-- //pop-up-box -->
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js ">
	</script>
	<!-- //Bootstrap Core JavaScript -->
</body>

</html>