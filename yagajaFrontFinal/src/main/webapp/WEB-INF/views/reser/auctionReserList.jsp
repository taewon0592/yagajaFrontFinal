<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" 
   uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<%@include file="/resources/include/yagajaTop.jsp"%>
<!-- jQuery-2.2.4 js -->
<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/v2_member.css" />
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/password.css" />
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/reserve-list.css" />
<style>
.modal {
        text-align: center;
}
@media screen and (min-width: 1500px) { 
 .modal:before {
         display: inline-block;
         vertical-align: middle;
         content: " ";
         height: 100%;
    }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle; 
        width:100%;
        height:100%;
        
}
</style>

<script>
$(function(){
   $('#cancleBtn').click(function(){
      
      var con = confirm("예약을 취소하시겠습니까?");
      
      if(con==true)
      {
         $.ajax({
            url : "../auction/auctionCancle.do",
            type : "get",
            contentType : "text/html; charset:utf-8",
            data : 
               {
                  reser_no : $('#auction_no').val()
               },
            success : function(suc)
            {
               var obj = JSON.parse(suc)
               
               if(obj.sucOrFail == 1)
               {
                  alert("예약이 취소되었습니다.");
                  location.reload();
               }
               else
               {
                  alert("예약취소 실패")
               }
               
            },
            error : function(e)
            {
               alert("실패:"+e.status);
            }
            
         });
      }
   });
});

</script>

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

   document.getElementById("diffTime_${row.auction_no}").innerHTML = "<span style='color:blue; font-weight:bold'><i class='far fa-clock'></i> 경매까지 남은시간 : "+dateVal+"일 "+hourVal+"시간 "+minVal+"분 "+secVal+"초</span>";

   //남은 시간이 0이 되어 경매종료시
   if(remain_time_sec_${row.auction_no}<=0)
   {
      document.getElementById("diffTime_${row.auction_no}").innerHTML = "<span style='color:red; font-size:1em;'><i class='far fa-clock'></i>"+srts_dateVal+"일 "+srts_hourVal+"시간 "+srts_minVal+"분 "+srts_secVal+"초</span>";
      //호출중지
      //화면리플레쉬
 
      if(srts_${row.auction_no}<=0)
      {
         document.getElementById("diffTime_${row.auction_no }").innerHTML = "<span style='color:red; font-weight:bold;'>입찰이 종료되었습니다</span>";
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

<script>

<script>
function auction_pay(frm)
{
   var con = confirm("결제를 진행하시겠습니까?");
   
   if(con==true)
   {
      return true;   
   }
   else
   {
      return false;   
   }
   
}

</script>
 
<body>

<div class="container-comm" role="main">
 
   
    <div class="contents">
      <!-- 예약 내역 리스트 -->
      <div class="reserve-content">
          <h2 class="article-title">경매내역</h2>
        <section class="history-cont">
          <div class="history-list">
          
          <!-- 반복문 사용한다면 여기서 부터 -->  
          <c:forEach items="${lists }" var="row">
             <form action="../auction/reservationView.do" onclick="return auction_pay(this);" name="auctionReser_Frm_${auction_no }" method="post">
             <input type="hidden" name="lodge_no" value="${row.lodge_no }" />
             <input type="hidden" name="room_no" value="${row.room_no }" />
             <input type="hidden" name="auction_no" value="${row.auction_no }" />
             <input type="hidden" name="reser_type" value="${param.reser_type }" />
             <input type="hidden" name="auction_check_in" value="${param.reser_type }" />
             <div class="history-item ready-reserve">
                 <div class="info">
                   <h4>
                     <a href="../lodge/lodgeView.do?lodgn_no=${row.lodge_no }">${row.lodge_name }</a>
                     <span>${row.lodge_type }</span>
                      </h4>
                      <div class="txt-address">${row.addr_common } ${row.addr_detail }</div>
                      <ul class="reserveinfo-list">
                       <li class="reserveinfo-item" id="auction_no" value="${row.auction_no }"><span>물품번호 </span><b>${row.auction_no }</b></li>
                       <li class="reserveinfo-item"><span>입실 </span><b>${row.auction_check_in }</b></li>
                       <li class="reserveinfo-item"><span>퇴실 </span><b>${row.auction_check_out }</b></li>
                       <li class="reserveinfo-item"><span>객실단가 </span><b><fmt:formatNumber value="${row.w_sleep_price }" groupingUsed="true"/>원</b></li>
                       <li class="reserveinfo-item"><span>시작가 </span><b><fmt:formatNumber value="${row.start_price }" groupingUsed="true"/>원</b></li>
                       <li class="reserveinfo-item"><span>현재입찰가 </span><em><fmt:formatNumber value="${row.end_price }" groupingUsed="true"/>원</em></li>
                       <li class="reserveinfo-item"><span>입찰단위 </span><em><fmt:formatNumber value="${row.auction_unit }" groupingUsed="true"/>원</em></li>
                       <li class="reserveinfo-item"><span>최고입찰자 </span><em>${row.final_bidder }</em></li>
                   </ul>
                 </div>
                 <div class="btns">
                 <c:choose>
                    <c:when test="${row.start_remain_time_sec < 0 }">
                       <button type="submit" id="auction_pay" class="btn dorne-btn" style="background-color:#ff3479">결제하기</button>
                       <button type="button" class="btn dorne-btn" style="background-color:#ff3479" id="cancleBtn">예약취소</button>
                    </c:when>
                 </c:choose>
                 </div>

              <div class="tags">
                <span style="color:black; font_weight:bold;">남은시간 :</span><span class="tag" style="font-size:1em; color:red; background-color:white; padding:5px" id="diffTime_${row.auction_no }">0일 00시 00분 00초</span>
            <input type="hidden" id="remain_time_sec_${row.auction_no }" value="${row.remain_time_sec }" />
                <input type="hidden" id="srts_${row.auction_no }" value="${row.start_remain_time_sec }" />             
              </div>
            </div>
            </form>
            </c:forEach>
         <!-- 반복문 끝 -->
          </div>
        </section>
      </div>

    </div>

  </div>
          




<%@include file="/resources/include/yagajaBottom.jsp"%>
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