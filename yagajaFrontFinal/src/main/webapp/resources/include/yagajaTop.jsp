<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yagaja 와 함께 여행을 떠나 볼까요?</title>
	    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Favicon -->
    <link rel="icon"
	href="https://yaimg.yanolja.com/joy/pw/favicon/favicon_32x32.ico"
	type="image/x-icon"/>

    <!-- Core Stylesheet -->
    <link href="../resources/common/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="../resources/common/css/responsive/responsive.css" rel="stylesheet">
</head>
<body>

    <!-- Preloader -->
    <div id="preloader">
        <div class="dorne-load"></div>
    </div>

    <!-- ***** Search Form Area ***** -->
    <div class="dorne-search-form d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-close-btn" id="closeBtn">
                        <i class="pe-7s-close-circle" aria-hidden="true"></i>
                    </div>
                    <form action="#" method="get">
                        <input type="search" name="caviarSearch" id="search" placeholder="Search Your Desire Destinations or Events">
                        <input type="submit" class="d-none" value="submit">
                    </form>
                </div>
            </div>
        </div>
    </div> 

    <!-- ***** Header Area Start ***** -->
    <header class="header_area" id="header" style="background-color:white; height:80px;">
        <div class="container-fluid h-100">
            <div class="row h-100">
                <div class="col-12 h-100">
                    <nav class="h-100 navbar navbar-expand-lg">
                        <a class="navbar-brand" href="./index.do"><img src="../resources/common/img/core-img/logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
                        <!-- Nav -->
                        <div style="background-color:white;" class="collapse navbar-collapse" id="dorneNav">
                            <ul class="navbar-nav mr-auto" id="dorneMenu">
                                <li class="nav-item active">
                                    <a class="nav-link" href="../main/list.jsp" style="color:black;">지역 <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">숙소검색 <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="index.html">Home</a>
                                        <a class="dropdown-item" href="explore.html">Explore</a>
                                        <a class="dropdown-item" href="listing.html">Listing</a>
                                        <a class="dropdown-item" href="single-listing.html">Single Listing</a>
                                        <a class="dropdown-item" href="contact.html">Contact</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">경매 <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="index.html">Home</a>
                                        <a class="dropdown-item" href="explore.html">Explore</a>
                                        <a class="dropdown-item" href="listing.html">Listing</a>
                                        <a class="dropdown-item" href="single-listing.html">Single Listing</a>
                                        <a class="dropdown-item" href="contact.html">Contact</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.html" style="color:black;">핫딜</a>
                                </li>
                            </ul>
                            <div class="dorne-signin-btn">
                                <a style="color:black;" href="#">공지사항</a>
                            </div>
                            <div class="dorne-signin-btn">
                                <a style="color:black;" href="#">예약내역</a>
                            </div>
                            <!-- Signin btn -->
                            <div class="dorne-signin-btn">
                                <a style="color:black;" href="#">회원가입</a>
                            </div>
                            <!-- Add listings btn -->
                            <div class="dorne-add-listings-btn" >
                                <a href="#" class="btn dorne-btn" style="background-color:#ff3479;">로그인</a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
