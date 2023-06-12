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
</body>
</html>