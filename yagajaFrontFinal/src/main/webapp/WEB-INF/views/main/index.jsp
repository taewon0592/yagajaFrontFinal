<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<%@include file="/resources/include/yagajaTop.jsp" %>
<body>

    <!-- ***** Welcome Area Start ***** -->
    <section class="dorne-welcome-area bg-img bg-overlay" style="background-image: url(../resources/common/img/bg-img/hero-1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-12 col-md-10">
                    <div class="hero-content">
                        <h2 style="color:pink; text-size:4em">야가자</h2>
                    </div>
                    <!-- Hero Search Form -->
                    <div class="hero-search-form">
                        <!-- Tabs -->
                     <!--    <div class="nav nav-tabs" id="heroTab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-places-tab" data-toggle="tab" href="#nav-places" role="tab" aria-controls="nav-places" aria-selected="true">검색</a>
                        </div> -->
                        <!-- Tabs Content -->
                        <div class="tab-content" id="nav-tabContent" >
                            <div class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab" >
                                <h6>뭐찾냐</h6>
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
                                    <button type="submit" class="btn dorne-btn"><i class="fa fa-search pr-2" aria-hidden="true"></i>검색</button>
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
 <!--        Hero Social Btn
        <div class="hero-social-btn">
            <div class="social-title d-flex align-items-center">
                <h6>Follow us on Social Media</h6>
                <span></span>
            </div>
            <div class="social-btns">
                <a href="#"><i class="fa fa-linkedin" aria-haspopup="true"></i></a>
                <a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-haspopup="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-haspopup="true"></i></a>
            </div>
        </div> -->
    </section>
    <!-- ***** Welcome Area End ***** -->

    <!-- ***** Catagory Area Start ***** -->
    <section class="dorne-catagory-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="all-catagories">
                        <div class="row">
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div class="single-catagory-area wow fadeInUpBig" style="background-color:#FF3478" data-wow-delay="0.2s">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/icon-1.png" alt="">
                                        <a href="#">
                                            <h6>모텔</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div class="single-catagory-area wow fadeInUpBig" style="background-color:#FF3478" data-wow-delay="0.4s">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/icon-2.png" alt="">
                                        <a href="#">
                                            <h6>호텔/리조트</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div class="single-catagory-area wow fadeInUpBig" style="background-color:#FF3478" data-wow-delay="0.6s">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/icon-3.png" alt="">
                                        <a href="#">
                                            <h6>펜션/풀빌라</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div class="single-catagory-area wow fadeInUpBig"  style="background-color:#FF3478" data-wow-delay="0.8s">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/icon-4.png" alt="">
                                        <a href="#">
                                            <h6>게스트하우스</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
						<!--   Single Catagory Area
                            <div class="col-12 col-md">
                                <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="1s">
                                    <div class="catagory-content">
                                        <img src="../resources/common/img/core-img/icon-5.png" alt="">
                                        <a href="#">
                                            <h6>Cinema</h6>
                                        </a>
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Catagory Area End ***** -->

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