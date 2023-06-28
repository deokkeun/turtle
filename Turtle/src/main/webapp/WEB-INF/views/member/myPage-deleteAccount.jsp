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
               <div>탈퇴 안내 사항</div>
               <div>서비스에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?<br>
                그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!</div>
           </section>
           
           <!-- 회원탈퇴 -->
           <form action="../myPage/deleteAccount" method="POST">
            <section id="deleteAccount-box">
                <section>
                    <div>1. 계정 탈퇴 시, Tutle 서비스에서 모두 탈퇴됩니다.</div>
                    <div>2. 탈퇴 시 계정과 관련된 모든 권한이 사라지며 복구할 수 없습니다.</div>
                    <div>3. 탈퇴 후 동일한 메일로 재가입이 가능하나, 탈퇴한 계정과 연동되지 않습니다.</div>
                    <div>4. 탈퇴 후 연동된 소셜 계정 정보도 사라지며 소셜 로그인으로 기존 계정 이용이 불가능합니다.</div>
                </section>
                <section>
                    <input type="checkbox" name="agree" id="agree">
                    <label for="agree">위 약관에 동의합니다.</label>
                </section>
                <section>
                    <div class="inputPw-message">현재 비밀번호</div>
                    <input type="password" name="memberPw"  class="inputPw" id="memberPw" autocomplete="false">
                </section>
                <section>
                    <button type="button" id="deleteAccount-btn">회원 탈퇴</button>
                </section>
                </section>
            </section>


            <!-- 모달창 -->
            <div id="modal" class="modal">
                <div class="modal-contentAccount">
                    <h4>정말 탈퇴하시겠어요?</h4>
                    <p>탈퇴 버튼 선택 시, 계정은<br> 삭제되며 복구되지 않습니다.</p>
                    <div class="modal-buttons">
                        <button id="confirmDelete">탈퇴</button>    
                        <button type="button" id="closeModal">취소</button>
                    </div>
                </div>
            </div>


        </form>




    </main>

    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- deleteAccount.js 연결 -->
    <script src="${contextPath}/resources/js/member/deleteAccount.js"></script>
</body>
</html>