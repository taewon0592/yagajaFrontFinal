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
  
<div class="breadcumb-area height-500 bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/IMG_9110.jpg);"></div>
 <div class="container-comm">
      <div class="contents">
         <div class="member-content">
         <section class="login-area">
                  <!-- 마이페이지 - 회원 탈퇴 -->
                     <h3 style="font-size:1.5em">
                        <b>탈퇴 안내 및 동의</b>
                     </h3>
               <form id="withdrawForm" action="../member/memberdelete.do" method="post" onsubmit="return agreeCheck(this)">
                     <dl>
                        <dt>1. 현재 사용중인 계정정보는 재사용 및 복구 불가능합니다. </dt>
                        <dd>
                        <br />
                           <p>
                              탈퇴 시, <b style="color:#FA7091">사용하고 계신 아이디(<span id="id">${sessionScope.siteUserInfo.id}</span>)는
                           
                                 본인과 타인 모두 복구가 불가능
                              </b>합니다.<br> 또한, 해당 ID로 신청하신 할인카드 정보(유료)는 모두 삭제되며 재가입 후에도,
                              복구가 불가능합니다.<br>
                           </p>
                        <br /><br />
                        </dd>

                        <dt>2. 회원 탈퇴 시, 회원님의 모든 혜택이 소멸되며 어떠한 경우에도 복구 할 수 없습니다.</dt>
                        <dd>
                        <br />
                           <div id="point_chart" >
                              <div>
                                 <table style="text-align: center;">
                                    <tr class="form-control" style="background-color:#FBF9F9">
                                       <td id="mileageTitle">
                                          <b>마일리지 금액</b>
                                       </td>
                                    </tr>
                                    <tr class="form-control">
                                       <td>
                                          <a href="javascript:void(0);"
                                          onclick="pointLayerOpen('point_list');"><b
                                             id="yanowPoint">0</b></a> <span id="yanowPointPost"></span>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </div>

                        <div class="txt_etc">그 외, 개인회원에 대한 정보 및 서비스 활동기록은 모두
                           삭제됩니다. 단, 불량 이용 및 징계에 대한 기록은 일정기간 동안 삭제되지 않고 보관됩니다. <br /><br /><br /></div>
                              
                        </dd>

                        <dt>3. 게시판형 서비스에 등록된 게시물은 삭제되지 않고 유지됩니다.</dt>
                        <dd>
                        <br />
                           <p>
                              이용후기와 같은 게시판형 서비스에 등록한 게시물은 삭제되지 않고 유지됩니다. <br> 탈퇴 후에는
                              회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없으므로, 게시글을 임의로 삭제할 수 없습니다.<br>
                              <b style="color:#FA7091">삭제를 원하는 게시물이 있을 경우, 반드시 삭제 후 탈퇴 하시기 바라며, 필요한 데이터는 미리
                                 백업을 해주시기 바랍니다.</b>
                           </p>
                           <br />
                        </dd>

                        <dt>4. 탈퇴사유</dt>
                        <dd>
                           <input type="hidden" name="member_no" value="${vo.member_no }" />
                           <input type="hidden" name="id" value="${vo.id }" />
                           <br />
                           <label class="custom-control custom-checkbox mb-3"> 
                              <input type="radio" class="custom-control-input" id="case1" name="leave_reason" checked value="재가입 (ID 변경)"> 
                              <span class="custom-control-indicator"></span> 
                              <span class="custom-control-description" style="font-size:15px">재가입 (ID 변경)</span>
                           </label><br />
                           <label class="custom-control custom-checkbox mb-3"> 
                              <input type="radio" class="custom-control-input" id="case2" name="leave_reason" value="나에게 필요한 정보가 부족하거나 재미가 없어서, 혹은 불필요한 정보가 많아서"> 
                              <span class="custom-control-indicator"></span> 
                              <span class="custom-control-description" style="font-size:15px">
                                 나에게 필요한 정보가 부족하거나 재미가 없어서, 혹은 불필요한 정보가 많아서</span>
                           </label><br />
                           <label class="custom-control custom-checkbox mb-3"> 
                              <input type="radio" class="custom-control-input" id="case3" name="leave_reason" value="개인정보 유출 방지 등 보안 상의 문제"> 
                              <span class="custom-control-indicator"></span> 
                              <span class="custom-control-description" style="font-size:15px">
                                 개인정보 유출 방지 등 보안 상의 문제</span>
                           </label><br />
                           <label class="custom-control custom-checkbox mb-3"> 
                              <input type="radio" class="custom-control-input" id="case4" name="leave_reason" > 
                              <span class="custom-control-indicator"></span> 
                              <span class="custom-control-description" style="font-size:15px">기타&nbsp;&nbsp;&nbsp;
                                 <input type="text" id="withdrawReasonEdit" name="leave_reason2" placeholder="직접입력" 
                                  class="form-control" style="border-radius:5px; width:620px" />
                              </span>
                           </label><br />
                        </dd>
                     </dl>
                     
                     <div class="board_bottom">
                     <label class="custom-control custom-checkbox mb-3"> 
                           
                           <input type="checkbox" class="custom-control-input" id="checkAll" name="checkAll" > 
                              <span class="custom-control-indicator"></span> 
                              <span class="custom-control-description" style="font-size: 15px">
                                 <b>상기
                                 내용을 확인하였으며 동의합니다.</b></span>
                           </label>
<script>
function agreeCheck(){
   var chk = document.getElementById("checkAll");
   if(chk.checked==true){
      alert("약관에 동의하여 탈퇴합니다.")
      return true
   }
   else{
      alert("약관에 동의해야 탈퇴가 가능합니다.");
      return false;
   }
}
</script>
                        <button type="submit"  class="btn btn-primary out" id="btWithdraw"
                           style="background-color:#A8A8A9; color:#ffffff; border:0">
                           <span>탈퇴하기</span>
                        </button>
                     </div>
                  </form>   
               </section>
                  </div>
                  <!--// 마이페이지 - 회원 탈퇴 -->
               </div>
         </div>
      <!--E: .contents -->
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