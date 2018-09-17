<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" 
   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="en">

<%@include file="/resources/include/yagajaTop.jsp"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script type="text/javascript">
<c:forEach items="${lists }" var="row" varStatus="loop">
//남은시간(초) - DB에서 가져옴
var remain_time_sec_${row.auction_no} = ${row.remain_time_sec }
var srts_${row.auction_no} = ${row.start_remain_time_sec}

function auction_reverse_time_${row.auction_no}()
{
   
   dateVal   =   parseInt(remain_time_sec_${row.auction_no}/(24*60*60));   //경매시작까지 남은 총 초에서 날짜 뽑기
   temp_val = remain_time_sec_${row.auction_no}%(24*60*60);            //경매시작까지 남은 초 담기
   hourVal   = parseInt(temp_val/(60*60));            //경매시작까지 남은 총 초에서 시간 뽑기
   temp_val = temp_val%(60*60);                  //경매시작까지 남은 초 담기
   minVal = parseInt(temp_val/(60));               //경매시작까지 남은 총 초에서 분 뽑기
   secVal = temp_val%(60);                        //경매시작까지 남은 초 담기
   
   srts_dateVal = parseInt(srts_${row.auction_no}/(24*60*60));   //경매시간 남은 총 초에서 날짜 뽑기
   srts_temp_val = srts_${row.auction_no}%(24*60*60);         //경매시간 남은 초 담기
   srts_hourVal = parseInt(srts_temp_val/(60*60));            //경매시간 남은 총 초에서 시간 뽑기
   srts_temp_val = srts_temp_val%(60*60);                  //경매시간 남은 초 담기
   srts_minVal = parseInt(srts_temp_val/(60));               //경매시간 남은 총 초에서 분 뽑기
   srts_secVal = srts_temp_val%(60);                     //경매시간 남은 초 담기

   document.getElementById("diffTime_${row.auction_no}").innerHTML = "<p style='color:blue; font-weight:bold'><i class='far fa-clock'></i> 경매까지 남은시간 : "+dateVal+"일 "+hourVal+"시간 "+minVal+"분 "+secVal+"초</p>";

   //남은 시간이 0이 되어 경매종료시
   if(remain_time_sec_${row.auction_no}<=0)
   {
      document.getElementById("diffTime_${row.auction_no}").innerHTML = "<p><i class='far fa-clock'></i> 경매 진행중 : "+srts_dateVal+"일 "+srts_hourVal+"시간 "+srts_minVal+"분 "+srts_secVal+"초</p>";
      //호출중지
      //화면리플레쉬
 
      if(srts_${row.auction_no}<=0)
      {
         document.getElementById("diffTime_${row.auction_no }").innerHTML = "<p style='color:red; font-weight:bold;'>입찰이 종료되었습니다</p>";
      }
      else
      {
         srts_${row.auction_no}--;
      }
   } 
   else
   {   //잔여시간이 있다면 1초씩 차감
      remain_time_sec_${row.auction_no}--;
   }
   
}
</c:forEach> 

window.onload = function()
{   
   <c:forEach items="${lists }" var="row" varStatus="loop">
   
   //경매시작까지 남은시간 가져오기
   remain_time_sec_${row.auction_no} = document.getElementById("remain_time_sec_${row.auction_no}").value;
   srts_${row.auction_no} = document.getElementById("srts_${row.auction_no}").value;
   
   
   if(remain_time_sec_${row.auction_no} > 0)
   {
      //1초에 한번씩 함수 호출
      setInterval("auction_reverse_time_${row.auction_no}()" ,1000);
      //auction_reverse_time_${row.auction_no}(call_ref_auction);
   }
   else
   {
      
      if(srts_${row.auction_no} > 0)
      {
         setInterval("auction_reverse_time_${row.auction_no}()" ,1000);   
      }
      else
      {
         document.getElementById("diffTime_${row.auction_no }").innerHTML = "<p style='color:red; font-weight:bold;'>입찰이 종료되었습니다</p>";
      }
      
   }
   </c:forEach>
}

</script>

<style>
.single-features-area .price-start2 p {
    position: absolute;
    top: 20px;
    left: 10px;
    background-color: #fff;
    height: 35px;
    font-size: 15px;
    line-height: 35px;
    margin-bottom: 0;
    padding: 0 15px;
    font-weight: bold; 
    color: rgb(255, 52, 121);
    border-radius:15px;
    border-top:rgb(255,52,121) 1px solid;
    border-left:rgb(255,52,121) 1px solid;
    border-bottom:rgb(255,52,121) 3px solid;
    border-right:rgb(255,52,121) 3px solid;
    z-index: 9;
}
</style>

