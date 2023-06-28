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
  	
    <title>고객센터</title>
    
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
    
    <!-- 헤더, 고객센터 css  -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-header.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/etc/faq.css" />
</head>


<body>
	<main>
		<!-- 랜딩 헤더.jsp -->
		<jsp:include page="/WEB-INF/views/common/landing-header.jsp" /> 

		<!-- 첫번째 페이지 total 협업툴 -->
		<i class="bi bi-list mobile-nav-toggle"></i>
		
		<div class="blank1"></div>
    	
    	
         <!-- ======= F.A.Q Section ======= -->
        <section id="faq" class="faq">

            <div class="container" data-aos="fade-down">
  
                <header class="section-header">
                    <p>자주 묻는 질문</p>
                </header>
        
                <div class="row">
                    <!-- 왼쪽 faq 3개-->
                    <div class="col-lg-6">
                        <div class="accordion accordion-flush" id="faqlist1">
                            <!-- 왼쪽 첫번째 질문 -->
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                                        요금제 중에 연 단위 결제는 없나요? 연 단위로 결제시 할인혜택은 없나요?
                                    </button>
                                </h2>
                                <!-- 왼쪽 첫번째 질문답 -->
                                <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                                    <div class="accordion-body">
                                        죄송합니다. 현재는 월 단위로 결제만 가능하며, 현재 진행중인 할인 프로모션은 없습니다.
                                        추 후에 진행될 경우 홈페이지를 통해 공지하도록 하겠습니다.
                                    </div>
                                </div>
                            </div>
                            <!-- 왼쪽 두번째 질문 -->
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-2">
                                        질문2
                                    </button>
                                </h2>
                                <!-- 왼쪽 두번째 질문답 -->    
                                <div id="faq-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                                    <div class="accordion-body">
                                        답변2
                                    </div>
                                </div>
                            </div> 
                             <!--왼쪽 세번째 질문  -->
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-3">
                                        질문3
                                    </button>
                                </h2>
                                <!-- 왼쪽 세번째 질문답  -->
                                <div id="faq-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                                    <div class="accordion-body">
                                        답변3
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        
                    <!-- 오른쪽 faq 3개-->
                    <div class="col-lg-6">   
                        <div class="accordion accordion-flush" id="faqlist2">
                            <!-- 오른쪽 첫번째 질문 -->
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-1">
                                        질문4
                                    </button>
                                </h2>
                                <!-- 오른쪽 첫번째 질문답 -->
                                <div id="faq2-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                                    <div class="accordion-body">
                                        답변4
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 오른쪽 두번째 질문 -->
                            <div class="accordion-item">
                            	<h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-2">
                                        질문5
                                    </button>
                                </h2>
                                <!-- 오른쪽 두번째 질문답 -->
                                <div id="faq2-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                                    <div class="accordion-body">
                                        답변5
                                    </div>
                                </div>
                            </div>
                            <!-- 오른쪽 세번째 질문 -->
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-3">
                                        질문6
                                    </button>
                                </h2>
                                <!-- 오른쪽 세번째 질문답 -->
                                <div id="faq2-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                                    <div class="accordion-body">
                                        답변6
                                    </div>
                                </div>
                            </div>
        
                        </div>
                    </div>
        
                </div>
            </div>
        </section>
        <!-- End F.A.Q Section -->
    

        <!-- ======= Contact Section ======= -->
        <section id="contact" class="contact">
            <div class="container">
                <div class="row" data-aos="fade-down">

                    <div class="col-lg-6 textfaq" data-aos="fade-down">
                        <h3>원하는 답변을 찾지 못했나요?</h3>
                        <h5>TeamTurtle분들이 신속한 답변으로</h5>
                        <h5>도와드리겠습니다.</h5>
                    </div>

                    <div class="textfaq2 col-lg-4">
                        <div class="email">
                            <h4><i class="fa-regular fa-comment-dots"></i> Turtle 채팅 문의</h4>
                            <span>turtle.ad@turtle.com</span>
                        </div>
                    </div>
                        <!-- <h4><i class="fa-regular fa-envelope"></i> Turtle 이메일 문의</h4>
                            <p>turtle.ad@turtle.com</p>   -->
                </div>
            </div>
        </section>
        <!-- End Contact Section -->

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
</body>
</html>