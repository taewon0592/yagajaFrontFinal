<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<%@include file="/resources/include/yagajaTop.jsp"%>
<body>
	<section class="dorne-welcome-area2 bg-img bg-overlay"
		style="background-image: url(../resources/common/img/bg-img/mainbg.jpg);">
	</section>
	<!-- ***** Contact Area Start ***** -->
<div class='dorne-contact-area d-md-flex' id="contact">

	<!-- Contact Form Area -->
	<div class="contact-form-area equal-height" style="height:1266px;">
			
			<c:choose>
				<c:when test="${mode eq '모텔' }">
				<div class="section-heading dark text-left">
					<h4>Motel 리스트</h4>
				</div>
				</c:when>
				<c:when test="${mode eq '호텔/리조트' }">
				<div class="section-heading dark text-left">
					<h4>Hotel/Resort 리스트</h4>
				</div>
				</c:when>
				<c:when test="${mode eq '펜션/풀빌라' }"> 
				<div class="section-heading dark text-left">
					<h4>Pension/Pool Villa 리스트</h4>
				</div>
				</c:when>
				<c:otherwise>
				<div class="section-heading dark text-left">
					<h4>Guest House 리스트</h4>
				</div>
				</c:otherwise>
			</c:choose>
				<form action="#">
					<div class="row">
						<!-- Single Features Area -->
						<c:forEach items="${lists }" var="row" varStatus="loop">
						<div class="col-12 col-sm-6 col-lg-4">
							<div class="single-features-area mb-50">
								<a href="../lodge/lodgeView.do?mode=${row.lodge_type }&lodge_no=${row.lodge_no}">
									<img style="height:307px" src="../resources/common/img/room-img/${row.lodge_photo }" alt="">
								</a>
								<!-- Price -->
								<div class="price-start">
									<p>${row.lodge_feature }</p>
								</div>
								<div class="feature-content d-flex align-items-center justify-content-between">
									<div class="feature-title">
										<h5>${row.lodge_name }</h5>
									</div>
								</div>
								<div class="feature-favourite">
									<div >
										<div><b style="color:red">주말 대실</b>&nbsp;&nbsp;&nbsp;&nbsp; 
											<fmt:formatNumber value="${row.w_rent_price }" pattern="#,###" />원</div>
										<div><b style="color:red">주말 숙박</b>&nbsp;&nbsp;&nbsp;&nbsp; 
											<fmt:formatNumber value="${row.w_sleep_price }" pattern="#,###" />원</div>
										<div><b>주중 대실</b>&nbsp;&nbsp;&nbsp;&nbsp; 
											<fmt:formatNumber value="${row.d_rent_price }" pattern="#,###" />원</div>
										<div><b>주중 숙박</b>&nbsp;&nbsp;&nbsp;&nbsp; 
											<fmt:formatNumber value="${row.d_sleep_price }" pattern="#,###" />원</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					<div class="row text-center">
						<ul style="padding:0px 200px;" class=" pagination col-12" >
						<!-- 페이지 번호 부분 -->
								${pagingImg }
						</ul>
					</div>
				</form>							
			</div>
			

		<!-- Map Area -->
		<div class= "contact-form-area equal-height">
       	    <div id="googleMap">
           		<div class="section-heading dark text-right">
					<h4>맵 연결짓기</h4>
				</div>
         		  	<!-- <button type="button">dtd</button> -->
         	 </div>
    	</div>
	</div>
	<%@include file="/resources/include/yagajaBottom.jsp"%>

	<!-- jQuery-2.2.4 js -->
	<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="../resources/common/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap-4 js -->
	<script src="../resources/common/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="../resources/common/js/others/plugins.js"></script>
	<!-- Active JS -->
	<script src="../resources/common/js/active.js"></script>
</body>

</html>