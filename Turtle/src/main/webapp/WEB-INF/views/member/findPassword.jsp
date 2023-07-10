<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>

    <!-- Favicons -->
  	<link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
  	<link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
  	
  	<!-- Google Fonts -->
  	<!-- 	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|
              Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"> -->
    
    <!-- Fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
    
    <!-- Vendor CSS Files -->
	<link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    
    <!-- 랜딩(헤더/본문/풋터).css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-header.css" />
        <!-- <link rel="stylesheet" href="${contextPath}/resources/css/common/landing.css" /> -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-footer.css" />
	<!-- landing-style.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/landing-style.css">
	<!-- findPassword.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/findPassword.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <!-- landing-header include -->
       	<jsp:include page="/WEB-INF/views/common/landing-header.jsp" />
		
        <section id="findPassword-full-box">
    
            <!-- 상단 -->
            <section>
                <a href="${contextPath}" id="findPassword-top-logo">TURTLE</a>
            </section>

            <!-- 중간 -->
            <section id="slides">
                <section id="findPassword-box">
                    <section class="findPassword-mid-box">
                        <div>
                            비밀번호를 찾고자하는 <strong>이메일 주소를 입력</strong>해주세요.
                        </div>
                        <div>
                            <div class="input-message">이메일</div>
                            <input type="text" class="input-type" name="inputEmail" autocomplete="false">
                        </div>
                        <div>
                            <button class="find-next">다음</button>
                        </div>
                        <div>
                            <div>아이디가 기억나지 않는다면? <a href="">아이디 찾기</a></div>
                        </div>
                    </section>

            
                    <section class="findPassword-mid-box">

                        <div>
                            이메일주소로 발송된 <strong>인증코드를 입력</strong>해주세요.
                        </div>
                        <div>
                            <div class="input-message">인증코드</div>
                            <input type="text" class="input-type" autocomplete="false">
                            <!-- 타이머 -->
                            <span id="cMessage"></span>
                        </div>
                        <div>
                            <button class="find-next">다음</button>
                        </div>
                        <div>
                            <div>아이디가 기억나지 않는다면? <a href="">아이디 찾기</a></div>
                        </div>
                    </section>
                  
                </section>
            </section> 
                
    
            <!-- 하단 -->
            <section id="findPassword-bottom-box">
                <div>
                    <a href="${contextPath}">TURTLE</a>
                </div>
                <div>
                    <a href="">고객센터</a>
                </div>
            </section>
             

        </section>

		

    </main>


    <!-- top버튼 -->
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
		<img src="${contextPath}/resources/images/top버튼거북이.png" alt="거북이" width="50px" >
	    <!-- <i class="bi bi-arrow-up-short"></i> -->
	</a>	



    <script>
        const contextPath = "${contextPath}";
    </script>
    <!-- landing-footer include -->
   	<jsp:include page="/WEB-INF/views/common/landing-footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- landing.js 연결 -->
    <script src="${contextPath}/resources/js/landing.js"></script>
    <!-- findPassword.js 연결 -->
    <script src="${contextPath}/resources/js/member/findPassword.js"></script>

   	<!-- Vendor JS Files -->	  
	<script src="${contextPath}/resources/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${contextPath}/resources/vendor/aos/aos.js"></script>
	<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/php-email-form/validate.js"></script>

    
    <!-- 랜딩 타이핑효과 js (랜딩js보다 위에 있어야함) -->
	<!-- <script src="${contextPath}/resources/js/typeit.min.js"></script> -->
    
    <!-- landing2.js (프론트 최종작업용) 연결 -->
    <script src="${contextPath}/resources/js/landing2.js"></script>
</body>
</html>