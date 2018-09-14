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
<body>
   <section class="dorne-welcome-area2 bg-img bg-overlay"
      style="background-image: url(../resources/common/img/bg-img/mainbg.jpg);">
   </section>
   <section class="dorne-listing-destinations-area section-padding-100-50">
      <div class="container-comm">
         <div class="container">
            <div class="single-listing-nav">
               <nav>
                  <ul id="listingNav">
                     <li class="active"><a href="#membermodify">회원정보</a></li>
                     <li><a href="#menu">회원탈퇴</a></li>
                  </ul>
               </nav>
               <div class="overview-content mt-50" id="membermodify">
                  <div class="contents">
                     <div class="member-content">
                        <section class="login-area">
                           <h3 style="color: #ff3479; font-size: 1.2em;">회원정보</h3>
                           <div class="container-comm">
                              <form id="writeFrm" name="writeFrm"
                                 action="./../member/loginAction.do" method="post"
                                 onsubmit="return modifyValidate(this);">
                                 <fieldset>
                                    <legend class="sc-out">회원정보 폼</legend>

                                    <div class="inp-txt-member">
                                       <b>아이디</b> : <input type="text" style="width: 50%" id="id"
                                          name="id" title="아이디 입력"
                                          value="${sessionScope.siteUserInfo.id }" readonly/>
                                    </div>
                                    <div class="inp-txt-member">
                                       <b>비밀번호</b> : <input type="password" style="width: 65%"
                                          id="pass" name="pass"
                                          value="${sessionScope.siteUserInfo.pass }" readonly/>
                                       <button type="button" id="btnChangePass" style="border: solid 1px #FF4242; background-color:#FF4242" 
                                       class="btn btn-danger" onclick="location.href='../member/changePass.do?member_no=${sessionScope.siteUserInfo.member_no}&id=${sessionScope.siteUserInfo.id }';">
                                       <b>비밀번호 변경</b></button>
                                    </div>
                                    <div class="inp-txt-member">
                                       <b>닉네임</b> : <input type="text" style="width: 50%"
                                          id="nickname" name="nickname"
                                          value="${sessionScope.siteUserInfo.nickname }" readonly/>
                                    </div>
                                    <div class="inp-txt-member">
                                       <b>이메일</b> : <input type="text" style="width: 50%"
                                          id="email" name="email"
                                          value="${sessionScope.siteUserInfo.email }"  readonly />
                                    </div>
                                    <div class="inp-txt-member">
                                       <b>휴대번호</b> : <input type="text" style="width: 50%"
                                          id="phone" name="phone"
                                          value="${sessionScope.siteUserInfo.phone}"  readonly />
                                    </div>
                                    <div class="inp-txt-member">
                                       <b>마일리지</b> : <input type="text" style="width: 50%"
                                          id="m_point" name="m_point"
                                          value="${sessionScope.siteUserInfo.m_point}" readonly />
                                    </div>
                                    <!-- <div class="col-12 " style="text-align: center">
                                       <button type="submit" name="login"
                                          class="btn-gradation btn-login"
                                          style="background-color: #ff3479; width: 50%; border-radius: 1em;">
                                          <b>회원정보수정</b>
                                       </button>
                                    </div> -->
                                 </fieldset>
                              </form>
                           </div>
                           <div class="listing-menu-area mt-100" id="menu">
                              <div class="member-content">
                                 <h3 style="color: grey; font-size: 1.2em;">회원 탈퇴</h3>
                              </div>
                              <!-- Single Listing Menu -->
                              <div class="member-content" style="text-align: center">
                                 <p>탈퇴를 하시려면 안내 및 동의를 받아야합니다. 정말 탈퇴하시겠습니까?</p>
                                 <!-- Listing Menu Title -->
                                 <button type="button" onclick="location.href='../member/leavecheck.do?member_no=${sessionScope.siteUserInfo.member_no }&id=${sessionScope.siteUserInfo.id}';"
                                    style="border-radius: 1em; width: 50%; background-color: #ffffff;"
                                    class="btn-default" id="login">
                                    <b>탈퇴하기</b>
                                 </button>
                              </div>
                           </div>
                        </section>
                     </div>
                  </div>
               </div>
            </div>
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