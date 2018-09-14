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
<div id="contents" class="cont_typeA">
            <div id="my_setting">
                <!--마이 프로필 공간 -->
 <iframe src="../member/mypageinfo.do?member_no=${sessionScope.siteUserInfo.member_no }&id=${sessionScope.siteUserInfo.id }" width="100%" height="475px" frameborder="no" scrolling="no" name="profileFrame" id="profileFrame"></iframe>
                <form id="confirmForm" action="/memberProcess/myinfo" method="POST">
                    <input type="hidden" name="pageType" id="pageType" value="seeMyInfo">
                    <input type="hidden" name="memberNo" id="memberNo" value="36677685">
                    <input type="hidden" name="email" id="email">
                    <input type="hidden" name="type" id="type" value="5">
                    <input type="hidden" name="page_div" id="page_div" value="pc">
                    <input type="hidden" name="profile_page" id="profile_page" value="N">
                    <div class="option_box step01">
                        <div class="groups">
                            <div class="group_cont">
                                <p class="txt_guide"><b>회원님의 소중한 개인 정보 보호를 위해 비밀번호를 한 번 더 입력해주세요.</b></p>
                                <fieldset>
                                    <legend>비밀번호 입력 폼</legend>
                                    <span class="inp size_m">
												<input type="password" id="mInput1" name="pw" class="passwordEnter">
												<span class="pw_placeholder">비밀번호를 입력하세요</span>
											</span>
                                    <div class="txt_rap3 txt_warning" style="display:none;">
                                        <span class="txt_pink f_size2">비밀번호가 틀렸습니다.</span>
                                    </div>
                                    <div class="btns" style="margin-top:10px;">
                                        <button type="button" class="confirm" id="btConfirm"><span>확인</span></button>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </form>
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