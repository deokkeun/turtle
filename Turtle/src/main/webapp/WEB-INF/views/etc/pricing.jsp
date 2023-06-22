<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="" name="description">
    <meta content="" name="keywords">
  
    <title>요금제</title>
    
    <!-- Favicons -->
  	<link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
  	<link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
    
    <!-- Fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
    
    <!-- Vendor CSS Files -->
	<link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    
    <!-- 헤더, 이용약관 css  -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-header.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/etc/pricing.css" />
</head>


<body>
	<main>	
		<!-- 랜딩 헤더.jsp -->
		<jsp:include page="/WEB-INF/views/common/landing-header.jsp" /> 
    
		<!-- 첫번째 페이지 total 협업툴 -->
    	<i class="bi bi-list mobile-nav-toggle"></i>

		<div class="blank1"></div>
  

        <!-- ======= pricing Section ======= -->
        <section id="pricing" class="pricing">

            <div class="container" data-aos="fade-up">

                <header class="section-header">
                    <p>팀 규모에 따라</p>
                    <p>다양한 <span>요금제</span>로 사용해보세요</p>
                    <!-- <h2>규모에 따라 다양한 요금제로</h2> -->
                </header>

                <div class="row gy-4" data-aos="fade-left">
                    <!-- 무료요금제 -->
                    <div class="col-sm-4" data-aos="zoom-in" data-aos-delay="100">
                        <div class="box">
                            <h3 style="color: #07d5c0;">Basic</h3>
                            <div class="price"><sup></sup>무료<span></span></div>
                            <a href="#" class="btn-buy-using">사용중</a>
                            <div class="intro">
                                <p>협업툴을 처음으로 사용해보는</p>
                                <p class="intro2"><b>소규모팀에 추천</b>합니다</p>
                            </div>
                            <ul>
                                <!--  <li><i class="fa-solid fa-check"></i>프로젝트 1개 생성</li> -->
                                <li><i class="fa-solid fa-check"></i>워크스페이스 최대 3개 생성</li>
                                <li><i class="fa-solid fa-check"></i>멤버 초대 최대 5명</li>
                                <!--  <li><i class="fa-solid fa-check"></i>기초 단체 채팅방, 개인 채팅방 제공 </li> -->
                            </ul>
                        </div>
                    </div>

                    <!-- Standard 요금제 -->
                    <div class="col-sm-4" data-aos="zoom-in" data-aos-delay="200">
                        <div class="box">
                            <span class="featured">best</span>
                            <h3 style="color: #65c600;">Standard</h3>
                            <div class="price"><sup>￦</sup>8,900<span> / 월</span></div>
                            <!-- 로그인이 안되었을 경우 (비로그인 상태) : 로그인모달창 띄우기  -->
							<c:if test="${empty loginMember}">
								<!-- <a id="login-modal-btn">가입하기</a> -->
								<button id="login-modal-btn1" class="btn-buy">가입하기</button>
							</c:if>
							<!-- 로그인이 되었을 경우 (로그인 상태) : 결제페이지 이동  -->
							<c:if test="${!empty loginMember}">
                            	<a href="${contextPath}/payment/payment" class="btn-buy">가입하기</a>
                            </c:if>
                            <div class="intro">
                                <p>프로젝트를 여러팀과 진행하는</p>
                                <p><b>중간 규모팀에 추천</b>합니다</p>
                            </div>
                            <ul>
                                <!--  <li><i class="fa-solid fa-check"></i>프로젝트 5개 생성</li> -->
                                <li><i class="fa-solid fa-check"></i>워크스페이스 최대 5개 생성</li>
                                <li><i class="fa-solid fa-check"></i>멤버 초대 최대 10명</li>
                               <!-- <li><i class="fa-solid fa-check"></i>Basic + 그룹별 채팅방 5개 생성 가능</li> -->
                            </ul>
                        </div>
                    </div>

                    <!-- Pro요금제 -->
                    <div class="col-sm-4" data-aos="zoom-in" data-aos-delay="400">
                        <div class="box">
                            <h3 style="color: #ff0071;">Pro</h3>
                            <div class="price"><sup>￦</sup>12,900<span> / 월</span></div>
                             <!-- 로그인이 안되었을 경우 (비로그인 상태) : 로그인모달창 띄우기  -->
							<c:if test="${empty loginMember}">
								<button id="login-modal-btn2" class="btn-buy">가입하기</button>
							</c:if>
                            <!-- 로그인이 되었을 경우 (로그인 상태) : 결제페이지 이동  -->
							<c:if test="${!empty loginMember}">
                            	<a href="${contextPath}/payment/payment" class="btn-buy">가입하기</a>
                            </c:if>
                            
                      
                            <div class="intro">
                                <p>조직을 운영하는</p>
                                <p><b>대규모팀에 추천</b>합니다</p>
                            </div>
                            <ul>
                               <!--  <li><i class="fa-solid fa-check"></i> 프로젝트 무제한 생성</li> --> 
                                <li><i class="fa-solid fa-check"></i> 워크스페이스 무제한 생성</li>
                                <li><i class="fa-solid fa-check"></i> 멤버 초대 제한 없음</li>
                               <!--  <li><i class="fa-solid fa-check"></i> Basic + 그룹별 채팅방 무제한 생성</li>  --> 
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- End Pricing Section -->
       
        

    </main>
    <!-- End #main -->
    
    
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- Vendor JS Files -->	  
	<script src="${contextPath}/resources/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${contextPath}/resources/vendor/aos/aos.js"></script>
	<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/php-email-form/validate.js"></script>
	
	<!-- landing2.js 연결 -->
	<script src="${contextPath}/resources/js/landing2.js"></script>
	<!-- landing.js (로그인모달창) 연결 -->
	<script src="${contextPath}/resources/js/landing.js"></script>
</body>
</html>