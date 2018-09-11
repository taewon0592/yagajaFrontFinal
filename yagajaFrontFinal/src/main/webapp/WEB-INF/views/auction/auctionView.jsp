<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="/resources/include/yagajaTop.jsp"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">


<body>
	<!-- 객실타입 이미지 넣는곳 -->
    <div class="breadcumb-area height-700 bg-img bg-overlay" style="background-image: url(../resources/common/img/room-img/room_type.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcumb-content">
                    	<div class="map-ratings-review-area d-flex">
                           <div style="background-color:#FF3479; color:white; width:440px; height:60px; font-size:30px; text-align:center; padding-top:8px; border-radius:15px;">
                    			<i class="far fa-clock"></i>&nbsp;<b>남은시간 :</b> 18시간 47분 25초
                    		</div>
                        </div>
                    </div>
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
						<div class="row">
							<div class="col-12 col-lg-8" style="font-weight:bold;" >
								<span style="font-size:20px; font-weight:bold;">물품번호 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">123456</span>
							</div>
						</div> 
						<hr />
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
								<span style="font-size:20px; font-weight:bold;">숙소명 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">야가자모텔</span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold;">객실단가 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">120,000원</span>
							</div> 
						</div>	
						<hr />
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
								<span style="font-size:20px; font-weight:bold;">숙소분류 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">모텔</span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold;">객실타입 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">일반실</span>
							</div> 
						</div>	
						<hr />
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
								<span style="font-size:20px; font-weight:bold;">경매시작일 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">2018-10-12 00:00:00</span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold;">경매종료일 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">2018-10-13 00:00:00</span>
							</div> 
						</div>	
						<hr />		
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;" >
								<span style="font-size:20px; font-weight:bold;">입실일 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:blue;">2018-12-24 20:00:00</span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold;">퇴실일 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:blue;">2018-12-25 14:00:00</span>
							</div>
						</div>	
						<hr />
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;" >
								<span style="font-size:20px; font-weight:bold;">시작가 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:red;">15,000마일리지</span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold;">입찰단위 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:red;">1,000마일리지</span>
							</div>
						</div>	
						<hr />		
						 
                        <div class="single-listing-nav">
                            <nav>
                                <ul id="listingNav">
                                    <li class="active"><a href="#overview">필수입력사항</a></li>
                                    <li><a href="#menu">취소규정 및 약관동의</a></li>
									<li><a href="#review">후기</a></li>
                                </ul>
                            </nav>
                        </div>

                        <div class="overview-content mt-50" id="overview">
						<h5>필수입력사항</h5>
                            <div class="row mt-4" style="vertical-align:middle;">
								<span style="font-size:12px; padding-left:20px; vertical-align:middle; margin-top:5px;">
									예약자명
								</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="reser_name" name="reser_name" style="width:150px; border-right:black 0px solid; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 1px solid;"> &nbsp;&nbsp;
								<span style="font-size:12px; padding-left:15px; margin-top:5px;">
									예약자명은 실명으로 기입해주세요.
								</span>
                            </div>
							<div class="row mt-4">
								<span style="font-size:12px; padding-left:20px; vertical-align:middle; margin-top:4px;">
									방문형태
								</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label><input type="radio" id="visit_type" name="visit_type" value="차량" style="margin-top:-1px; vertical-align:middle; margin-right:3px;" ><b>차량</b></label> &nbsp;&nbsp;
								<label><input type="radio" id="visit_type" name="visit_type" value="도보"><b>도보</b></label> &nbsp;&nbsp;
								<span style="font-size:12px; padding-left:15px; margin-top:4px;">
									주차장 이용을 안내해 드립니다.
								</span>
                            </div>
							<hr/>
							
							<h6 style="padding-top:20px;">결제 선택</h6>
							<div class="row mt-3" style="margin-left:5px;">
								<label><input type="radio" id="visit_type" name="visit_type" value="카드결제" style="mrgin-top:1px; vertical-align:middle; margin-right:3px;" ><b style="font-size:12px;">&nbsp;카드결제</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
								<label><input type="radio" id="visit_type" name="visit_type" value="네이버페이" style="margin-top:1px; vertical-align:middle; margin-right:3px;"><b style="font-size:12px;">&nbsp;네이버페이</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
						<hr/>

                        <div class="listing-menu-area mt-50" id="menu">
                            <h4 style="margin-bottom:10px;">취소 규정 및 약관동의 </h4>
                            <input type="checkbox" id="ck", name="ck" style="padding-top:2px; vertical-align:middle;">
							<span style="font-size:12px;">취소규정 및 약관에 모두 동의합니다.</span>
							&nbsp;&nbsp;&nbsp;
							<span style="font-size:12px; padding-bottom:30px;">개인정보 수집/이용 약관, 개인정보 제3자 제공 약관을 확인하였으며 이에 동의합니다.</span>
							<br/><br/>
							<div class="row" style="color:white; padding-left:20px;">
								<div class="col-6 col-lg-6"; style="text-align:center; border:black 1px solid; background-color:#756d6d;" >
								취소기준일
								</div>
								<div class="col-6 col-lg-6"; style="text-align:center; border:black 1px solid; background-color:#756d6d;">
								취소수수료
								</div>
							</div>
							<div class="row" style="padding-left:20px;" >
								<div class="col-6 col-lg-6"; style="text-align:center; border:black 1px solid;">
								입실 1일전 까지
								</div>
								<div class="col-6 col-lg-6"; style="text-align:center; border:black 1px solid;">
								없음
								</div>
							</div>
							<div class="row" style="padding-left:20px; margin-bottom:10px;" >
								<div class="col-6 col-lg-6"; style="text-align:center; border:black 1px solid;">
								입실일 및 No-Show
								</div>
								<div class="col-6 col-lg-6"; style="text-align:center; border:black 1px solid;">
								환불불가
								</div>
							</div>
							<ul style="font-size:12px;">
								<li>ㆍ연박의 취소수수료는 일할 계산합니다.</li>
								<li>ㆍ취소수수료는 현금 결제액, 포인트액 순으로 차감됩니다..</li>
								<li>ㆍ취소수수료가 실 결제금액(현금+포인트)를 초과하는경우,초과금액을 부과하지 않습니다.</li>
								<li>ㆍ투숙일 이전 취소 시에는 쿠폰이 반환되며, 투숙일 이후에는 반환되지 않습니다.</li>
								<li>ㆍ예약변경을 위한 취소시에도 취소수수료가 부과되오니 양해하여 주시기 바랍니다.</li>
								<li>ㆍ노쇼(No-Show:사전 역락없이 예약된 숙소를 이용하지 않음)의 경우 요금이 100% 정산 청구됩니다.</li>
								<li>ㆍ실시간예약의 특성상 하나의 객실에 중복예약이 발생될수 있으며, 이경우 먼저 결제된 예약건에 우선권이 있습니다.</li>
								<li>ㆍ성수기 요금이 확정되지 않았거나 요금표가 잘못 등록된 경우 예약이 취소 될 수 있습니다.</li>
								<li>ㆍ펜션 예약은 24시간 이내 확정됩니다.</li>
								<li>ㆍ모텔은 예약완료 후 15분 이내 고객센터를 통해 전액취소가 가능합니다.</li>
								<li>ㆍ호텔은 예약완료 후 10분 이내 고객센터를 통해 전액취소가 가능합니다.</li>
							</ul>
                        </div>

                        <div class="listing-reviews-area mt-100" id="review">
                            <h4>후기</h4>
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
                                        <p>내용입니다.</p>
                                    </div>
                                </div>
                                <div class="reviewer-name">
                                    <h6>작성장 닉네임</h6>
                                    <p>작성일자</p>
                                </div>
                            </div>
                        </div>

                        <div class="location-on-map mt-50" id="lomap">
                            <h4>Location on map</h4>
                            <div class="location-map">
                                <div id="locationMap"></div>
                            </div>
                        </div>

                    </div>
                </div>

				
                <!-- Listing Sidebar -->
                <div class="col-12 col-md-8 col-lg-4">
                    <div class="listing-sidebar">

