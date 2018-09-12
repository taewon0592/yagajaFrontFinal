<%@page import="map.MapDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html lang="en">
<%@include file="/resources/include/yagajaTop.jsp"%>
<link type="text/css" rel="stylesheet" href="https://www.yanolja.com/common.css" /> 
<%
//한글처리
request.setCharacterEncoding("UTF-8");
//
List<MapDTO> lists = (List<MapDTO>) request.getAttribute("mapdto");
ArrayList<MapDTO> search_local = (ArrayList<MapDTO>) request.getAttribute("search_local");

System.out.println(search_local);


%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=mtzrJX6prcOqtj1iSAII&submodules=geocoder">
</script>
<body>


    <!-- ***** Breadcumb Area Start ***** -->
    <div class="breadcumb-area height-500 bg-img bg-overlay" style="background-image: url(../resources/common/img/room-img/${lodge_photo});">
        <div class="container">
            <div class="row">
                <div class="col-12">
                 
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Breadcumb Area End ***** -->

    <!-- ***** Single Listing Area Start ***** -->
    <section class="dorne-single-listing-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Single Listing Content -->
                <div class="col-12 col-lg-8">
                    <div class="single-listing-content">
   <!-- 지도용 위도 경도  -->                                 
      <input type="hidden" id="lat" value="${addr_lat }" />            
      <input type="hidden" id="long" value="${addr_long }" />
                        <div class="listing-title">
                            <h2>${lodge_name }</h2>
                            <h7>${addr_common } ${addr_detail }</h7>
                            <br />
                            <h7>${lodge_tel }</h7>
                            <div class="detail-info">
                               <i class="tag-primary">${lodge_tag }</i>
                            </div>
                            <div class="single-listing-nav">
                               <nav>
                                  <ul  class="thema-list">
                                  <div class="row">
                                  <c:forEach items="${telArr}"  var="row"  >
                                     <div class="col-md-2">
                                        <li class="thema-item">
                                           <img src="../resources/common/img/thema-img/${row}.png" alt="커플pc" />
                                           <span style="font-size:10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${row }</span>
                                        </li>
                                     </div>
                                  </c:forEach>
                                     
                                  </div>
                                  </ul>
                               </nav>
                            </div> 
                            
                            <br /><br /><br />
                            <div class="place-room">
                               <table style="width:100%; height:300px;">
                               <c:forEach items="${lodgeLists }" var="row" >
                                  <form action="../reser/reservationView.do" method="get" name="reserFrm">
	                                  <tr>
	                                     <td rowspan="5"><img style="width:350px; height:250px; padding:5px; margin:5px" src="../resources/common/img/room-img/${row.room_photo}" /></td>
	                                     <td colspan="2" style="font-size:20px"text-style="bold">${row.room_type }</td>
	                                     <input type="hidden" value="${row.lodge_no }" name="lodge_no" />
	                                     <input type="hidden" value="${row.room_no }" name="room_no" />
	                                     
	                                  </tr>
	                                  <tr>
	                                     <td colspan="2" style="font-size:12px; vertical-align:top">기준 ${row.room_person } 명 (최대 ${row.room_person } 명)</td>
	                                  </tr>
	                                  <tr>
	                                     <td style="font-size:12px"><input type="radio" name="select" value="rent" /><font color="red">주말</font> / 주중 대실</td>
	                                     <td style="font-size:20px; text-align:right"><font color="red"><b>${row.w_rent_price }</b></font> / <b>${row.d_rent_price }</b></td>
	                                  </tr>
	                                  <tr>
	                                     <td style="font-size:12px">
	                                        <input type="radio" name="select" value="sleep" /><font color="red">주말</font> / 주중 숙박
	                                     </td>
	                                     <td style="font-size:20px; text-align:right"><font color="red"><b>${row.w_sleep_price }</b></font> / <b>${row.d_sleep_price }</b> </td>
	                                  </tr>
	                                  <tr>
	                                     <td colspan="2">
	                                        <button type="submit" class="btn btn-danger" style="width:100%; text-align:center">예약 하기</button>
	                                     </td>
	                                  </tr>
                                  </form>
                               </c:forEach>
                                  
                               </table>
                            </div>
                            
                        </div>
<!-- //////////////////////////////////////////////////////////// -->
                        <div class="single-listing-nav">
                            <nav>
                                <ul id="listingNav">
                                    <li class="active"><a href="#review">Reviews</a></li>
                                </ul>
                            </nav>
                        </div>


                        <div class="listing-reviews-area mt-100" id="review">
                            <h4>reviews</h4>
                            <div class="single-review-area">
                                <div class="reviewer-meta d-flex align-items-center">
                                    <img src="img/clients-img/1.jpg" alt="">
                                    <div class="reviewer-content">
                                        <div class="review-title-ratings d-flex justify-content-between">
                                            <h5>“The best Burger in town”</h5>
                                            <div class="ratings">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                            </div>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ac nibh sed mi ullamcorper rhoncus. Curabitur pulvinar vel augue sit amet vestibulum. Proin tempus lacus porta lorem blandit aliquam eget quis ipsum. Vivamus accumsan consequat ligula non volutpat.</p>
                                    </div>
                                </div>
                                <div class="reviewer-name">
                                    <h6>Christinne Smith</h6>
                                    <p>12 November 2017</p>
                                </div>
                            </div>
                            <div class="single-review-area">
                                <div class="reviewer-meta d-flex align-items-center">
                                    <img src="img/clients-img/1.jpg" alt="">
                                    <div class="reviewer-content">
                                        <div class="review-title-ratings d-flex justify-content-between">
                                            <h5>“Quality ingredients”</h5>
                                            <div class="ratings">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                                <img src="img/clients-img/star-fill.png" alt="">
                                                <img src="img/clients-img/star-unfill.png" alt="">
                                            </div>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ac nibh sed mi ullamcorper rhoncus. Curabitur pulvinar vel augue sit amet vestibulum. Proin tempus lacus porta lorem blandit aliquam eget quis ipsum. Vivamus accumsan consequat ligula non volutpat.</p>
                                    </div>
                                </div>
                                <div class="reviewer-name">
                                    <h6>Michael Brown</h6>
                                    <p>12 November 2017</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<!-- ///////////////////////////////////////////////////////////////// -->
                <!-- Listing Sidebar -->
                <div class="col-12 col-md-8 col-lg-4">
                    <div class="listing-sidebar">

                        <!-- Listing Verify -->
                        <!-- 네이버 지도 -->
<div id="map" style="width: 400px; height: 600px;"></div>
<script>
var addr_lat = document.getElementById("lat").value;
var addr_long = document.getElementById("long").value;
var mapOptions = {
    center: new naver.maps.LatLng(addr_lat, addr_long),
    zoom: 12
};

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(addr_lat, addr_long),
    zoom: 12
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(addr_lat, addr_long),
    map: map
});

</script>
              
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Single Listing Area End ***** -->

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