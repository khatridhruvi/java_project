<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>Bootie Ecommerce Bootstrap Responsive Web Template | Home :: W3layouts</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="Bootie Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta tag Keywords -->

    <!-- Custom-Files -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
    <!-- /Fonts -->
    <link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">
    <!-- //Fonts -->

</head>

<body>
<%Customer c1 = null;
if(session.getAttribute("data")!=null){
	c1 = (Customer)session.getAttribute("data");
}
else{
	response.sendRedirect("customer-login.jsp");
}
%>
    <!-- mian-content -->
    <div class="main-banner" id="home">
        <!-- header -->
        <header class="header">
            <div class="container-fluid px-lg-5">
                <!-- nav -->
                <nav class="py-4">
                    <div id="logo">
                        <h1> <a href="customer-index.jsp"><span class="fa fa-bold" aria-hidden="true"></span>ootie</a></h1>
                    </div>

                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop" />
                    <ul class="menu mt-2">
                        <li class="active"><a href="customer-index.jsp">Home</a></li>
                        <li>
                            <!-- First Tier Drop Down -->
                            <label for="drop-2" class="toggle">Drop Down <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
                            <a href="#">Product <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                            <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="seller-registration.jsp">Upload Product</a></li>
                                <li><a href="customer-registration.jsp">Manage Product</a></li>
                            </ul>
                        </li>
                        <li>
                            <!-- First Tier Drop Down -->
                            <label for="drop-2" class="toggle">Drop Down <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
                            <a href="#"><%=c1.getName() %> <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                            <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="customer-profile.jsp">Profile</a></li>
                                <li><a href="customer-change-password.jsp">Change Password</a></li>
                                <li><a href="customer-logout.jsp">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- //nav -->
            </div>
        </header>
        <!-- //header -->
        <!--/banner-->
        <div class="banner-info">
            <p>Trending of the week</p>
            <h3 class="mb-4">Casual Shoes for Men</h3>
            <div class="ban-buttons">
                <a href="shop-single.html" class="btn">Shop Now</a>
                <a href="single.html" class="btn active">Read More</a>
            </div>
        </div>
        <!--// banner-inner -->

    </div>
    <!--//main-content-->
    <!--/ab -->
  	<section class="ab-info-main py-5">
		<div class="container py-3">
			<h3 class="tittle text-center">
				<span class="sub-tittle"></span>Customer change password
			</h3>
			<div class="row contact-main-info mt-5">
				<div class="col-md-12 contact-right-content">
					<form action="CustomerController" method="post">
					<input type="hidden" name="email" value="<%=c1.getEmail() %>">
						<h4 style = "font-style: italic; margin-left:470px;">Old password</h4><br>
						<input style = "width : 400px; margin-left:350px; border : 2px solid black ;" type="password" name="op" placeholder="Old Password" required=""><br><br>
						<h4 style = "font-style: italic; margin-left:470px;">New password</h4><br>
						<input style = "width : 400px; margin-left:350px; border : 2px solid black ;" type="password" name="np" placeholder="New Password"	required=""> <br><br>
						<h4 style = "font-style: italic; margin-left:450px;">Confirm password</h4><br>
						<input style = "width : 400px; margin-left:350px; border : 2px solid black ;" type="password" name="cnp" placeholder="Confirm New Password" required=""> 

						<div class="text-center mt-3">
							<input type="submit" name="action" value="update password">
						</div>
						<%String msg = (String)request.getAttribute("msg"); %>
						<%if(msg!=null){ %>
						<h4><%out.print(msg); %></h4>
						<%} %>
						<%String msg1 = (String)request.getAttribute("msgpass"); %>
						<%if(msg1!=null){ %>
						<h4><%out.print(msg1); %></h4>
						<%} %>
					</form>
				</div>
			</div>
		</div>
		
		
		<!-- <div class="col-md-6 contact-left-content">
                    <div class="address-con">
                        <h4 class="mb-2"><span class="fa fa-phone-square" aria-hidden="true"></span> Phone</h4>
                        <p>+121 098 8907 9987</p>
                        <p>+121 098 8907 9987</p>
                    </div>
                    <div class="address-con my-4">
                        <h4 class="mb-2"><span class="fa fa-envelope-o" aria-hidden="true"></span> Email </h4>
                        <p><a href="mailto:info@example.com">info@example.com</a></p>
                        <p><a href="mailto:info@example.com">info@example.com</a></p>
                    </div>
                    <div class="address-con mb-4">
                        <h4 class="mb-2"><span class="fa fa-fax" aria-hidden="true"></span> Fax</h4>

                        <p>(800) 123-80088</p>
                    </div>
                    <div class="address-con">
                        <h4 class="mb-2"><span class="fa fa-map-marker" aria-hidden="true"></span> Location </h4>

                        <p>Honey Avenue, New York City</p>
                    </div>

                </div>

            </div>
            <div class="map-fo mt-lg-5 mt-4">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d423286.27404345275!2d-118.69191921441556!3d34.02016130939095!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos+Angeles%2C+CA%2C+USA!5e0!3m2!1sen!2sin!4v1522474296007" allowfullscreen></iframe>
            </div>
        </div> -->
	</section>
    <!-- footer -->
    <footer>
        <div class="container">
            <div class="row footer-top">
                <div class="col-lg-4 footer-grid_section_w3layouts">
                    <h2 class="logo-2 mb-lg-4 mb-3">
                        <a href="index.html"><span class="fa fa-bold" aria-hidden="true"></span>ootie</a>
                    </h2>
                    <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    <h4 class="sub-con-fo ad-info my-4">Catch on Social</h4>
                    <ul class="w3layouts_social_list list-unstyled">
                        <li>
                            <a href="#" class="w3pvt_facebook">
                                <span class="fa fa-facebook-f"></span>
                            </a>
                        </li>
                        <li class="mx-2">
                            <a href="#" class="w3pvt_twitter">
                                <span class="fa fa-twitter"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="w3pvt_dribble">
                                <span class="fa fa-dribbble"></span>
                            </a>
                        </li>
                        <li class="ml-2">
                            <a href="#" class="w3pvt_google">
                                <span class="fa fa-google-plus"></span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-8 footer-right">
                    <div class="w3layouts-news-letter">
                        <h3 class="footer-title text-uppercase text-wh mb-lg-4 mb-3">Newsletter</h3>

                        <p>By subscribing to our mailing list you will always get latest news and updates from us.</p>
                        <form action="#" method="post" class="w3layouts-newsletter">
                            <input type="email" name="Email" placeholder="Enter your email..." required="">
                            <button class="btn1"><span class="fa fa-paper-plane-o" aria-hidden="true"></span></button>

                        </form>
                    </div>
                    <div class="row mt-lg-4 bottom-w3layouts-sec-nav mx-0">
                        <div class="col-md-4 footer-grid_section_w3layouts">
                            <h3 class="footer-title text-uppercase text-wh mb-lg-4 mb-3">Information</h3>
                            <ul class="list-unstyled w3layouts-icons">
                                <li>
                                    <a href="index.html">Home</a>
                                </li>
                                <li class="mt-3">
                                    <a href="about.html">About Us</a>
                                </li>
                                <li class="mt-3">
                                    <a href="#">Gallery</a>
                                </li>
                                <li class="mt-3">
                                    <a href="#">Services</a>
                                </li>
                                <li class="mt-3">
                                    <a href="contact.html">Contact Us</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4 footer-grid_section_w3layouts">
                            <!-- social icons -->
                            <div class="agileinfo_social_icons">
                                <h3 class="footer-title text-uppercase text-wh mb-lg-4 mb-3">Customer Service</h3>
                                <ul class="list-unstyled w3layouts-icons">

                                    <li>
                                        <a href="#">About Us</a>
                                    </li>
                                    <li class="mt-3">
                                        <a href="#">Delivery & Returns</a>
                                    </li>
                                    <li class="mt-3">
                                        <a href="#">Waranty</a>
                                    </li>
                                    <li class="mt-3">
                                        <a href="#">Terms & Condition</a>
                                    </li>
                                    <li class="mt-3">
                                        <a href="#">Privacy Plolicy</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- social icons -->
                        </div>
                        <div class="col-md-4 footer-grid_section_w3layouts my-md-0 my-5">
                            <h3 class="footer-title text-uppercase text-wh mb-lg-4 mb-3">Contact Info</h3>
                            <div class="contact-info">
                                <div class="footer-address-inf">
                                    <h4 class="ad-info mb-2">Phone</h4>
                                    <p>+121 098 8907 9987</p>
                                </div>
                                <div class="footer-address-inf my-4">
                                    <h4 class="ad-info mb-2">Email </h4>
                                    <p><a href="mailto:info@example.com">info@example.com</a></p>
                                </div>
                                <div class="footer-address-inf">
                                    <h4 class="ad-info mb-2">Location</h4>
                                    <p>Honey Avenue, New York City</p>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="cpy-right text-left row">
                        <p class="col-md-10">© 2019 Bootie. All rights reserved | Design by
                            <a href="http://w3layouts.com"> W3layouts.</a>
                        </p>
                        <!-- move top icon -->
                        <a href="#home" class="move-top text-right col-md-2"><span class="fa fa-long-arrow-up" aria-hidden="true"></span></a>
                        <!-- //move top icon -->
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- //footer -->

</body>

</html>
