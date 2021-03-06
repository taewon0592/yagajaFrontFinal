<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    
                        <a class="navbar-brand" href="../main/index.do"><img src="../resources/common/img/core-img/logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
                        <!-- Nav -->
                        
                        <div style="background-color:white;" class="collapse navbar-collapse" id="dorneNav">

							
								<ul class="navbar-nav mr-auto" id="dorneMenu">

	
									<li class="nav-item dropdown"><a class="nav-link" style="color:black;" href="../lodge/lodgeList.do?mode=모텔">모텔</a>
									</li>
									<li class="nav-item dropdown"><a class="nav-link" style="color:black;" href="../lodge/lodgeList.do?mode=호텔/리조트">호텔/리조트</a>
									</li>
									<li class="nav-item dropdown"><a class="nav-link" style="color:black;" href="../lodge/lodgeList.do?mode=펜션/풀빌라">펜션/풀빌라</a>
									</li>
									<li class="nav-item dropdown"><a class="nav-link" style="color:black;" href="../lodge/lodgeList.do?mode=게스트하우스">게스트하우스</a>
									</li>
									<li class="nav-item dropdown"><a class="nav-link"
										href="../auction/auctionList.do" style="color: black;">경매</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="../hotdeal/hotdealList.do" style="color: black;">핫딜</a>
									</li>
								</ul>
								
								<div class="dorne-signin-btn">
									<a style="color: black;" href="../notice/noticeList.do">공지사항</a>
								</div>
								<c:choose>
									<c:when test="${not empty sessionScope.siteUserInfo }">
										<!-- 채팅 -->
										<div class="dorne-signin-btn">
											<a style="color: black;"
												href="../chatting.do?member_no=${sessionScope.siteUserInfo.member_no }&id=${sessionScope.siteUserInfo.id }"
												onClick="window.open(this.href, '', 'width=400, height=500'); return false;">실시간채팅</a>
										</div>
										
										<!-- 로그인 -->
									
									<li class="nav-item dropdown" >
                                    <a style="font-size: 24px; background-color: #ff3479; border-radius: 1em;" class="btn dorne-btn nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.siteUserInfo.nickname } 님</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align:center; background-color: rgb(255, 255, 255);" >
                                        <br />
                                        <div class="dorne-signin-btn">
                                        <a style="color: grey; font-size:18px; "
												href="../member/passcheck.do?member_no=${sessionScope.siteUserInfo.member_no }&id=${sessionScope.siteUserInfo.id }">마이페이지</a>
										</div>
										<div class="dorne-signin-btn">
                                        <a style="color: grey; font-size:18px; "
												href="../reser/reservationList.do?member_no=${sessionScope.siteUserInfo.member_no }">예약내역</a>
										</div>
										<div class="dorne-signin-btn">
                                        <a style="color: grey; font-size:18px; "
												href="../auction/auctionReserList.do?member_no=${sessionScope.siteUserInfo.member_no }&reser_type=경매">경매내역</a>
										</div>
										<div class="dorne-signin-btn">
											<a href="../member/logout.do" a style="color: grey; font-size:18px; ">
												로그아웃 </a>
										</div>
           
                                    </div>
                                </li>
									

									</c:when>

									<c:when test="${param.code != null }">
										<!-- 네이버 로그인일때 나오는 화면-->
										<div class="dorne-signin-btn">
											<a style="color: black;"
												href="../reser/reserveList.do?member_no=${sessionScope.siteUserInfo.member_no }">예약내역</a>
										</div>
										<!-- 마이페이지 -->
										<div class="dorne-signin-btn">
											<a style="color: black;"
												href="../member/passcheck.do?member_no=${sessionScope.siteUserInfo.member_no }&id=${sessionScope.siteUserInfo.id }">마이페이지</a>
										</div>
										<!-- 로그인 -->
										<div class="dorne-add-listings-btn">
											<a href="../member/logout.do" class="btn dorne-btn"
												style="background-color: #ff3479; border-radius: 1em;">
												로그아웃 </a>
										</div>
									</c:when>

									<c:otherwise>
										<!-- Signin btn -->
										<div class="dorne-signin-btn">
											<a style="color: black;" href="../member/memberjoin.do">회원가입</a>
										</div>
										<!-- Add listings btn -->
										<div class="dorne-add-listings-btn">
											<a href="../member/login.do" class="btn dorne-btn"
												style="background-color: #ff3479; border-radius: 1em;">로그인</a>
										</div>
									</c:otherwise>
								</c:choose>
						</div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
