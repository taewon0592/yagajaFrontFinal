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
<body>
<script>
function searchid(spwFrm){
	//닉네임
	if(spwFrm.nickname.value==""){
		alert("아이디를 입력하세요");
		spwFrm.nickname.focus();
		return false;
	}
	//이메일
	if(spwFrm.email.value==""){
		alert("이메일을입력하세요");
		spwFrm.email.focus();
		return false;
	}
}
</script>
<div class="container-comm">
			<article class="contents">
				<div class="member-content">
					<!--S: .contents -->
					<section class="login-area">
						<div class="cont_top">
							<h3>
								<span><b>아이디</b> 찾기</span>
							</h3>
						</div>
						<form id="findIdForm" action="../member/searchid.do" class="form-group form-w410" onsubmit="return searchid(this);">
							<fieldset>
								<legend>아이디 찾기 폼</legend>
								<div class="login-cont">
									<p>※ 가입시 입력한 닉네임과 이메일을 입력하시면<br /> 이메일로 아이디를 보내드립니다.</p>
									<div class="inp-txt-member">
										<input type="text" name="nickname" placeholder="닉네임" title="닉네임">
									</div>
									<div class="inp-txt-member">
										<input type="text" name="email" placeholder="이메일 주소" title="이메일 주소">
									</div>
									<button type="submit" name="button" class="btn-gradation btn-login" id="findid">확인</button>
								</div>
							</fieldset>
						</form>
					</section>
				</div>
			</article>
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