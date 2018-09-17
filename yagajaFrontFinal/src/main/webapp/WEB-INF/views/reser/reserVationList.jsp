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
@media screen and (min-width: 1000px) { 
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
}
</style>

<script>
$(function(){
   $('#cancleBtn').click(function(){
      
      var con = confirm("결제를 취소하시겠습니까?");
      
      if(con==true)
      {
         $.ajax({
            url : "../reser/reservationCancle.do",
            type : "get",
            contentType : "text/html; charset:utf-8",
            data : 
               {
                  reser_no : $('#reser_no').val(),
                  payment_price : $('#payment_price').val()
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

<body>

<div class="container-comm" role="main">
 
   
    <div class="contents">
      <!-- 예약 내역 리스트 -->
      <div class="reserve-content">
          <h2 class="article-title">숙소예약</h2>
        <section class="history-cont">
          <div class="history-list">
          
          <!-- 반복문 사용한다면 여기서 부터 -->  
          <c:forEach items="${lists }" var="row">
             <div class="history-item ready-reserve">
                 <div class="info">
                   <h4>
                     <a href="../lodge/lodgeView?lodgn_no=${row.lodge_no }">${row.lodge_name }</a>
                     <span>${row.lodge_type }</span>
                      </h4>
                      <div class="txt-address">${row.addr_common } ${row.addr_detail }</div>
                      <ul class="reserveinfo-list">
                       <li class="reserveinfo-item" id="reser_no" value="${row.reser_no }"><span>예약번호</span><b>${row.reser_no }</b></li>
                       <li class="reserveinfo-item" id="" ><span>예약타입</span><b>${row.reser_type }</b></li>
                       <li class="reserveinfo-item"><span>입실</span><b>${row.reser_check_in }</b></li>
                       <li class="reserveinfo-item"><span>퇴실</span><b>${row.reser_check_out }</b></li>
                       <li class="reserveinfo-item"><span>예약일</span><b>${row.reser_date_change }</b></li>
                       <li class="reserveinfo-item" id="payment_price" value="${row.payment_price }"><span>판매가</span><em><fmt:formatNumber value="${row.payment_price }" groupingUsed="true"/>원</em></li>
                   </ul>
                 </div>
                 
                 
                 <div class="btns">
                    <c:choose>
                       <c:when test="${row.after < 0 or (row.before < 0 and row.after > 0)}">
                       <button type="button" id="payinfo" class="btn dorne-btn" style="background-color:#ff3479" data-target="#layerpop" data-toggle="modal">결제 내역 확인</button>
                       </c:when>
                       <c:otherwise>
                          <button type="button" id="payinfo" class="btn dorne-btn" style="background-color:#ff3479" data-target="#layerpop" data-toggle="modal">결제 내역 확인</button>
                            <button type="button" class="btn dorne-btn" style="background-color:#ff3479" id="cancleBtn">예약 취소</button>
                       </c:otherwise>
                    </c:choose>
                   
                 </div>

                 
<div class="modal fade" id="layerpop" >
<div class="modal-dialog">
<div class="modal-content">
<!-- header -->
<div class="modal-header">


<!-- header title -->
<h4 class="modal-title">결제내역</h4>
<!-- 닫기(x) 버튼 -->
<button type="button" class="close" data-dismiss="modal">×</button>
</div>
<!-- body -->
<div class="modal-body">

<table style="width:400px;">
<colgroup>
   <col width="30%"/>
   <col width="70%"/>
</colgroup>

   <tr>
      <td style="border:black 1px solid; padding-left:5px;">예약번호</td>
      <td style="border:black 1px solid; padding-left:5px;">${row.reser_no }</td>
   </tr>
   <tr>
      <td style="border:black 1px solid; padding-left:5px;">예약자명</td>
      <td style="border:black 1px solid; padding-left:5px;">${row.reser_name }</td>
   </tr>
   <tr>
      <td style="border:black 1px solid; padding-left:5px;">연락처</td>
      <td style="border:black 1px solid; padding-left:5px;">${sessionScope.siteUserInfo.phone}</td>
   </tr>
   <tr>
      <td style="border:black 1px solid; padding-left:5px;">결제수단</td>
      <td style="border:black 1px solid; padding-left:5px;">${row.payment_type}</td>
   </tr>
   <tr>
      <td style="border:black 1px solid; padding-left:5px;">결제금액</td>
      <td style="border:black 1px solid; padding-left:5px;"><fmt:formatNumber value="${row.payment_price}" groupingUsed="true"/>원</td>
   </tr>
   <tr>
      <td style="border:black 1px solid; padding-left:5px;">적립포인트</td>
      <td style="border:black 1px solid; padding-left:5px;"><fmt:formatNumber value="${row.payment_price * 0.05}" groupingUsed="true"/>마일리지</td>
   </tr>
</table>
</div>
<!-- Footer -->
<div class="modal-footer">

<button type="button" class="btn" data-dismiss="modal" style="background-color:#ff3479; margin-right:10px; color:white;">닫기</button>
</div>
</div>
</div>
</div>
                 <!-- 예약현황은 변동이 있어야할듯?
                 체크인 X -> 입실전
                 체크인 O -> 사용중  
                 체크아웃 O or 예약한 날짜가 지남 -> 사용종료
                 -->
                 
              <c:choose>
                 <c:when test="${row.before >= 0 }">
                 <div class="tags">
                   <span style="font-size:1em; font-weight:bold; color:black;">예약현황: </span><span class="tag" style="font-size:1em; color:blue; background-color:white; padding:5px; font-weight:bold;">입실전</span>
                 </div>
               </c:when>
               <c:when test="${row.before < 0 and row.after >= 0 }">
               <div class="tags">
                   <span style="font-size:1em; font-weight:bold; color:black;">예약현황: </span><span class="tag" style="font-size:1em; color:red; background-color:white; padding:5px; font-weight:bold;">사용중</span>
                </div>
                </c:when>
                <c:otherwise>
                <div class="tags">
                   <span style="font-size:1em; font-weight:bold; color:black;">예약현황: </span><span class="tag" style="font-size:1em; color:gray; background-color:white; padding:5px; font-weight:bold;">사용종료</span>
                </div>
                </c:otherwise>
              </c:choose> 

            </div>
            </c:forEach>
         <!-- 반복문 끝 -->
          </div>
        </section>
      </div>

      <!-- START: Layer Popup: 결제 내역 확인 -->
      <div class="layer-popup" id="paymentListPopup">
        <div class="layer-container">
          <div class="layer-contents">
            <section>
              <h3>결제 내역 확인</h3>
              <div class="content">
                <p class="reserve-number-txt"><b>예약번호:</b> <strong>12342352423423</strong></p>
                <ul class="reserveinfo-list">
                  <li class="reserveinfo-item"><span>예약자명</span><b class="str userName">박명희 아줌마</b></li>
                  <li class="reserveinfo-item"><span>연락처</span><b class="str publicPhoneNum">010-1111-1111</b></li>
                  <li class="reserveinfo-item publicPhoneMassage">입력하신 휴대폰번호 <i class="phone">010-1111-1111</i>은(는) 안심번호로 숙소에 전달되며, <i class="vaildMent">퇴실</i> 후 <i class="vaildDays">5</i>일간 보관됩니다.</li>
                  <li class="reserveinfo-item"><span>결제수단</span><b class="str payType">신용카드</b></li>
                </ul>
              </div>
              <div class="content2">
                <div class="reserveinfo-box">
                  <ul class="reserveinfo-list">
                    <li class="reserveinfo-item"><span>판매금액</span><b class="f-right salePrice">60,000원</b></li>
                    <li class="reserveinfo-item total"><span>결제금액</span><em class="f-right purchasePrice">50,000원</em></li>
                  </ul>
                  <ul class="reserveinfo-list">
                    <li class="reserveinfo-item"><span>사용 쿠폰</span><b class="f-right useCoupon">10,000원</b></li>
                    <li class="reserveinfo-item"><span>사용 포인트</span><em class="f-right usePoint">460 P</em></li>
                  </ul>
                  <ul class="reserveinfo-list">
                    <li class="reserveinfo-item"><span>기본 적립</span><b class="f-right refundPoint">460 P</b></li>
                  </ul>
                </div>
              </div>
            </section>
          </div>
          <button type="button" class="btn-layer-close"><span class="sc-out">닫기</span></button>
        </div>
      </div>
      <!-- END: Layer Popup: 결제 내역 확인 -->

      <!-- START: Layer Popup: 예약 취소 -->
      <div class="layer-popup" id="reserveCancelPopup">
        <div class="layer-container">
          <div class="layer-contents">
            <section>
              <h3>예약 취소</h3>
              <div class="content2">
                <p class="reserve-number-txt"><b>예약번호:</b> <strong class="txt_num">12342352423423</strong></p>
                <div class="reserveinfo-box">
                  <ul class="reserveinfo-list">
                    <li class="reserveinfo-item"><span>결제수단</span><b class="f-right payType">포인트</b></li>
                  </ul>
                  <ul class="reserveinfo-list">
                    <li class="reserveinfo-item"><span>판매금액</span><b class="f-right salePrice">60,000원</b></li>
                    <li class="reserveinfo-item total"><span>결제금액</span><em class="f-right purchasePrice">50,000원</em></li>
                  </ul>
                  <ul class="reserveinfo-list">
                    <li class="reserveinfo-item"><span>취소수수료</span><b class="f-right commission">4,000원</b></li>
                  </ul>
                  <ul class="reserveinfo-list">
                    <li class="reserveinfo-item"><span>환불금액</span><b class="f-right refundAmount">0원</b></li>
                    <li class="reserveinfo-item"><span>환불 포인트</span><em class="f-right refundPoint">0 P</em></li>
                  </ul>
                  <p class="tip-txt">
                    ※ 취소수수료는 결제액과 포인트에 부과됩니다.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp; 취소 기준일에 따라 일괄 계산되오니 자세한 사항은 환불 규정을 참고하세요.
                  </p>
                </div>

                <table class="guide-table">
                  <colgroup><col width="50%"><col width="50%"></colgroup>
                  <thead><tr><th>취소기준일</th><th>취소수수료</th></tr></thead>
                  <tbody><tr><td></td><td></td></tr><tr><td></td><td></td></tr></tbody>
                </table>

                <div class="inp-checkbox">
                  <input type="checkbox" id="agree" name="agree" />
                  <label for="agree">취소 규정 및 환불규정에 동의합니다.</label>
                </div>
                <button type="button" class="btn-gradation reserveCancelBtn" style="margin-top:15px">예약 취소하기</button>
              </div>
            </section>
          </div>
          <button type="button" class="btn-layer-close"><span class="sc-out">닫기</span></button>
        </div>
      </div>
 <div class="row text-center" style="text-align:center">
      <ul class="pagination">
         ${pagingImg }
      </ul>
   </div>
      <!-- END: Layer Popup: 예약 취소 -->
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