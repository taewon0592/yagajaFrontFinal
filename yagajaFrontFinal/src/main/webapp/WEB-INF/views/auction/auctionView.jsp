<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="/resources/include/yagajaTop.jsp"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">


<script type="text/javascript">
//남은시간(초) - DB에서 가져옴
var srts_${dto.auction_no} = ${dto.start_remain_time_sec}

function auction_reverse_time_${dto.auction_no}()
{
   srts_dateVal = parseInt(srts_${dto.auction_no}/(24*60*60));   //경매시간 남은 총 초에서 날짜 뽑기
   srts_temp_val = srts_${dto.auction_no}%(24*60*60);         //경매시간 남은 초 담기
   srts_hourVal = parseInt(srts_temp_val/(60*60));            //경매시간 남은 총 초에서 시간 뽑기
   srts_temp_val = srts_temp_val%(60*60);                  //경매시간 남은 초 담기
   srts_minVal = parseInt(srts_temp_val/(60));               //경매시간 남은 총 초에서 분 뽑기
   srts_secVal = srts_temp_val%(60);                     //경매시간 남은 초 담기



      document.getElementById("diffTime_${dto.auction_no}").innerHTML = "<p style='color:white; font-size:25px; padding-top:2px; font-weight:bold;'><i class='far fa-clock'></i> 경매 진행중 : "+srts_dateVal+"일 "+srts_hourVal+"시간 "+srts_minVal+"분 "+srts_secVal+"초</p>";
      //호출중지
      //화면리플레쉬
 
      if(srts_${dto.auction_no}<=0)
      {
         document.getElementById("diffTime_${dto.auction_no }").innerHTML = "<p style='color:white; font-weight:bold; font-size:27px;'>입찰이 종료되었습니다</p>";
      }
      else
      {
         srts_${dto.auction_no}--;
      }
   
}

window.onload = function()
{   
   
   //경매시작까지 남은시간 가져오기
   srts_${dto.auction_no} = document.getElementById("srts_${dto.auction_no}").value;
   
   

   if(srts_${dto.auction_no} > 0)
   {
      setInterval("auction_reverse_time_${dto.auction_no}()" ,1000);   
   }
   else
   {
      document.getElementById("diffTime_${dto.auction_no }").innerHTML = "<p style='color:red; font-weight:bold;'>입찰이 종료되었습니다</p>";
   }

}
</script>

