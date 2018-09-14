<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/resources/include/yagajaTop.jsp"%>
<!-- jQuery-2.2.4 js -->
<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>
<script src="../resources/common/js/bootstrap/bootstrap.min.js"></script>
<body>
 <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/mainbg.jpg)"></div>
    <!-- ***** Breadcumb Area End ***** -->

    <!-- ***** Listing Destinations Area Start ***** -->
    <section class="dorne-listing-destinations-area section-padding-100-50">
        <div class="container">
            <div class="row">
                <div class="col-12" style="border-bottom:1px solid gray; text-align:center;">
                     
                        <h3>공지사항</h3>
                    <br />
                </div>
            </div>
            <div class="row" >
            
                <!-- Single Features Area --><!-- 공지목록 반복부분  -->
                <c:forEach items="${lists }" var="row">
                <div class="col-12" >
                    <!-- <div class="single-features-area mb-50"> -->
                        <div class="feature-content d-flex align-items-center justify-content-between" >
                            <div class="feature-title"  >
                                <a href="../notice/noticeView.do?notice_no=${row.notice_no }"><h5><b>${row.notice_title}</b></h5></a>
                            </div>
                           <div class="feature-title" style="vertical-align:middle;">
								${row.notice_regidate }
							</div>
                    
                        </div>
                    <!-- </div> -->
                </div>
                </c:forEach>
                <!-- 방명록 반복 부분 끝 -->
				<!-- Contents영역 끝-->
            </div>
	<div class="row text-center" style="text-align:center; padding-left:550px">
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
