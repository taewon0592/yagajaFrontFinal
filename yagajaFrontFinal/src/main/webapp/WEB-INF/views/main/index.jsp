<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<%@include file="/resources/include/yagajaTop.jsp" %>

<body>

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
                            <div style="background-color:white;" class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab">

                                <form action="#" method="get">
                                    <select class="custom-select">
                                        <option selected >숙박유형</option>
                                        <option value="1">모텔</option>
                                        <option value="2">호텔</option>
                                        <option value="3">펜션</option>
                                        <option value="4">게스트하우스</option>
                                    </select>
                                    <select class="custom-select">
                                        <option selected>체크인</option>
                                        <option value="1">Catagories 1</option>
                                        <option value="2">Catagories 2</option>
                                        <option value="3">Catagories 3</option>
                                    </select>
                                    <select class="custom-select">
                                        <option selected>체크아웃</option>
                                        <option value="1">$100 - $499</option>
                                        <option value="2">$500 - $999</option>
                                        <option value="3">$1000 - $4999</option>
                                    </select>
                                    <button type="submit" class="btn dorne-btn" style="background-color:#ff3479"><i class="fa fa-search pr-2" aria-hidden="true"></i>숙소검색</button>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="nav-events" role="tabpanel" aria-labelledby="nav-events-tab">
                                <h6>What are you looking for?</h6>
                                <form action="#" method="get">
                                    <select class="custom-select">
                                        <option selected>Your Destinations</option>
                                        <option value="1">New York</option>
                                        <option value="2">Latvia</option>
                                        <option value="3">Dhaka</option>
                                        <option value="4">Melbourne</option>
                                        <option value="5">London</option>
                                    </select>
                                    <select class="custom-select">
                                        <option selected>All Catagories</option>
                                        <option value="1">Catagories 1</option>
                                        <option value="2">Catagories 2</option>
                                        <option value="3">Catagories 3</option>
                                    </select>
                                    <select class="custom-select">
                                        <option selected>Price Range</option>
                                        <option value="1">$100 - $499</option>
                                        <option value="2">$500 - $999</option>
                                        <option value="3">$1000 - $4999</option>
                                    </select>
                                    <button type="submit" class="btn dorne-btn"><i class="fa fa-search pr-2" aria-hidden="true"></i> Search</button>
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
                                    <div class="catagory-content" >
                                        <img src="../resources/common/img/core-img/motel.png" alt="">
                                        <a href="#">
                                            <h6 style="color:black;">모텔</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md" >
                                <div style="background-color:white;" class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.3s">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/hotel.png" alt="">
                                        <a href="#">
                                            <h6 style="color:black;">호텔</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div style="background-color:white;" class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.4s">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/pension.png" alt="">
                                        <a href="#">
                                            <h6 style="color:black;">펜션</h6>
                                        </a>
                                    </div> 
                                </div>
                            </div> 
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div style="background-color:white;" class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.5s">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/guesthouse.png" alt="">
                                        <a href="#">
                                            <h6 style="color:black;">게스트하우스</h6>
                                        </a>
                                    </div>
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
</body>

</html>