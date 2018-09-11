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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	function loginValidate(f) {
		if (f.id.value == "") {
			alert("아이디를 입력해주세요");
			f.id.focus();
			return false;
		}
		if (f.pass.value == "") {
			alert("비밀번호를 입력해주세요");
			f.pass.focus();
			return false;
		}
	}
</script>

<body>

  
	<div class="container-comm">
		<div class="contents">
			<div class="member-content">
				<section class="login-area">
					<h3>
						<b>로그인</b>하고, 혜택받으세요!
					</h3>

					<form id="member_main" name="loginForm"	action="./../member/loginAction.do" method="post" onsubmit="return loginValidate(this);" class="form-group form-w410">
						<fieldset>
							<legend class="sc-out">로그인 폼</legend>
							<div class="login-cont">
								<div class="inp-txt-member">
									<input type="text" id="id" name="id" placeholder="아이디" title="아이디 입력" />
								</div>
								<span style="font-size: 0.8em; color: #ff3479;">${IdNG }</span>
								<div class="inp-txt-member">
									<input type="password" id="pass" name="pass" placeholder="비밀번호" title="비밀번호 입력" />
								</div>	
								<span style="font-size: 0.8em; color: #ff3479;">${PassNG }</span>
								<div class="col-12 ">
								<label class="custom-control custom-checkbox mb-3"> 
									<input type="checkbox" class="custom-control-input" id="id_save" name="useCookie"> 
										<span class="custom-control-indicator"></span> 
										<span class="custom-control-description">
											아이디저장
									</span>
								</label>
								</div>
									
								<button type="submit" name="button" class="btn-gradation btn-login" id="login" >로그인</button>
								
								<p>
									아이디/비밀번호를 잊으셨나요? <br /> 
									<a href="/member/find?pageType=id"   class="link-txt" title="아이디찾기">아이디찾기</a>
									<span></span>
         			 				<a href="/member/find?pageType=pw"  class="link-txt" title="비밀번호찾기">비밀번호찾기</a>
								</p>
							</div>

							<div class="login-footcont">
								<div id="naver_id_login">
									<a href="${url}">
										<img height="50" src="http://static.nid.naver.com/oauth/big_g.PNG"/>
									</a>
								</div>
								<p>
									아직 야가자 회원이 아니신가요? <br /> 
									<a href="./../member/memberjoin.do" title="회원가입" class="link-txt">회원가입</a>
								</p>
							</div>
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