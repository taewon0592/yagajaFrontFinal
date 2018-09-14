<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="/resources/include/yagajaTop.jsp"%>
<!-- jQuery-2.2.4 js -->
<link rel="stylesheet" type="text/css"
	href="../resources/yanoljaCSS/v2_member.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/yanoljaCSS/password.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/yanoljaCSS/member.css" />
<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>
<script>
	function mValidate(fn){
		if(fn.id.value==""){
			alert("아이디를 입력해주세요");
			fn.id.focus();
			return false;
		}
		if(fn.email_1.value==""){
			alert("이메일을 입력해주세요");
			fn.email_1.focus();
			return false;
		}
		if(fn.email_2.value==""){
			alert("이메일을 선택해주세요");
			fn.email_2.focus();
			return false;
		}
		
		if(fn.nickname.value==""){
			alert("닉네임을 입력해주세요");
			fn.nickname.focus();
			return false;
		}
		/* if(fn.phone_1.value==""){
			alert("휴대번호를 입력해주세요");
			fn.phone_1.focus();
			return false;
		}
		
		if(fn.phone_2.value==""){
			alert("휴대번호를 입력해주세요");
			fn.phone_2.focus();
			return false;
		}
		
		if(fn.phone_3.value==""){
			alert("휴대번호를 입력해주세요");
			fn.phone_3.focus();
			return false;
		} */
		
		if(fn.nickname.value==""){
			alert("닉네임을 입력해주세요");
			fn.nickname.focus();
			return false;
		}
		if(fn.pass.value==""){
			alert("비밀번호를 입력해주세요");
			fn.pass.focus();
			return false;
		}
		if(fn.passcheck.value==""){
			alert("비밀번호확인을 입력해주세요");
			fn.passcheck.focus();
			return false;
		}
		
		
	}

	function email_input(em, frm){
	   //선택한 select의 값이 빈값이 아닐때만 동작
	   if(em.value!=""){
	      if(em.value=="1"){
	         //직접입력 선택한 경우
	         //readonly속성 해제
	         frm.email_2.readOnly = false;
	         //도메인부분 비워주기
	         frm.email_2.value = "";
	      }
	      else{
	         //도메인을 선택한 경우
	         //선택한 도메인을 입력한다.
	         frm.email_2.value = em.value;
	         //readonly속성을 활성화한다.
	         frm.email_2.readOnly = true;
	      }
	   }
	}
	function checkPwd(){
		var pass = $("#pass").val();
		var passCheck = $("#passcheck").val();
		//빈값일때
		if(passCheck== ""){
			document.getElementById("checkPwd").innerHTML=""
		}
		//일치하지않을때
		else if(pass!=passCheck){
			document.getElementById("checkPwd").innerHTML="<font><b>비밀번호가 일치하지 않습니다.</b></font>";
			//버튼을 비활성화시킴
			$("#btnToJoinEnd").prop("disabled",true);
		}
		//일치할때
		else{
			document.getElementById("checkPwd").innerHTML="<font color='#FD1E63'><b>비밀번호가 일치합니다.</b></font>"
			$("#btnToJoinEnd").prop("disabled",false);
		}
	
	}

//아이디 체크여부 확인 (아이디 중복일 경우 = 0, 중복이 아닐 경우 1로 변경)
var idck = 0;
$(function(){
	  $("#btnCheckId").click(function(){
		  
		  //아이디를 적지않고 중복확인을 클릭했을 때
		  var id = $("#id").val();
		  if( id == "" || id== " "){
			  alert("아이디를 입력해주세요");
		  }
		  //중복확인 ajax
		  else{
			  $.ajax({
				  asyne: true,
				  type:'post',
				  url:"../idcheck.do",
				  data: id,
				  dataType : "json",
				  contentType : "application/json; charset=UTF-8",
				  success:function(data){
					  if(data.cnt>0){
						  alert("아이디가 존재합니다. 다른아이디를 입력해주세요.");
						  $("#id").focus();
						  idck=0;
					  }
					  else{
						 alert("사용가능한 아이디입니다.");
						 $("#email_1").focus();
						 //아이디가 중복하지 않으면  idck = 1 
						 idck = 1;
					  }
				  },
				  error : function(error){
					  alert("error:"+error.status+":"+error.statusText);
				  }
			});
		}
	});
	 $("#btnToJoinEnd").click(function(){
		 if(idck==0){
			 alert("아이디 중복을 확인해주세요");
			 return false;
		 }
		 else{ 
			 alert("회원가입이 완료되었습니다. 로그인해주세요!");
		 }
			
	 });
});
</script>
<body>
	<div class="app-content">
		<div class="container-comm">
			<div class="contents">
				<div class="member-content">
					<section class="login-area">
						<h3>회원가입</h3>

						<form id="memberFrm" method="post" class="form-group form-w410"
							onsubmit="return mValidate(this);"
							action="<c:url value="/member/memberjoinFormAction.do"/>">

							<fieldset id="joinFieldset">
								<legend class="sc-out">회원가입 폼</legend>
								<div class="login-cont">
									<div class="inp-txt-member">
										<input type="text" name="id" id="id" value=""
											placeholder="아이디(8~20자)" title="아이디를 입력" style="width: 240px" />
										<button type="button" id="btnCheckId"
											style="border: solid 1px #dadada" class="btn btn-danger">중복확인</button>
									</div>

									<div class="inp-txt-member">
										<input style="width: 120px;" type="text" id="email_1"
											name="email_1" value="" placeholder="이메일" title="이메일을 입력"
											maxlength="20" /> @ <input type="text" id="email_2"
											name="email_2"
											style="width: 100px; height: 20px; border: solid 1px #dadada;"
											value="" readonly /> <select name="last_email_check2"
											onChange="email_input(this,this.form);" class="pass"
											id="last_email_check2">
											<option selected="" value="">선택</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="nate.com">nate.com</option>
											<option value="naver.com">naver.com</option>
											<option value="1">직접입력</option>
										</select>
									</div>

									<div class="inp-txt-member">
										<input type="text" id="nickname" name="nickname"
											placeholder="닉네임(2~8자)" title="닉네임을 입력(2~8자)" />
									</div>

									<div class="inp-txt-member">
										<input style="width: 110px; text-align: center;" type="text"
											id="phone_1" name="phone_1" maxlength="3" /> - <input
											style="width: 110px; text-align: center;" type="text"
											id="phone_1" name="phone_2" maxlength="4" /> - <input
											style="width: 110px; text-align: center;" type="text"
											id="phone_1" name="phone_3" maxlength="4" />
									</div>

									<div class="inp-txt-member">
										<input type="password" id="pass" name="pass"
											class="inp-password" placeholder="비밀번호(8~20자)" />
									</div>
									<div class="warning-txt msg_passwd" id="pwTextArea"></div>

									<div class="inp-txt-member">

										<input type="password" id="passcheck" name="passcheck" onkeyup="checkPwd()" class="inp-password" placeholder="비밀번호 확인" />
									</div>
										<div id="checkPwd"></div>
									<div class="warning-txt msg_passwdConfirm" id="cpTextArea"></div>
								</div>

								<button type="submit" name="button" class="btn-gradation"
									id="btnToJoinEnd">회원가입</button>
							</fieldset>
						</form>
					</section>
				</div>
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