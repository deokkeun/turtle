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
	<!-- myPageInfo.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPageInfo.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
 		<!-- header include -->
       	<jsp:include page="/WEB-INF/views/common/header.jsp" />


        <div>마이페이지</div>
        <div><img src="" alt=""> 프로필 이미지</div>
       	<div>이름 (변경불가) ${loginMember.memberName}</div>
        <div></div>

	
		<section id="content-box">
	
	        <div>개인정보 이미지 변경 테스트</div>
	        
	        <form action="profile" method="POST" name="myPage-form"
	                enctype="multipart/form-data" onsubmit="return profileValidate()">
	            
	            <div class="profile-image-area">
	                <c:if test="${empty loginMember.profileImage}">
	                    <img src="${contextPath}/resources/images/memberProfile/member.png" alt="profile-image" id="profile-image">
	                </c:if>
	
	                <c:if test="${!empty loginMember.profileImage}">
	                    <img src="${contextPath}${loginMember.profileImage}" alt="profile-image" id="profile-image">
	                </c:if>
	            </div>
	            
	
	            <div class="profile-btn-area">
	                <input type="file" name="uploadImage" id="input-image" accept="image/*">
	                <label for="input-image">
	                    파일선택(사진버튼으로 변경)
	                </label>
	                <input type="button" id="delete-image" value="삭제하기">
	               
	                <button type="submit">변경하기(팝업으로 변경)</button>
	            </div>
	
	            <!-- 삭제버튼 안눌러짐(0), 눌러짐(1)  -->
	            <input type="hidden" name="delete" id="delete" value="0">
	
	        </form>
		</section>



        <form action="../myPage/deleteAccount" method="GET">
            <button>회원탈퇴</button>
        </form>
	


    </main>
    
  
    <script>
        const contextPath = "${contextPath}";
    </script>
    
    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- myPageInfo.js 연결 -->
    <script src="${contextPath}/resources/js/member/myPageInfo.js"></script>
</body>
</html>