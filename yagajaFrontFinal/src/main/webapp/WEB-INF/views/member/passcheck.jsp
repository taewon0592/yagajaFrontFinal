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
function passValidate(){
	var pass = $("#pass").val();
	var passcheck2 = $("#passcheck2").val();
	//빈값일때
	if(passcheck2== ""){
		alert("비밀번호를 입력해주세요");
		confirmForm.passcheck2.focus();
		return false;
	}
	else if(pass!=passcheck2){
		alert("비밀번호가 틀립니다");
		confirmForm.passcheck2.focus();
		return false;
	}
	else{
		return true;
	}
}

</script>
<body>
<div class="breadcumb-area height-500 bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/passcheck.jpg);"></div>
 <div class="container-comm">
		<div class="contents">
			<div class="member-content">
				<section class="login-area">
					<h3 style="font-size:1.5em">
						회원님의 소중한 개인 정보 보호를 위해<br /><font style="color:red"><b></b> 비밀번호</font>를 한 번 더 입력해주세요.
					</h3>
					<form id="confirmForm" name="passcheckFrm" action="../member/mypageinfo.do?member_no=${sessionScope.siteUserInfo.member_no }&id=${sessionScope.siteUserInfo.id }" method="post" onsubmit="return passValidate()" class="form-group form-w410">
						<fieldset>
							<legend class="sc-out">비밀번호확인폼</legend>
								<div class="inp-txt-member">
									<input type="hidden" id="pass" value="${sessionScope.siteUserInfo.pass }" />
									<input type="password" id="passcheck2" name="passcheck2" placeholder="비밀번호를 입력해주세요" title="비밀번호 입력" />
									<div id="checkPwd"></div>
								</div>	
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