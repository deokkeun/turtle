<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
	<!-- landing-style.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/landing-style.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/signUp.css" />
</head>
<body>
    <main>
        <!-- landing-header include -->
       	<jsp:include page="/WEB-INF/views/common/landing-header.jsp" />
		

        <body>
    <div id="container" class="container">
        <div class="content">
            <div class="join_wrap">
                <form id="join_frm">
                    <div class="join_title">회원가입</div>
                    <div class="join_box">
                        <div class="email_auth">
                            <input type="text" placeholder="이메일" name="email" id="email" class="email">
                        </div>
                        <input type="text" placeholder="닉네임" name="nickname" id="nickname">
                        <span id="nickname_ck" class="dpn">이미 사용중인 닉네임입니다.</span>
                        <input type="password" placeholder="비밀번호" name="password" id="password">
                        <input type="password" placeholder="비밀번호  확인" id="password_ck"  style="
                        margin-bottom: 20px;"
>				                       
                        <a href="#" target='_blank' id="email_auth_btn" class="email_auth_btn">이메일로 인증코드 발송</a>
                        <input type="text" placeholder="인증번호 입력" id="email_auth_key" style="margin-top: 0px;">
                    </div>
                    <button type="button" id="join" class="join_btn">가입하기</button>
                </form>
                <div class="hr-sect">or</div>
                <button type="button" id="googlesignup" class="googlesignup_btn"><img src="${contextPath}/resources/images/auth/free-icon-google-300221.png" width="15" height="15">Google계정으로 가입</button>
            </div>
        </div>
    </div>
    </body>
        <!-- 1. 로그인 세션이 있으면 메인페이지로 바로 이동 -->
        <!-- 2. 로그인 세션이 없으면 현재 페이지 -->
        <%-- <c:if test="${!empty sessionScope.loginMember}">
        	<!-- member/login -> common/main.jsp -->
        	<jsp:forward page="member/login" />
        </c:if> --%>

		

    </main>

    <!-- landing-footer include -->
   	<jsp:include page="/WEB-INF/views/common/landing-footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- landing.js 연결 -->
    <script src="${contextPath}/resources/js/landing.js"></script>
    <script src="${contextPath}/resources/js/member/signUp.js"></script>
</body>
</html>