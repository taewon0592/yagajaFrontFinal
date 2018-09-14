<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 스크롤 따라다니는 박스 설정 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<%
//한글처리
request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=mtzrJX6prcOqtj1iSAII">
</script>
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
					<h4>Motel</h4>
				</div>
				</c:when>
				<c:when test="${mode eq '호텔/리조트' }">
				<div class="section-heading dark text-left">
					<h4>Hotel/Resort</h4>
				</div>
				</c:when>
				<c:when test="${mode eq '펜션/풀빌라' }"> 
				<div class="section-heading dark text-left">
					<h4>Pension/Pool Villa</h4>
				</div>
				</c:when>
				<c:otherwise>
				<div class="section-heading dark text-left">
					<h4>Guest House</h4>
				</div>
				</c:otherwise>
			</c:choose>
				<form action="#">
					<div class="row">
						<!-- Single Features Area -->
						<!-- 반복 시작 -->
						<c:choose>
							<c:when test="${empty lists }">
								<!-- 검색된 시설이 없을때 -->
								<tr>
									<div style="color:red; font-size:2em; align-content:center;">
									<a href= "../main/index.do" >예약 가능한 숙소가 없습니다. (뒤로가기 클릭)</a></div>
								</tr>
							</c:when>
							<c:otherwise>
								<!-- 검색된 시설이 있을때 -->
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
											<fmt:formatNumber value="${row.w_rent_price }" groupingUsed="true" />원</div>
										<div><b style="color:red">주말 숙박</b>&nbsp;&nbsp;&nbsp;&nbsp; 
											<fmt:formatNumber value="${row.w_sleep_price }" groupingUsed="true" />원</div>
										<div><b>주중 대실</b>&nbsp;&nbsp;&nbsp;&nbsp; 
											<fmt:formatNumber value="${row.d_rent_price }" groupingUsed="true"/>원</div>
										<div><b>주중 숙박</b>&nbsp;&nbsp;&nbsp;&nbsp; 
											<fmt:formatNumber value="${row.d_sleep_price }" groupingUsed="true" />원</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
							</c:otherwise>
						</c:choose>
						
					</div>					
					<div class="row text-center">
						<ul style="padding:0px 200px;" class=" pagination col-12" >
						<!-- 페이지 번호 부분 -->
							${pagingImg }
						</ul>
					</div>
				</form>							
			</div>
<!-- 스크롤 따라다니는 박스설정 -->
   <script>
   $(document).ready(function() {
       
      // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
      var floatPosition = parseInt($("#map").css('top'));
      // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
    
      $(window).scroll(function() {
         // 현재 스크롤 위치를 가져온다.
         var scrollTop = $(window).scrollTop();
         var newPosition = scrollTop + floatPosition + "px";
    
         /* 애니메이션 없이 바로 따라감
          $("#floatMenu").css('top', newPosition);
          */
    
         $("#map").stop().animate({
            "top" : newPosition
         }, 500);
    
      }).scroll();
    
   });
   </script>  			

		<!-- Map Area -->
      <div class= "contact-form-area equal-height">
                            <div id="">
                 <div class="section-heading dark text-right">

            </div>
                    <form>
                       <div id="mapbox" class="row col-12">
					<!-- 네이버 지도 -->
<div id="map" style="width: 600px; height: 600px;" position: absolute;" ></div>
<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.4787503, 126.8786525),
    zoom: 10
});


<c:forEach items="${lists}" var="row" varStatus="loop">
var marker_${row.lodge_no} = new naver.maps.Marker({
   position: new naver.maps.LatLng(${row.addr_lat}, ${row.addr_long}),
   map: map,
   icon: {
       url: '../resources/common/img/icon-img/ico_pin.jpg',
       size: new naver.maps.Size(25, 34),
       scaledSize: new naver.maps.Size(25, 34),
       origin: new naver.maps.Point(0, 0),
       anchor: new naver.maps.Point(12, 34)
   }
});

var contentString_${row.lodge_no} = [
    '<div style="border:rgb(255,52,121) 1px solid; " class="iw_inner">',
    '   <h6>${row.lodge_name}</h6>',
    '</div>'
].join('');

var infowindow_${row.lodge_no} = new naver.maps.InfoWindow({
   content: contentString_${row.lodge_no}
});

naver.maps.Event.addListener(marker_${row.lodge_no}, "click", function(e) {
    if (infowindow_${row.lodge_no}.getMap()) {
        infowindow_${row.lodge_no}.close();
        
    } else {
        infowindow_${row.lodge_no}.open(map, marker_${row.lodge_no});
    }
});

</c:forEach>


</script>
<!-- 네이버 지도 끝 -->
   </div>
                  </form>

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