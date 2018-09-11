<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="/resources/include/yagajaTop.jsp"%>
<!-- jQuery-2.2.4 js -->
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/v2_member.css" />
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/password.css" />
<link rel="stylesheet" type="text/css" href="../resources/yanoljaCSS/member.css" />
<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>

<body>
	<section class="dorne-welcome-area2 bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/mainbg.jpg);">
	</section>
	<section class="dorne-listing-destinations-area section-padding-100-50">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading dark text-center">
						<span></span>
						<h4>
							<b>개인정보 수정</b>
						</h4>
					</div>
				</div>
			</div>
			<div class="contact-form contact-form-widget ">
				<form name="writeFrom" action="../member/mypageinfoModify.do" method="post" class="center" onsubmit="return loginValidate(this);">
				
						<input type="hidden" value="${sessionScope.siteUserInfo.member_no }" />
						<input type="hidden" value="${sessionScope.siteUserInfo.id }" />
			
					<div class="row">
						
						<div class="col-12">
							아이디 : 
						</div>
						<div class="col-12">
							<input type="text" name="id" id="id" class="form-control"  value="${sessionScope.siteUserInfo.id }" readonly >
						</div>
						
						<div class="col-12">
							패스워드 :
							<input type="password" name="pass" id="pass" class="form-control" placeholder="패스워드" value="${sessionScope.siteUserInfo.pass }">
						</div>
							
							
						<div class="col-12">
							이메일 :
							<input type="text" name="email" id="email" class="form-control" placeholder="이메일" value="${sessionScope.siteUserInfo.email }" readonly>
						</div>
						
						<div class="col-12">
							닉네임 :
							<input type="text" name="nickname" id="nickname" class="form-control" placeholder="닉네임" value="${sessionScope.siteUserInfo.nickname }" readonly>
						</div>
						
						<div class="col-12">
							전화번호 :
							<input type="text" name="phone" id="phone" class="form-control" placeholder="휴대전화번호" value="${sessionScope.siteUserInfo.phone}">
						</div>
						
						<div class="col-12">
							마일리지 :
							<input type="text" name="m_point" id="m_point" class="form-control" placeholder="마일리지" value="${sessionScope.siteUserInfo.m_point}" readonly>
						</div>
						
						
						<div class="col-12 ">
							<button type="submit" name="login" class="btn dorne-btn" style="background-color:#ff3479;">회원정보수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>







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