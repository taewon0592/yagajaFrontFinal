<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
   uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   
   $('#ch_in').datepicker({
      dateFormat : 'yy-mm-dd',
      minDate: 0,
      maxDate: 60,
      prevText : '이전 달',
      nextText : '다음 달',
      monthNamesShort : [ '1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
      dayNamesMin : [ '일', '월', '화', '수', '목','금', '토' ],
      changeMonth : true,
      changeYear : true,
      showMonthAfterYear : true,
      yearRange : 'c-5:c+5'
   });
   
   
   
   
   $('#ch_in').datepicker("option","maxDate", $("#ch_out").val());
   $('#ch_in').datepicker("option","onClose",
      function(selectedDate){
         $("#ch_out").datepicker(
            "option", "minDate", selectedDate);
      });
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


   $.ajax({
      url : '../reser/dateformat.do',
      dateType : "json",
      type : 'get',
      contentType : "text/html; charset:utf-8",
      data:
      {
         nowDay : $('#ch_in').val()   
      },
      success : function(d)  
      {
         var obj = JSON.parse(d)
         
         //alert("성공:"+obj.dayResult);
         
         if(obj.dayResult=="금" || obj.dayResult=="토")
         {
            <c:choose>
               <c:when test="${type eq 'rent'}">
                  $('#pay_price').html("<b><fmt:formatNumber value='${vo.w_rent_price }' groupingUsed='true'/>원</b>");
                  $('#m_point').html("<b><fmt:formatNumber value='${vo.w_rent_price*0.05 }' groupingUsed='true'/>point</b>");
                  $('#payment_price_sub').val(${vo.w_rent_price});
                  $('#m_point_sub').val(${vo.w_rent_price*0.05});
               </c:when>
               <c:otherwise>
                  $('#pay_price').html("<b><fmt:formatNumber value='${vo.w_sleep_price }' groupingUsed='true'/>원</b>");
                  $('#m_point').html("<b><fmt:formatNumber value='${vo.w_sleep_price*0.05 }' groupingUsed='true'/>point</b>");
                  $('#payment_price_sub').val(${vo.w_sleep_price});
                  $('#m_point_sub').val(${vo.w_sleep_price*0.05});
               </c:otherwise>
            </c:choose>
         }
         else
         {
            <c:choose>
               <c:when test="${type eq 'rent'}">
                  $('#pay_price').html("<b><fmt:formatNumber value='${vo.d_rent_price }' groupingUsed='true'/>원</b>");
                  $('#m_point').html("<b><fmt:formatNumber value='${vo.d_rent_price*0.05 }' groupingUsed='true'/>point</b>");
                  $('#payment_price_sub').val(${vo.d_rent_price});
                  $('#m_point_sub').val(${vo.d_rent_price*0.05});
               </c:when>
               <c:otherwise>
                  $('#pay_price').html("<b><fmt:formatNumber value='${vo.d_sleep_price }' groupingUsed='true'/>원</b>");
                  $('#m_point').html("<b><fmt:formatNumber value='${vo.d_sleep_price*0.05 }' groupingUsed='true'/>point</b>");
                  $('#payment_price_sub').val(${vo.d_sleep_price});
                  $('#m_point_sub').val(${vo.d_sleep_price*0.05});
               </c:otherwise>
            </c:choose>
         }
         
      },
      error : function(e)
      {
         alert("실패"+e.status);
      }
   });
}  
</script>
<script>
function confrm(f)
{
   var con = confirm("${vo.lodge_name}의 호텔을 정말로 예약하시겠습니까?");
   
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


<body>
   <!-- 객실타입 이미지 넣는곳 -->
    <div class="breadcumb-area height-700 bg-img bg-overlay" style="background-image: url(../resources/common/img/room-img/${vo.room_photo});">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcumb-content">
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

                        <div class="listing-title">
                            <h4>${vo.room_type }</h4>
                     <h6 style="padding-bottom:10px;">${vo.lodge_name }</h6>
                     <h6 style="padding-bottom:10px; color:grey">${vo.addr_common } ${vo.addr_detail }</h6>
                     <h6 style="padding-bottom:10px;">기준 ${vo.room_person }명(최대 ${vo.room_person }명)</h6>
                        </div>
                  
                  <c:choose>
               <c:when test="${type eq 'rent' }" >
                        <!-- 대실예약 -->
                        <div class="row">
                           <div class="col-8 col-lg-8">
                              <span style="font-size:25px; color:red; font-weight:bold;">주말</span>
                              <span style="font-size:25px; font-weight:bold;">/주중</span>
                              <span style="font-size:25px; font-weight:bold; padding-left:10px; padding-right:10px;">대실</span>
                              <span style="background-color:rgb(255,52,121); color:white;">예약가능</span>
                              <!-- <span style="background-color:rgb(255,52,121); color:white;">예약불가</span> -->
                           </div>
                           <div class="col-4 col-lg-4" style="text-align:right; margin-top:5px;">
                              <span style="text-align:right; font-size:20px; font-weight:bold; padding-top:10px; color:red;"><b><fmt:formatNumber value="${vo.w_rent_price }" groupingUsed="true"/>원</b></span>
                              <span style="text-align:right; font-size:20px; font-weight:bold; padding-top:10px;">&nbsp;/&nbsp;<b><fmt:formatNumber value="${vo.d_rent_price }" groupingUsed="true"/>원</b></span>
                           </div>                      
                        </div>
                        <hr />
                        <br/>
                     </c:when> 
                     <c:otherwise>
                        <!-- 숙박예약 -->
                        <div class="row" >
                           <div class="col-8 col-lg-8">
                              <span style="font-size:25px; color:red; font-weight:bold;">주말</span>
                              <span style="font-size:25px; font-weight:bold;">/주중</span>
                              <span style="font-size:25px; font-weight:bold; padding-left:10px; padding-right:10px;">숙박</span>
                              <span style="background-color:rgb(255,52,121); color:white;">예약가능</span>
                              <!-- <span style="background-color:rgb(255,52,121); color:white;">예약불가</span> -->
                           </div>
                           <div class="col-4 col-lg-4" style="text-align:right; margin-top:5px;">
                              <span style="text-align:right; font-size:20px; padding-top:10px; color:red;"><b><fmt:formatNumber value="${vo.w_sleep_price }" groupingUsed="true"/>원</b></span>
                              <span style="text-align:right; font-size:20px; padding-top:10px;">&nbsp;/&nbsp;<b><fmt:formatNumber value="${vo.d_sleep_price }" groupingUsed="true"/>원</b></span>
                           </div>                      
                        </div>
                        <hr />
                     </c:otherwise>
                  </c:choose>
                   
                        <div class="single-listing-nav">
                            <nav>
                                <ul id="listingNav">
                                    <li class="active"><a href="#overview">필수입력사항</a></li>
                                    <li><a href="#menu">취소규정 및 약관동의</a></li>
                           
                                </ul>
                            </nav>
                        </div>

                        <div class="overview-content mt-50" id="overview">
                  <h5>필수입력사항</h5>
                     <form action="../reser/reservationProc.do" name="dayFrm" onsubmit="return confrm(this);" id="dayFrm">
                     <input type="hidden" value="${vo.room_no }" name="room_no" />
                     <input type="hidden" value="${vo.lodge_no }" name="lodge_no" />
                     <input type="hidden" value="${sessionScope.siteUserInfo.member_no }" name="member_no" />
                     <input type="hidden" value="${sessionScope.siteUserInfo.m_point }" name="prev_m_point"/>
                     <input type="hidden" value="${sessionScope.siteUserInfo.phone }" name="phone" />
                     
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
                          <label><input type="radio" id="payment_type" name="payment_type" value="card" style="mrgin-top:1px; vertical-align:middle; margin-right:3px;" ><b style="font-size:12px;">&nbsp;카드결제</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
                          <label><input type="radio" id="payment_type" name="payment_type" value="naverpay" style="margin-top:1px; vertical-align:middle; margin-right:3px;"><b style="font-size:12px;">&nbsp;네이버페이</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
                          <label><input type="radio" id="payment_type" name="payment_type" value="m_point" style="margin-top:1px; vertical-align:middle; margin-right:3px;"><b style="font-size:12px;">&nbsp;마일리지</b></label> &nbsp;&nbsp;
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
                  <div class="book-a-table-widget" style="margin-top:-70px; width:250px; background-color:rgb(255,52,121); border-radius:15px;">

                              <div>
                                 <h7 style="color:white;">체크인</h7><br />
                                 <input type="text" id="ch_in" name="check_in" onchange="plusOneDay(this.value);" value=""/>
                              </div>
                              <br />   
                              <div>
                                 <h7 style="color:white;">체크아웃</h7><br />
                                 <input type="text" id="ch_out" name="check_out" readonly="true" value=""/>
                              </div>
                              <hr style="border:solid 1px white;"/>
                              <div class="row">
                                 <div class="col-7 col-lg-7" style="color:white; font-size:12px;">
                                    적립 포인트 :
                                 </div>
                                 <c:choose>
                                    <c:when test="${type eq 'rent' }">
                                         <div class="col-5 col-lg-5" style="color:white; font-size:12px; padding-right:10px;" id="m_point">
                                             <fmt:formatNumber value="${vo.d_rent_price*0.05 }" groupingUsed="true"/>point
                                          </div>
                                          <input type="hidden" name="m_point" id="m_point_sub" value="${vo.d_rent_price*0.05 }" />    
                                       </div>
                                       <div style="color:white; font-size:10px; padding-top:10px;">
                                          ※결제 금액이 1만원 미만 또는 당일예약일 <br />
                                           &nbsp;&nbsp; 경우 포인트가 적립되지 않습니다. <br />
                                          ※포인트는 로그인 후 결제할 경우에 <br /> 
                                          &nbsp;&nbsp;적립됩니다.
                                       </div>
                                       <hr style="border:solid 1px white;"/>
                                       <div class="row">
                                          <div class="col-6 col-lg-6" style="color:black; font-size:16px;">
                                             <b>결제 금액 :</b>
                                          </div>
                                          <div class="col-6 col-lg-6" style="color:black; font-size:14px;" id="pay_price">
                                             <b><fmt:formatNumber value="${vo.d_rent_price }" groupingUsed="true"/>원</b>
                                          </div>
                                          <input type="hidden" name="payment_price" id="payment_price_sub" value="${vo.d_rent_price }" />    
                                       </div>
                                    </c:when>
                                    <c:otherwise>
                                          <div class="col-5 col-lg-5" style="color:white; font-size:12px; padding-right:10px;" id="m_point">
                                             <b><fmt:formatNumber value="${vo.d_sleep_price*0.05 }" groupingUsed="true"/>point</b>
                                          </div>
                                          <input type="hidden" name="m_point" id="m_point_sub" value="${vo.d_sleep_price*0.05 }" />    
                                       </div>
                                       <div style="color:white; font-size:10px; padding-top:10px;">
                                          ※결제 금액이 1만원 미만 또는 당일예약일 <br />
                                           &nbsp;&nbsp; 경우 포인트가 적립되지 않습니다. <br />
                                          ※포인트는 로그인 후 결제할 경우에 <br /> 
                                          &nbsp;&nbsp;적립됩니다.
                                       </div>
                                       <hr style="border:solid 1px white;"/>
                                       <div class="row">
                                          <div class="col-6 col-lg-6" style="color:black; font-size:16px;">
                                             <b>결제 금액 :</b>
                                          </div>
                                          <div class="col-6 col-lg-6" style="color:black; font-size:14px;" id="pay_price">
                                             <b><fmt:formatNumber value="${vo.d_sleep_price }" groupingUsed="true"/>원</b>
                                          </div>
                                          <input type="hidden" name="payment_price" id="payment_price_sub" value="${vo.d_sleep_price }" />    
                                       </div>
                                    </c:otherwise>
                                 </c:choose>
                               
              
                                <button type="submit" class="btn dorne-btn bg-white text-dark" style="margin-top:30px;">결제하기</button>
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


</body>

</html>