<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
	<!-- main-style.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
	<!-- changePw.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/changePw.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
 		<!-- header include -->
       	<jsp:include page="/WEB-INF/views/common/header.jsp" />

        <!-- 비로그인의 경우 이메일 인증 후 비밀번호 변경 -->
        <form action="myPage/newChangePw" method="POST" onsubmit="return newChangePwValidate()">
          
            <section id="myPageChangePw-box">

                <section>
                    <div class="changePw-title">비밀번호</div>
                    <div class="changePw-subTitle">안전한 비밀번호를 만들고 같은 비밀번호를 다른 계정에 사용하지 마세요.</div>
                </section>

                <section id="myPageChangePw-inner-box">
                    <section class="myPageChangePw-input-box">
                        <div>새 비밀번호</div>
                        <input type="password" class="newPw input" name="newPw" autocomplete="false">
                        <img src="${contextPath}/resources/images/memberProfile/member.png" alt="비밀번호 보기">
                    </section>
                    <section>
                        <div>
                            비밀번호 안전성:
                        </div>
                        <div id="password-safety">
                            8자 이상 입력하세요. 다른 사이트에서 쓰는 비밀번호나 애완동물의 이름처럼<br>
                            추측하기 쉬운 이름은 사용하지 마세요.
                        </div>
                    </section>
                    <section class="myPageChangePw-input-box">
                        <div>새 비밀번호 확인</div>
                        <input type="password" class="newPwConfirm input" name="newPwConfirm" autocomplete="false">
                        <img src="${contextPath}/resources/images/memberProfile/member.png" alt="비밀번호 보기">
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

    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- changePw.js 연결 -->
    <script src="${contextPath}/resources/js/member/changePw.js"></script>
</body>
</html>