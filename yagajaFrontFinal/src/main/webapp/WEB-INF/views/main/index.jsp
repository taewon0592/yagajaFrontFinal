<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<%@include file="/resources/include/yagajaTop.jsp" %>

<!-- jQuery-2.2.4 js -->
<script src="../resources/common/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="../resources/common/js/bootstrap/popper.min.js"></script>
<!-- Bootstrap-4 js -->
<script src="../resources/common/js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="../resources/common/js/others/plugins.js"></script>
<!-- Active JS -->
<script src="../resources/common/js/active.js"></script>

<body>

<script type="text/javascript">
$(document).ready(function(){   
   $('#sido').change(function(){
      //alert($('#sido').val()+" 선택됨");
      $.ajax({
         url : '${pageContext.request.contextPath}/lodge/gugun.do',
         type : "get",
         data : {
            sido : $('#sido option:selected').val()
         },
         dataType : "json",
         contentType : "text/html;charset:utf-8;",
         success : function(d){
            //alert(d);
            var optionStr = "";
            optionStr += "<option value=''>";
            optionStr += "구/군";
            optionStr += "</option>";
            $.each(d, function(index, data){
               optionStr += '<option value="'+data+'">';
               optionStr += data;
               optionStr += '</option>';
            });
            
            $('#gugun').html(optionStr);
         },
         error:function(request,status,error){
               //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
      });
   });
   $('#gugun').change(function(){
      
      var s = $('#sido option:selected').val();
      var guu = $('#gugun').val();
      $('#guu').val(guu);
      //alert("선택한 시도:"+s+",구군:"+g);
   });
});

</script>

    <!-- ***** Welcome Area Start ***** -->
    <section class="dorne-welcome-area bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/mainbg.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-12 col-md-10">
                    <div class="hero-content">
                        <h2>Yagaja 와 함께</h2>
                        <h4>여행을 떠나 볼까요?</h4>
                    </div>
                    <!-- Hero Search Form -->
               <div class="hero-search-form">
                        
                        <!-- Tabs Content -->
                        <div class="tab-content" id="nav-tabContent">
                            <div style="background-color:rgba(255,255,255,0.2); border-radius:1em;" class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab">

                                <form name="searchFrm" onsubmit="return searchCheck(this);" action="../lodge/searchLodgeList.do">
                                    <select class="custom-select" name="mode" id="mode" style="background-color:rgba(255,255,255,0.7); border-radius:1em; width:25%;">
                                        <option selected >숙박유형</option>
                                        <option value="모텔">모텔</option>
                                        <option value="호텔/리조트">호텔/리조트</option>
                                        <option value="펜션/풀빌라">펜션/풀빌라</option>
                                        <option value="게스트하우스">게스트하우스</option>
                                    </select>
                                    <select class="custom-select" id="sido" name="sido" style="background-color:rgba(255,255,255,0.7); border-radius:1em; width:25%;">
      <option value="">시/도</option>
      <option value="서울">서울특별시</option>
      <option value="부산">부산광역시</option>
      <option value="대구">대구광역시</option>
      <option value="인천">인천광역시</option>
      <option value="광주">광주광역시</option>
      <option value="대전">대전광역시</option>
      <option value="울산">울산광역시</option>
      <option value="세종">세종특별자치시</option>
      <option value="경기">경기도</option>
      <option value="강원">강원도</option>
      <option value="충청북도">충청북도</option>
      <option value="충청남도">충청남도</option>
      <option value="전라북도">전라북도</option>
      <option value="전라남도">전라남도</option>
      <option value="경상북도">경상북도</option>
      <option value="경상남도">경상남도</option>
      <option value="제주특별자치도">제주특별자치도</option>
   </select>
   <!-- 시/도 선택시 구/군 선택 --> 
   <select name="gugun" id="gugun" title="시군구선택" class="custom-select" style="background-color:rgba(255,255,255,0.7); border-radius:1em; width:25%;" >
      <option value="">구/군</option>
   </select>
                                    <button type="submit" class="btn dorne-btn" style="background-color:#ff3479; border-radius:1em;"><i class="fa fa-search pr-2" aria-hidden="true"></i>숙소검색</button>
                                </form>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- ***** Welcome Area End ***** -->

    <!-- ***** Catagory Area Start ***** -->
    <section style="background-color:#ff3479;"class="dorne-catagory-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="all-catagories">
                        <div class="row">
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div style="background-color:white;" class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.2s">
                                    <a href="../lodge/lodgeList.do?mode=모텔">
                                    <div class="catagory-content" >
                                       
                                        <img src="../resources/common/img/core-img/motel.png" alt="">
                                            <h6 style="color:black;">모텔</h6>
                                        
                                    </div>
                                    </a>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md" >
                                <div style="background-color:white;" class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.3s">
                                   <a href="../lodge/lodgeList.do?mode=호텔/리조트">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/hotel.png" alt="">
                                     	  
                                            <h6 style="color:black;">호텔/리조트</h6>
                                         
                                    </div>
                                    </a>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div style="background-color:white;" class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.4s">
                                    <a href="../lodge/lodgeList.do?mode=펜션/풀빌라">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/pension.png" alt="">
                                        
                                            <h6 style="color:black;">펜션/풀빌라</h6>
                                        
                                    </div>
                                    </a>
                                </div>
                            </div> 
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div style="background-color:white;" class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.5s">
                                    <a href="../lodge/lodgeList.do?mode=게스트하우스">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/guesthouse.png" alt="">
                                        
                                            <h6 style="color:black;">게스트하우스</h6>
                                        
                                    </div>
                                    </a>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ***** About Area Start ***** -->
    <section class="dorne-about-area section-padding-0-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="about-content text-center">
						<!--<h2>야가자<br><span>Dorne</span></h2>-->                    
					</div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** About Area End ***** -->

	<%@include file="/resources/include/yagajaBottom.jsp" %>

    
</body>

</html>