<!--                         Listing Verify
                        <div class="listing-verify">
                            <a href="#" class="btn dorne-btn w-100"><i class="fa fa-check pr-3"></i> Verified Listing</a>
                        </div> -->

                        <!-- Book A Table Widget -->
						<div class="book-a-table-widget" style="margin-top:-70px; width:250px; border-radius:15px;">

                        		<div>
                        			<h7 style="color:white;">현재입찰가</h7><br />
                        			<input type="text" value="25,000마일리지" style="width:140px;" readonly="true"/>
                        		</div>
                        		<br />	
                        		<div>
                        			<h7 style="color:white;">입찰금액</h7><br />
                        			<select name="" id="">
                        				<option value="26000">26,000마일리지</option>
                        				<option value="27000">27,000마일리지</option>
                        				<option value="28000">28,000마일리지</option>
                        				<option value="29000">29,000마일리지</option>
                        				<option value="30000">30,000마일리지</option>
                        			</select>
                        		</div>
                        		<hr style="border:solid 1px white;"/>
                        		<div style="color:white; font-size:10px; padding-top:10px;">
                        			※입찰금액은 입찰단위의 5배수까지<br />
                        			&nbsp;&nbsp;&nbsp;가능합니다. <br />
                        			※경매완료 후 마일리지의 2배수를 제외한 <br /> 
                        			&nbsp;&nbsp;&nbsp;나머지 금액만 결제됩니다.
                        		</div>
                        		<hr style="border:solid 1px white;"/> 

                                <button type="submit" class="btn dorne-btn bg-white text-dark" style="margin-top:15px;">입찰하기</button>
                            </form>
                           </div>
                        </div>
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