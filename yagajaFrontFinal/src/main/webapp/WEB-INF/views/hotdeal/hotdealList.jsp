<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="/resources/include/yagajaTop.jsp"%>
<!-- jQuery-2.2.4 js -->
<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>
<script src="../resources/common/js/bootstrap/bootstrap.min.js"></script>
<body>
<!-- ***** Breadcumb Area Start ***** -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/mainbg.jpg)"></div>
    <!-- ***** Breadcumb Area End ***** -->

    <!-- ***** Listing Destinations Area Start ***** -->
    <section class="dorne-listing-destinations-area section-padding-100-50">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading dark text-center">
                        <span></span>
                        <h4>핫딜</h4>
                        <p>HOTDEAL</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Single Features Area --><!-- 핫딜목록 반복부분  -->
                <c:forEach items="${lists }" var="row">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-features-area mb-50">
                    <a href="../main/index.do">
                        <img style="height:307px" src="../resources/common/img/room-img/room_type.jpg" alt="">
                        <%-- ${row.lodge_photo } --%>
                    </a>
                        <!-- Price -->
                        <div class="price-start">
                            <p>${row.lodge_feature }</p>
                        </div>
                        <div class="feature-content d-flex align-items-center justify-content-between">
                            <div class="feature-title">
                                <h5>${row.lodge_name}</h5>
                                <p><b>${row.lodge_type}</b></p>
                                <p>핫딜 시작시간 ${row.hotdeal_stime }</p>
                                <p>핫딜 마감시간 ${row.hotdeal_etime }</p>
                            </div>
                           <div class="feature-favourite">
								<a href="../main/index.do">숙박가격<br /> ${row.hotdeal_price }원</a>
							</div>
                    
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- 방명록 반복 부분 끝 -->
				<!-- Contents영역 끝-->
            </div>
	<div class="row text-center" style="text-align:center">
		<ul class="pagination">
			${pagingImg }
		</ul>
	</div>
                    <!-- 페이지번호 -->
        </div>
    </section>
        
<%@include file="/resources/include/yagajaBottom.jsp"%>

	<!-- Popper js -->
	<script src="../resources/common/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap-4 js -->

	<!-- All Plugins js -->
	<script src="../resources/common/js/others/plugins.js"></script>
	<!-- Active JS -->
	<script src="../resources/common/js/active.js"></script>
</body>
</html>
