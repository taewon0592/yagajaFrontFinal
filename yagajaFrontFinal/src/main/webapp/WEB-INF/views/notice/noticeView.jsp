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
		    <div class="col-12" style="border-bottom:3px solid black; text-align:center">
	            <h4>공지사항</h4>
				<br />			
			</div>
		</div>

      <div class="listing-reviews-area mt-100" id="review" >
            
                <div class="reviewer-meta d-flex align-items-center"  >
                   <div class="col-12" style="border-bottom:1px solid gray;">
                    <div class="feature-content d-flex align-items-center justify-content-between"  >
                        <div class="feature-title"  >
                                <h5><b>${vo.notice_title}</b></h5>
                        </div>
                        <div class="feature-title" style="vertical-align:middle;">
							${vo.notice_regidate } 
						</div>   
                     </div>
                    </div>
                </div>
                <div class="reviewer-name">
                    <h6>${vo.notice_contents }</h6>
               
            </div>
            <div class="single-review-area">
                <div class="reviewer-meta d-flex align-items-center">
              
               
                </div>
               
            </div>
       </div>
    </div>
</div>
<div style="text-align:center">
<button class="btn btn-default" onclick="location.href='../notice/noticeList.do';" style="text-align:middle">홈으로</button>
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
