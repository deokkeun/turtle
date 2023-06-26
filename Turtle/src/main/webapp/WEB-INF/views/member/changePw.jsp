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
    <!-- Vendor CSS Files -->
	<link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
     <!-- 랜딩(헤더/풋터).css -->
     <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-header.css" />
     <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-footer.css" />
	<!-- main-style.css -->
    <!-- <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css"> -->
	<!-- changePw.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/changePw.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>
	
	<main>
    	<!-- [0] 랜딩 헤더.jsp -->
        <jsp:include page="/WEB-INF/views/common/landing-header.jsp" /> 
		
        <!-- 비로그인의 경우 이메일 인증 후 비밀번호 변경 -->
        <form action="myPage/newChangePassword" method="POST" onsubmit="return newChangePwValidate()">
          
            <section id="myPageChangePw-box">

                <section>
                    <div class="changePw-title">비밀번호</div>
                    <div class="changePw-subTitle">안전한 비밀번호를 만들고 같은 비밀번호를 다른 계정에 사용하지 마세요.</div>
                </section>

                <section id="myPageChangePw-inner-box">
                    <section class="myPageChangePw-input-box">
                        <div class="input-message">새 비밀번호</div>
                        <input type="password" class="newPw input" name="newPw" autocomplete="false">
                        <button type="button" class="showPw"><img src="${contextPath}/resources/images/member/eye-off.svg" alt="비밀번호 보기"></button>
                        <input type="hidden" class="showPw-value" value="0">
                        <div id="input-message-red"></div>
                    </section>
                    <section>
                        <div>
                            비밀번호 안전성: <span id="confirm-message"></span>
                        </div>
                        <div id="password-safety">
                            8자 이상 입력하세요. 다른 사이트에서 쓰는 비밀번호나 애완동물의 이름처럼<br>
                            추측하기 쉬운 이름은 사용하지 마세요.
                        </div>
                    </section>
                    <section class="myPageChangePw-input-box">
                        <div class="input-message">새 비밀번호 확인</div>
                        <input type="password" class="newPwConfirm input" name="newPwConfirm" autocomplete="false">
                        <button type="button" class="showPw"><img src="${contextPath}/resources/images/member/eye-off.svg" alt="비밀번호 보기"></button>
                        <input type="hidden" class="showPw-value" value="0">
                    </section>
                    <section>
                        <button type="submit" class="changePw-btn">비밀번호 변경</button>
                    </section>
                </section>
                
            </section>

            <!-- memNo 비회원인 경우 이메일로 회원 번호 넘겨주고 비밀번호 변경 -->
            <input type="hidden" name="memNo" value="${memNo}">

        </form>
  		
    

    </main>


    <!-- top버튼 -->
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
		<img src="${contextPath}/resources/images/top버튼거북이.png" alt="거북이" width="50px" >
	    <!-- <i class="bi bi-arrow-up-short"></i> -->
	</a>
      
    <script>
        const contextPath = "${contextPath}";
    </script>

    <!-- 랜딩 푸터.jsp -->
    <jsp:include page="/WEB-INF/views/common/landing-footer.jsp" />
   
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- changePw.js 연결 -->
    <script src="${contextPath}/resources/js/member/changePw.js"></script>
    <!-- landing2.js (프론트 최종작업용) 연결 -->
    <script src="${contextPath}/resources/js/landing2.js"></script>
    <!-- Vendor JS Files -->	  
	<script src="${contextPath}/resources/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${contextPath}/resources/vendor/aos/aos.js"></script>
	<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/php-email-form/validate.js"></script>

</body>
</html>