<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="/resources/include/yagajaTop.jsp"%>
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>    
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style>
.ui-datepicker {
   font-size: 12px;
   width: 200px;
}

.ui-datepicker select.ui-datepicker-month {
   width: 50%;
   font-size: 11px;
}

.ui-datepicker select.ui-datepicker-year {
   width: 50%;
   font-size: 11px;
}

.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:first-child a {
   color: #f00;
}

.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:last-child a {
   color: #00f;
}
</style>

<script>
$( function() { 
   var hotdeal_sday = $("#hotdeal_sday").val();
   var hotdeal_eday = $("#hotdeal_eday").val();
   $('#ch_in').datepicker({
      dateFormat : 'yy-mm-dd',
      minDate: new Date(hotdeal_sday),
      maxDate: new Date(hotdeal_eday),
      prevText : '이전 달',
      nextText : '다음 달',
      monthNamesShort : [ '1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
      dayNamesMin : [ '일', '월', '화', '수', '목','금', '토' ],
      changeMonth : true,
      changeYear : true,
      showMonthAfterYear : true,
      yearRange : 'c-5:c+5',
      showButtonPanel:true,
      currentText: '오늘',
      closeText: '닫기',
      onClose: function() {
    	    $('#ch_out').datepicker({
    	      dateFormat: 'yy-mm-dd',
    	      minDate: new Date(hotdeal_sday),
    	      maxDate: new Date(hotdeal_eday)
    	    });
    	  }// 닫기버튼의 텍스트 변경
   }); 
   
   
   $('#ch_in').datepicker('setDate', new Date());
   var myDate = $("hotdeal_sday").val(); 
	myDate = new Date();
   var prettyDate =(myDate.getMonth()+1) + '-' + myDate.getDate() + '-' +
           myDate.getFullYear();
   
   var d = new Date();
   var month = d.getMonth()+1;
   if(month >=9 ){month = "0"+month;}
   var prettyDate = d.getFullYear()+'-'+month +'-'+d.getDate();
   var prettyNextDate = d.getFullYear()+'-'+month +'-'+(d.getDate()+1);

   
});
</script>
<script type="text/javascript">
function plusOneDay(iDate)
{
   var f = document.dayFrm;
   var iDataArr = iDate.split('-');
   var choiceDay = new Date(iDataArr[0], iDataArr[1]-1, iDataArr[2]);
   choiceDay.setDate(choiceDay.getDate() + 1);

   var y = choiceDay.getYear() + 1900;
   var m = choiceDay.getMonth() + 1;
   var d = choiceDay.getDate();
   
   f.ch_out.value = y+"-0"+m+"-"+d;


  
}  
</script>
<script>
function confrm(f)
{
   var con = confirm("${dto.lodge_name}로 핫딜예약하시겠습니까?");
   
   if(con==true)
   {
      return true;
   }
   else
   {
      alert("취소되었습니다.");
      return false;
   }
}
</script>
<script type="text/javascript">
//남은시간(초) - DB에서 가져옴
var srts_${dto.hotdeal_no} = ${dto.start_remain_time_sec}

function hotdeal_reverse_time_${dto.hotdeal_no}()
{
	srts_dateVal = parseInt(srts_${dto.hotdeal_no}/(24*60*60));	//핫딜시간 남은 총 초에서 날짜 뽑기
	srts_temp_val = srts_${dto.hotdeal_no}%(24*60*60);			//핫딜시간 남은 초 담기
	srts_hourVal = parseInt(srts_temp_val/(60*60));				//핫딜시간 남은 총 초에서 시간 뽑기
	srts_temp_val = srts_temp_val%(60*60);						//핫딜시간 남은 초 담기
	srts_minVal = parseInt(srts_temp_val/(60));					//핫딜시간 남은 총 초에서 분 뽑기
	srts_secVal = srts_temp_val%(60);							//핫딜시간 남은 초 담기



		document.getElementById("diffTime_${dto.hotdeal_no}").innerHTML = "<p style='color:white; font-size:25px; padding-top:2px; font-weight:bold;'><i class='far fa-clock'></i> 핫딜 진행중 : "+srts_dateVal+"일 "+srts_hourVal+"시간 "+srts_minVal+"분 "+srts_secVal+"초</p>";
		//호출중지
		//화면리플레쉬
 
		if(srts_${dto.hotdeal_no}<=0)
		{
			document.getElementById("diffTime_${dto.hotdeal_no }").innerHTML = "<p style='color:white; font-weight:bold; font-size:27px;'>입찰이 종료되었습니다</p>";
		}
		else
		{
			srts_${dto.hotdeal_no}--;
		}
	
}

window.onload = function()
{	
	
	//핫딜시작까지 남은시간 가져오기
	srts_${dto.hotdeal_no} = document.getElementById("srts_${dto.hotdeal_no}").value;
	
	

	if(srts_${dto.hotdeal_no} > 0)
	{
		setInterval("hotdeal_reverse_time_${dto.hotdeal_no}()" ,1000);	
	}
	else
	{
		document.getElementById("diffTime_${dto.hotdeal_no }").innerHTML = "<p style='color:red; font-weight:bold;'>입찰이 종료되었습니다</p>";
	}

}
</script>

<body>
	<!-- 객실타입 이미지 넣는곳 -->
    <div class="breadcumb-area height-700 bg-img bg-overlay" style="background-image: url(../resources/common/img/room-img/${dto.room_photo});">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcumb-content">
                    	<div class="map-ratings-review-area d-flex">
                          	<input type="hidden" id="remain_time_sec_${dto.hotdeal_no }" value="${dto.remain_time_sec }" />
				            <input type="hidden" id="srts_${dto.hotdeal_no }" value="${dto.start_remain_time_sec }" />  
                           <div style="background-color:#FF3479; color:white; width:460px; height:60px; font-size:27px; text-align:center; padding-top:8px; border-radius:15px;" id="diffTime_${dto.hotdeal_no }">
                    			<i class="far fa-clock"></i>&nbsp;<b>남은시간 : ${dto.start_timeView }</b>
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
						<form action="../reser/hotdealreservationProc.do" name="dayFrm" onsubmit="return confrm(this);" id="dayFrm">
						<div class="row">
						
							<div class="col-6 col-lg-6" style="font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;" >
								<span style="font-size:20px; font-weight:bold; color:black;">물품번호 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:grey;">${dto.hotdeal_no}</span>
							</div>
								 
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold; color:black;">현재 남은 수량 :</span>&nbsp;&nbsp;
								<span style="font-size:20px; color:red;">${dto.hotdeal_sell }개</span>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
								<span style="font-size:20px; font-weight:bold;">숙소명 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">${dto.lodge_name }</span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold; color:black;">핫딜 특가 :</span>&nbsp;&nbsp;
								<span style="font-size:12px; color:gray; text-decoration:line-through">
								<fmt:formatNumber value="${dto.w_sleep_price }" groupingUsed="true"/>원</span>
								<span style="font-size:20px; color:red;">
								<fmt:formatNumber value="${dto.hotdeal_price }" groupingUsed="true"/>원</span>
							</div> 
						</div>	
						<hr />
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
								<span style="font-size:20px; font-weight:bold;">숙소 분류 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">${dto.lodge_type }</span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold;">객실 타입 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">${dto.room_type }</span>
							</div> 
						</div>	
						<hr />
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
								<span style="font-size:20px; font-weight:bold;">핫딜 시작일 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">${dto.hotdeal_stime_ch }</span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold;">핫딜 종료일 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:gray;">${dto.hotdeal_etime_ch }</span>
							</div> 
						</div>	
						<hr />		
						<div class="row">
							<div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;" >
								<span style="font-size:20px; font-weight:bold;">사용 시작일 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:blue;">${dto.hotdeal_check_in} </span>
							</div>
							<div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
								<span style="font-size:20px; font-weight:bold;">사용 종료일 :</span>&nbsp;&nbsp;
								<span style="font-size:17px; color:blue;">${dto.hotdeal_check_out }</span>
							</div>
						</div>	
						<hr />
                        <div class="single-listing-nav">
                            <nav>
                                <ul id="listingNav">
                                    <li class="active"><a href="#paycheck">필수입력사항</a></li>
                                    <li class="#"><a href="#review">후기</a></li>
                                    <li><a href="#lomap">위치</a></li>
                                </ul>
                            </nav>
                        </div>
						         <div class="overview-content mt-50" id="overview">
                  <h5>필수입력사항</h5>
                     <form action="/reser/hotdealreservationProc.do" name="dayFrm" onsubmit="return confrm(this);" id="dayFrm">
                     
	                     <input type="hidden" name="hotdeal_price" id="hotdeal_price" value="${dto.hotdeal_price }" />    
	                     <input type="hidden" name="payment_price" id="payment_price" value="${dto.hotdeal_price }" /> 
						 <input type="hidden" name="hotdeal_no" id="hotdeal_no" value="${dto.hotdeal_no }" />
					 	 <input type="hidden" name="member_no" id="member_no" value="${sessionScope.siteUserInfo.member_no}" /> 
					 	 <input type="hidden" name="room_no" id="room_no" value="${dto.room_no }" />
						 <input type="hidden" name="m_point" id="m_point" value="${sessionScope.siteUserInfo.m_point}" />
						 <input type="hidden" name="lodge_no" id="lodge_no" value="${dto.lodge_no }" />
						 <input type="hidden" name="hotdeal_sday" id="hotdeal_sday" value="${dto.hotdeal_sday}" />
						 <input type="hidden" name="hotdeal_eday" id="hotdeal_eday" value="${dto.hotdeal_eday }" />
						 <input type="hidden" name="reser_type" id="reser_type" value="핫딜"  />   
						 <input type="hidden" name="hotdeal_sell" id="hotdeal_sell" value="${dto.hotdeal_sell }"  />   
                     
                          <div class="row mt-4" style="vertical-align:middle;">
                          <span style="font-size:12px; padding-left:20px; vertical-align:middle; margin-top:5px;">
                             예약자명
                          </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <input type="text" id="reser_name" name="reser_name" style="width:150px; border-right:black 0px solid; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 1px solid;"> &nbsp;&nbsp;
                          <span style="font-size:12px; padding-left:15px; margin-top:5px;">
                             <span style="color:red; font-weight:bold; font-size:14px;" >※</span>예약자명은 실명으로 기입해주세요.
                          </span>
                              </div>
                       <div class="row mt-4">
                          <span style="font-size:12px; padding-left:20px; vertical-align:middle; margin-top:4px;">
                             방문형태
                          </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <label><input type="radio" id="visit_type" name="visit_type" value="차량" style="margin-top:-1px; vertical-align:middle; margin-right:3px;" ><b>차량</b></label> &nbsp;&nbsp;
                          <label><input type="radio" id="visit_type" name="visit_type" value="도보"><b>도보</b></label> &nbsp;&nbsp;
                          <span style="font-size:12px; padding-left:15px; margin-top:4px;">
                             <span style="color:red; font-weight:bold; font-size:14px;">※</span>주차장 이용을 안내해 드립니다.
                          </span>
                       </div>
                       <hr/>
                       <h6 style="padding-top:20px;">결제 선택</h6>
                       <div class="row mt-3" style="margin-left:5px;">
                       		<input type="hidden" id="reser_type" name="reser_type" value="hotdeal" />
                          <label><input type="radio" id="payment_type" name="payment_type" value="card" style="mrgin-top:1px; vertical-align:middle; margin-right:3px;" ><b style="font-size:12px;">&nbsp;카드결제</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
                          <label><input type="radio" id="payment_type" name="payment_type" value="naverpay" style="margin-top:1px; vertical-align:middle; margin-right:3px;"><b style="font-size:12px;">&nbsp;네이버페이</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
                          <label><input type="radio" id="payment_type" name="payment_type" value="m_point" style="margin-top:1px; vertical-align:middle; margin-right:3px;" checked><b style="font-size:12px;">&nbsp;마일리지</b></label> &nbsp;&nbsp;  
                          <span style="font-size:12px; padding-left:15px; margin-top:5px;">
                          	<span style="color:red; font-weight:bold;  font-size:14px;" >※</span>
                          	현재 마일리지로만 이용가능합니다.
                          </span>
                              </div>
                          </div>
                       <hr/>
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
                                    <h6>작성자 닉네임</h6>
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
						<div class="book-a-table-widget" style="margin-top:-70px; width:300px; border-radius:15px; background-color:rgb(255,52,121);">
								<div>
                                 <h7 style="color:white;">체크인</h7><br />
                                 <input type="text" id="ch_in" name="check_in" class="form-control" onchange="plusOneDay(this.value);" value=""/>
                              </div>
                              <br />   
                             <div>
                                 <h7 style="color:white;">체크아웃</h7><br />
                                 <input type="text" id="ch_out" name="check_out" class="form-control" style="background-color:white" readonly  value=""/>
                              </div>
                              <hr style="border:solid 1px white;"/>
								<b style="color:white; font-size:1.5em;">주의사항(필독)</b>
                        		<hr style="border:solid 1px white;"/>
                        		<div style="color:white; font-size:10px; padding-top:10px;">
                        			※핫딜이 진행되는 시간에 구매를 하셔야 숙박예약이 가능합니다<br />
                        			<br />
                        			※핫딜숙박예약은 사용시작일과 마감일 사이에서 연박없이 가능합니다<br />
                        			<br />
                        			※수량이 모두 판매되면 조기 마감될 수 있습니다.<br />
                        			<br />
                        			※예약 시 적립되는 마일리지는 없습니다.<br /> 
                        			&nbsp;&nbsp;&nbsp;
                        		</div>
                        		<hr style="border:solid 1px white;"/>
	                                
	                                
                        		<c:choose>
                        			<c:when test="${not empty sessionScope.siteUserInfo }" >
                        			<div class="row">
	                                   <div class="col-6 col-lg-6" style="color:black; font-size:16px;">
	                                      <b>보유 마일리지:</b>
	                                   </div>
	                                   <div class="col-6 col-lg-6" style="color:black; font-size:17px; text-align:right" id="hotdeal_price">
	                                      <b style="text-align:right"><fmt:formatNumber value="${sessionScope.siteUserInfo.m_point}" groupingUsed="true"/>원</b>
	                                   </div>
	                                </div> 	 
                        			<div class="row">
	                                   <div class="col-6 col-lg-6" style="color:black; font-size:16px;">
	                                      <b>결제 금액:</b>
	                                   </div>
	                                   <div class="col-6 col-lg-6" style="color:black; font-size:17px; text-align:right" id="hotdeal_price">
	                                      <b ><fmt:formatNumber value="${dto.hotdeal_price}" groupingUsed="true"/>원</b>
	                                   </div>
	                                </div>
	                                <hr style="border:solid 1px white;"/>
                                <button type="submit"  class="form-control" style="margin-top:15px; cursor:pointer"><b>핫딜구매하기</b></button>
                            	  </form>
                        			</c:when>
	                        		<c:otherwise>
                                <button type="button" onclick="location.href='../member/login.do';" class="form-control"  style="margin-top:15px; text-size:2em; cursor:pointer"><b>로그인 후 이용가능</b></button>
	                        		</c:otherwise>
                        		</c:choose> 
                           </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- ***** Single Listing Area End ***** -->
	<%@include file="/resources/include/yagajaBottom.jsp"%>

	
</body>

</html>