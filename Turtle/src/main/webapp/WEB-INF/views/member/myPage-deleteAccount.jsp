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
	<!-- deleteAccount.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/deleteAccount.css">
    <!-- deleteAccountModal.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/deleteAccountModal.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>
    <main id="main" class="main">
 		<!-- header include -->
       	<jsp:include page="/WEB-INF/views/common/header.jsp" />

           <section id="deleteAccount-title">
               <div>회원탈퇴</div>
           </section>
           
           <!-- 회원탈퇴 -->
           <form action="../myPage/deleteAccount" method="POST" onsubmit="return deleteAccountValidate()">
            <section id="deleteAccount-box">
                <section>
                    <div>1. 회원 탈퇴 약관....</div>
                    <div>2. 회원 탈퇴 약관....</div>
                    <div>3. 회원 탈퇴 약관....</div>
                    <div>4. 회원 탈퇴 약관....</div>
                    <div>5. 회원 탈퇴 약관....</div>
                </section>
                <section>
                    <input type="checkbox" name="agree" id="agree">
                    <label for="agree">위 약관에 동의합니다.</label>
                </section>
                <section>
                    <div>현재 비밀번호</div>
                    <input type="password" name="memberPw" id="memberPw">
                </section>
                <section>
                    <button id="deleteAccount-btn" onclick="openModal()">회원 탈퇴</button>
                </section>
                </section>
            </section>
        </form>

          <!-- 모달창 -->
          <div id="modal" class="modal">
            <div class="modal-contentAccount">
                <h2>정말 탈퇴하시겠습니까?</h2>
                <p>탈퇴할 경우, TURTLE의 모든 서비스를 이용할 수 없습니다.</p>
                <div class="modal-buttons">
                    <button onclick="closeModal()" id="closeModal">아니오</button>
                    <button onclick="confirmDelete()" id="confirmDelete">예, 탈퇴하겠습니다.</button>    
                </div>
            </div>
        </div>


    </main>

    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>