<script>
function m_pointcheck(f)
{
   var con = confirm("${dto.lodge_name}의 숙소를 정말로 입찰하시겠습니까?");
   
   if(con==true)
   {
      if(f.end_price.value <= ${sessionScope.siteUserInfo.m_point})
      {
         alert("입찰이 성공적으로 이루어졌습니다.");
         return true;
      }
      else
      {
         alert("마일리지가 부족합니다. 마일리지를 확인해주세요.")
         return false;
      }
   }
   else
   {
      alert("입찰이 취소되었습니다.");
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
                             <input type="hidden" id="remain_time_sec_${dto.auction_no }" value="${dto.remain_time_sec }" />
                        <input type="hidden" id="srts_${dto.auction_no }" value="${dto.start_remain_time_sec }" />  
                           <div style="background-color:#FF3479; color:white; width:460px; height:60px; font-size:26px; text-align:center; padding-top:8px; border-radius:15px;" id="diffTime_${dto.auction_no }">
                             <i class="far fa-clock"></i>&nbsp;<b>경매 진행중 : ${dto.start_timeView }</b>
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
                     <div class="col-6 col-lg-6" style="font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;" >
                        <span style="font-size:20px; font-weight:bold;">물품번호 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:gray;">${dto.auction_no }</span>
                     </div>
                     <div class="col-6 col-lg-6" style="font-weight:bold; padding-left:30px;" >
                        <span style="font-size:20px; font-weight:bold;">최고입찰자 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:gray;">${dto.final_bidder }</span>
                     </div>
                  </div> 
                  <hr />
                  <div class="row">
                     <div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
                        <span style="font-size:20px; font-weight:bold;">숙소명 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:gray;">${dto.lodge_name }</span>
                     </div>
                     <div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
                        <span style="font-size:20px; font-weight:bold;">객실단가 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:gray;"><fmt:formatNumber value="${dto.w_sleep_price }" groupingUsed="true"/>원</span>
                     </div> 
                  </div>   
                  <hr />
                  <div class="row">
                     <div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
                        <span style="font-size:20px; font-weight:bold;">숙소분류 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:gray;">${dto.lodge_type }</span>
                     </div>
                     <div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
                        <span style="font-size:20px; font-weight:bold;">객실타입 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:gray;">${dto.room_type }</span>
                     </div> 
                  </div>   
                  <hr />
                  <div class="row">
                     <div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;"  >
                        <span style="font-size:20px; font-weight:bold;">경매시작일 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:gray;">${dto.auction_stime_ch }</span>
                     </div>
                     <div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
                        <span style="font-size:20px; font-weight:bold;">경매종료일 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:gray;">${dto.auction_etime_ch }</span>
                     </div> 
                  </div>   
                  <hr />      
                  <div class="row">
                     <div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;" >
                        <span style="font-size:20px; font-weight:bold;">입실일 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:blue;">${dto.auction_check_in} </span>
                     </div>
                     <div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
                        <span style="font-size:20px; font-weight:bold;">퇴실일 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:blue;">${dto.auction_check_out }</span>
                     </div>
                  </div>   
                  <hr />
                  <div class="row">
                     <div class="col-6 col-lg-6" style="font-size:18px; font-weight:bold; border-left:black 0px solid; border-top:black 0px solid; border-bottom:black 0px solid; border-right:gray 1px solid;" >
                        <span style="font-size:20px; font-weight:bold;">시작가 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:red;"><fmt:formatNumber value="${dto.start_price }" groupingUsed="true"/>마일리지</span>
                     </div>
                     <div class="col-6 col-lg-6" style="font-size:15px; font-weight:bold; padding-left:30px;">
                        <span style="font-size:20px; font-weight:bold;">입찰단위 :</span>&nbsp;&nbsp;
                        <span style="font-size:17px; color:red;"><fmt:formatNumber value="${dto.auction_unit }" groupingUsed="true"/>마일리지</span>
                     </div>
                  </div>   
                  <hr />      
                   
                  <form action="../auction/auctionProc.do" method="post" onsubmit="return m_pointcheck(this)" name="auctionFrm">
                  <input type="hidden" name="member_no" value="${sessionScope.siteUserInfo.member_no }" />
                  <input type="hidden" name="member_nickname" value="${sessionScope.siteUserInfo.nickname} " />
                  <input type="hidden" name="member_m_point" value="${sessionScope.siteUserInfo.m_point}"/>
                  <input type="hidden" name="auction_no" value="${dto.auction_no }" />
                  <input type="hidden" name="reser_type" value="경매" />
                  
                  
               

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
                  <div class="book-a-table-widget" style="margin-top:-70px; width:250px; border-radius:15px; background-color:rgb(255,52,121);">
                     <c:choose>
                        <c:when test="${dto.end_price == '' }">
                           <div>
                                    <h7 style="color:white;">현재입찰가</h7><br />
                                    <input type="text" value="<fmt:formatNumber value="${dto.start_price }" groupingUsed="true"/>마일리지" style="width:140px;" readonly="true"/>
                                 </div>
                        </c:when>
                        <c:otherwise>
                           <div>
                                    <h7 style="color:white;">현재입찰가</h7><br />
                                    <input type="text" value="${dto.end_price }" style="width:140px;" readonly="true"/>
                                 </div>
                        </c:otherwise>
                     </c:choose>
                              
                              <br />   
                              <c:choose>
                                 <c:when test="${dto.end_price =='' }">
                                    <div>
                                       <h7 style="color:white;">입찰금액</h7><br />
                                       <select name="end_price" id="end_price">
                                          <option value="${dto.start_price + dto.auction_unit }"><fmt:formatNumber value="${dto.start_price + dto.auction_unit }" groupingUsed="true"/>마일리지</option>
                                          <option value="${dto.start_price + (dto.auction_unit*2) }"><fmt:formatNumber value="${dto.start_price + (dto.auction_unit*2) }" groupingUsed="true"/>마일리지</option>
                                          <option value="${dto.start_price + (dto.auction_unit*3) }"><fmt:formatNumber value="${dto.start_price + (dto.auction_unit*3) }" groupingUsed="true"/>마일리지</option>
                                          <option value="${dto.start_price + (dto.auction_unit*4) }"><fmt:formatNumber value="${dto.start_price + (dto.auction_unit*4) }" groupingUsed="true"/>마일리지</option>
                                          <option value="${dto.start_price + (dto.auction_unit*5) }"><fmt:formatNumber value="${dto.start_price + (dto.auction_unit*5) }" groupingUsed="true"/>마일리지</option>
                                       </select>
                                    </div>
                                 </c:when>   
                                 <c:otherwise>
                                    <div>
                                       <h7 style="color:white;">입찰금액</h7><br />
                                       <select name="end_price" id="end_price">
                                          <option value="${dto.end_price + dto.auction_unit }"><fmt:formatNumber value="${dto.end_price + dto.auction_unit }" groupingUsed="true"/>마일리지</option>
                                          <option value="${dto.end_price + (dto.auction_unit*2) }"><fmt:formatNumber value="${dto.end_price + (dto.auction_unit*2) }" groupingUsed="true"/>마일리지</option>
                                          <option value="${dto.end_price + (dto.auction_unit*3) }"><fmt:formatNumber value="${dto.end_price + (dto.auction_unit*3) }" groupingUsed="true"/>마일리지</option>
                                          <option value="${dto.end_price + (dto.auction_unit*4) }"><fmt:formatNumber value="${dto.end_price + (dto.auction_unit*4) }" groupingUsed="true"/>마일리지</option>
                                          <option value="${dto.end_price + (dto.auction_unit*5) }"><fmt:formatNumber value="${dto.end_price + (dto.auction_unit*5) }" groupingUsed="true"/>마일리지</option>
                                       </select>
                                    </div>
                                 </c:otherwise>
                              </c:choose>
                              
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