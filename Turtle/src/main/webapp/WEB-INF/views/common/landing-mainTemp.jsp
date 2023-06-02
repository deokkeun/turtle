<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
    <!-- landing-style.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/landing-style.css">
    <!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
    
    <title>임시랜딩body</title>
</head>
<body>
    

   
		

     <h1>임시랜딩 페이지</h1>
     
     
     <!-- 1. 로그인 세션이 있으면 메인페이지로 바로 이동 -->
     <!-- 2. 로그인 세션이 없으면 현재 페이지 -->
     <!-- (아이디 저장 쿠키 유지기간 1년) -->
      <c:if test="${!empty sessionScope.loginMember}">
       <!-- ( member/login -> common/main.jsp ) -->
       <jsp:forward page="member/login" />
     </c:if>


      

    <BR>
    <BR>
    <BR>
    <BR>

      <H1>TOTAL 협업툴</H1>
      <H3>소개홍보 문구적기</H3>


      <button type="button" class="btn btn-secondary">무료로 사용하기 ></button>

      <BR>
        <BR>
        <BR>
        <BR>

            <HR>



     
      <h3> 하나의 툴로 모든 프로젝트 및 업무 관리 </h3>
      <h6> 해당 기능에 대한 홍보 문구 작성하기 </h6>
      
      <div>
		캐러셀슬라이드기능. 백단은 패스패스
		</div>

      <BR>
        <BR>
        <BR>
        <BR>

      <hr>



      <h3> 내가 만들고 싶은대로 커스텀 프로젝트 관리 </h3>
      <h6> 해당 기능에 대한 홍보 문구 작성하기 </h6>

        <button type="button" class="btn btn-success">워크스페이스</button>
        <button type="button" class="btn btn-danger">실시간 채팅</button>
        <button type="button" class="btn btn-warning">실시간 알림</button>
        <button type="button" class="btn btn-info">멤버 관리</button>


		<div>
		위에 버튼은 ajax나 템플릿 이용해서 바꾸기.... back단은 패스패스?
		</div>
        <BR>
            <BR>
            <BR>
            <BR>

      <hr>


      <h3> PC, 핸드폰 기기 제한 없이 최적화된 화면 제공</h3>
      <h6> 해당 기능에 대한 홍보 문구 작성하기 </h6>
      
      <div>
		템플릿 이용해서 바꾸기.... back단은 패스패스?
	  </div>

      <BR>
        <BR>
        <BR>
        <BR>

      <hr>

      <div>
        <h3> Turtle과 함께 업무 효율성을 높여보세요 </h3>
        <button type="button" class="btn btn-secondary">무료로 사용하기 ></button>
      </div>




    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>


 <!-- jQuery 라이브러리 추가 -->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 <!-- landing.js 연결 -->
 <script src="${contextPath}/resources/js/landing.js"></script>

</body>
</html>