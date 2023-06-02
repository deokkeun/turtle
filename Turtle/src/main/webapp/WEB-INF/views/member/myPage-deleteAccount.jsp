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
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
 		<!-- header include -->
       	<jsp:include page="/WEB-INF/views/common/header.jsp" />

  
        <!-- 회원탈퇴 테스트 -->
        <section style="border: 1px solid black;">
            <form action="../myPage/deleteAccount" method="POST" onsubmit="return deleteAccountValidate()">
                현재 비밀번호<input type="password" name="memberPw" id="memberPw">
                <div>회원 탈퇴 약관....</div>
                <input type="checkbox" name="agree" id="agree">
                <label for="agree">위 약관에 동의합니다.</label>
                <button>회원 탈퇴</button>
            </form>
        </section>


<<<<<<< Updated upstream:Turtle/src/main/webapp/WEB-INF/views/member/myPage-deleteAccount.jsp
=======
        <div>로그인시(멤버정보)</div>
        <div>회원번호 : ${loginMember.memberNo}</div>
        <div>회원명 : ${loginMember.memberName}</div>
        <div>프로필 이미지 : ${loginMember.profileImage}</div>
        <div>회원 이메일 : ${loginMember.memberEmail}</div>
        <div>회원 가입일 : ${loginMember.enrollDate}</div>
        <div>
            access_token
            <input type="text" name="access_token" value="" style="width: 600px;">
        </div>
        
>>>>>>> Stashed changes:Turtle/target/www-1.0.0-BUILD-SNAPSHOT/WEB-INF/views/common/main.jsp

    </main>

    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>