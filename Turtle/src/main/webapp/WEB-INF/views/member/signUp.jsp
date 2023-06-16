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
  	
    <title>회원가입</title>
    
    <!-- Favicons -->
  	<link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
  	<link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
    
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
	
	<!-- Vendor CSS Files -->
	<link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    
	<!-- 헤더, 회원가입 css  -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-header.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/member/signUp-style.css" />

     <!-- 구글로그인 -->
     <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>

<body>
    <main>
        <!-- 랜딩 헤더.jsp  -->
       	<jsp:include page="/WEB-INF/views/common/landing-header.jsp" />
		

           <section class="signUp-content">
    
            <form
              action="signUp"
              method="POST"
              name="signUp-form"
              onsubmit="return signUpValidate()"
            >
              <h1 class="signUp_title"> 회원가입 </h1>
              <div class="signUp-input-area">
                <input
                  type="text"
                  id="memberEmail"
                  name="memberEmail"
                  placeholder="아이디(이메일)"
                  maxlength="30"
                  autocomplete="off"
                  required
                />

                <button type="button" id="sendBtn">인증번호 받기</button>
              </div>
    
              <span class="signUp-message" id="emailMessage"
                >메일을 받을 수 있는 이메일을 입력해주세요.</span
              >
    
    
              <div class="signUp-input-area">
                <!-- cNumber -->
                <input
                  type="text"
                  id="cNumber"
                  placeholder="인증번호 입력"
                  maxlength="6"
                  autocomplete="off"
                />
    
                <button type="button" id="cBtn">인증하기</button>
              </div>
    
              <!-- 5:00 타이머 / 인증되었습니다(녹색) / 인증 시간이 만료되었습니다.(빨간색) -->
              <span class="signUp-message" id="cMessage"></span>
    
    
              <div class="signUp-input-area">
                <input
                  type="password"
                  id="memberPw"
                  name="memberPw"
                  placeholder="비밀번호"
                  maxlength="30"
                />
              </div>
    
              <div class="signUp-input-area">
                <input
                  type="password"
                  id="memberPwConfirm"
                  placeholder="비밀번호 확인"
                  maxlength="30"
                />
              </div>
    
              <span class="signUp-message" id="pwMessage"
                >영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.</span
              >
    
    
              <div class="signUp-input-area">
                <input
                  type="text"
                  id="memberName"
                  name="memberName"
                  placeholder="이름"
                  maxlength="10"
                />
              </div>
    
              <span class="signUp-message" id="nameMessage"
                >영어/한글 2~10글자 사이로 작성해주세요.</span
              >

    
              <button type="submit" id="signUp-btn">가입하기</button>
              <div class="hr-sect">or</div>

				<div id="g_id_onload"
				     data-client_id="713601013116-33sqneo96i1er8o2e6bs5a8o5522k2rq.apps.googleusercontent.com"
				     data-context="signin"
				     data-ux_mode="popup"
				     data-login_uri="http://localhost:8080/www/member/login"
				     data-auto_prompt="false">
				</div>
				
				<div class="g_id_signin"
				     data-type="standard"
				     data-shape="rectangular"
				     data-theme="outline"
				     data-text="signup_with"
				     data-size="large"
				     data-locale="en-US"
				     data-logo_alignment="center"
				     data-width="700">
				</div>	
              <!-- <button type="button" id="googlesignup" class="googlesignup_btn"><img src="${contextPath}/resources/images/auth/free-icon-google-300221.png" width="15" height="15">Google계정으로 가입</button> -->
            </form>
          </section>

        <!-- 1. 로그인 세션이 있으면 메인페이지로 바로 이동 -->
        <!-- 2. 로그인 세션이 없으면 현재 페이지 -->
        <%-- <c:if test="${!empty sessionScope.loginMember}">
        	<!-- member/login -> common/main.jsp -->
        	<jsp:forward page="member/login" />
        </c:if> --%>

		
    </main>

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
  
    <!-- landing.js 연결 -->
    <script src="${contextPath}/resources/js/landing2.js"></script>
    <script src="${contextPath}/resources/js/member/signUp.js"></script>

</body>
</html>