<!-- jQuery-2.2.4 js -->
<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>
<script src="../resources/common/js/bootstrap/bootstrap.min.js"></script>

<body>
<!-- ***** Breadcumb Area Start ***** -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/mainbg.jpg); height:450px;" ></div>
    <!-- ***** Breadcumb Area End ***** -->

    <!-- ***** Listing Destinations Area Start ***** -->
    <section class="dorne-listing-destinations-area section-padding-100-50">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading dark text-center">
                        <h4>경매</h4>
                        <p>AUCTION</p>
                    </div>
                </div>
            </div>
            
            <div class="row">
               <c:forEach items="${lists }" var="row">
                <!-- Single Features Area --><!-- 핫딜목록 반복부분  -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-features-area mb-50">
                    
                    <c:choose>
                       <c:when test="${row.remain_time_sec >= 0 }">
                          <img style="height:307px; width:100%;" src="../resources/common/img/room-img/${row.lodge_photo }" alt="">
                       </c:when>
                       <c:otherwise>
                          <a href="../auction/auctionView.do?room_no=${row.room_no }&lodge_no=${row.lodge_no}&member_no=${sessionScope.siteUserInfo.member_no}&auction_no=${row.auction_no}">
                              <img style="height:307px; width:100%;" src="../resources/common/img/room-img/${row.lodge_photo }" alt="">
                          </a>      
                       </c:otherwise>
                    </c:choose>
                        <!-- Price -->
                        <div class="price-start">
                            <p>${row.lodge_feature }</p>
                        </div> 
                        
                           <input type="hidden" id="remain_time_sec_${row.auction_no }" value="${row.remain_time_sec }" />
                            <input type="hidden" id="srts_${row.auction_no }" value="${row.start_remain_time_sec }" />
                         <c:choose>
                             <c:when test="${row.remain_time_sec >= 0 }">
                                 <div class="price-start2" style="font-weight:bold; font-size:17px;"id="diffTime_${row.auction_no }">
                                  <p style="color:blue; font-weight:bold;"><i class="far fa-clock"></i> 경매까지 남은시간 : 0일 00시간 00분 00초</p> 
                               </div>
                             </c:when>
                             <c:otherwise>
                                <div class="price-start2" style="font-weight:bold; font-size:17px;"id="diffTime_${row.auction_no }">
                                  <p style="color:rgb(255,52,121); font-weight:bold;"><i class="far fa-clock"></i> 경매 진행중 : 0일 00시간 00분 00초</p> 
                               </div>
                             </c:otherwise>         
                        </c:choose>                        
                        <div class="feature-content d-flex align-items-center justify-content-between">
                            <div class="row feature-title">
                               <div class="col-12 col-lg-12" style="font-weight:bold; font-size:18px;">
                                  ${row.lodge_name } 
                               </div> 
                               <div class="col-5 col-lg-5" style="font-weight:bold; color:gray; font-size:15px;">
                                  ${row.lodge_type }
                               </div>
                               <div class="col-7 col-lg-7" style="font-weight:bold; font-size:15px; ">
                                  <span style="color:gray">객실단가 :</span>&nbsp;<span style="color:gray"><fmt:formatNumber value="${row.w_sleep_price }" groupingUsed="true"/>원</span>
                               </div>
                               <c:choose>
                                  <c:when test="${row.end_price == '' }">
                                     <div class="col-12 col-lg-12" style="font-weight:bold; font-size:17px; ">
                                        <span style="color:rgb(255,52,121)">현재가 :</span>&nbsp;<span style="color:rgb(255,52,121)"><fmt:formatNumber value="${row.start_price }" groupingUsed="true"/>마일리지</span>
                                     </div>
                                  </c:when>
                                  <c:otherwise>
                                     <div class="col-12 col-lg-12" style="font-weight:bold; font-size:17px; ">
                                        <span style="color:rgb(255,52,121)">현재가 :</span>&nbsp;<span style="color:rgb(255,52,121)"><fmt:formatNumber value="${row.end_price }" groupingUsed="true"/>마일리지</span>
                                     </div>
                                  </c:otherwise>
                               </c:choose>
                               <div class="col-12 col-lg-12" style="font-weight:bold; font-size:17px; ">
                                  입실일 : <span>${row.auction_check_in }</span>
                               </div>
                               <div class="col-12 col-lg-12" style="font-weight:bold; font-size:17px; ">
                                  퇴실일 : <span>${row.auction_check_out }</span>
                               </div>
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