<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<%@include file="/resources/include/yagajaTop.jsp"%>
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/v2_member.css" />
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/password.css" />
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/member.css" />
<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>
<script>
function passValidate(fn){
   if(fn.passchange1.value==""){
      alert("새 비밀번호를 입력해주세요");
      fn.passchange1.focus();
      return false;
   }
   if(fn.passchange2.value==""){
      alert("새 비밀번호 확인을 입력해주세요");
      fn.passchange2.focus();
      return false;
   }
}

function checkPwd(){
   var passchange1 = $("#passchange1").val();
   var passchange2 = $("#passchange2").val();
   //빈값일때
   if(passchange2== ""){
      document.getElementById("checkPwd").innerHTML=""
   }
   //일치하지않을때
   else if(passchange1!=passchange2){
      document.getElementById("checkPwd").innerHTML="<font><b>비밀번호가 일치하지 않습니다.</b></font>";
   }
   //일치할때
   else{
      document.getElementById("checkPwd").innerHTML="<font color='#FD1E63'><b>비밀번호가 일치합니다.</b></font>"
      $("#btnCheckpass").prop("disabled",false);
   }

}
</script>
<body>
<div class="breadcumb-area height-500 bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/passcheck.jpg);"></div>
 <div class="container-comm">
      <div class="contents">
         <div class="member-content">
            <section class="login-area">
               <h3 style="color: #ff3479; font-size: 1.2em;">비밀번호 변경</h3>
               <form id="confirmForm" name="passcheckFrm" action="../member/changePassAction.do?member_no=${sessionScope.siteUserInfo.member_no }&id=${sessionScope.siteUserInfo.id }" method="post" onsubmit="return passValidate(this);" class="form-group form-w410">
                  <fieldset>
                     <legend class="sc-out">비밀번호변경폼</legend>
                        <div class="inp-txt-member">
                           <input type="hidden" id="member_no" value="${sessionScope.siteUserInfo.member_no }" />
                           <input type="hidden" id="id" value="${sessionScope.siteUserInfo.id }" />
                           <input type="hidden" id="email" value="${sessionScope.siteUserInfo.email }" />
                           <input type="password" id="passchange1" name="passchange1" placeholder="새 비밀번호"/>
                        </div>   
                        <div class="inp-txt-member">
                           <input type="password" id="passchange2" name="passchange2" placeholder="새 비밀번호 확인" onkeyup="checkPwd()"/>
                        </div>   
                           <div id="checkPwd"></div>
                        <button type="submit" style="border-radius:1em;" id="btnCheckpass" class="btn-gradation btn-login" id="login"><b>확인</b></button>
                  </fieldset>
               </form>
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