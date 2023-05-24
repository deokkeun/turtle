<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>

    <link rel="stylesheet" href="resources/css/main-style.css">
	<!-- fontawesome -->

</head>
<body>
    <main>
        
        <!--  jsp:include 태그
            다른 jsp파일의 내용을 해당 위치에 포함시킴 
            * 경로 작성 시 
                외부 요청 주소 X(인터넷 주소, 최상위 : /Turtle ),  
                내부 접근 경로 O (파일 경로, 최상위 : /webapp )
        -->

        <!-- **project-menu**내부 접근 절대 경로 -->
        <%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>



        <H1>로그인 성공!!</H1>
        <H1>민수 커밋 확인용</H1>
        <H1>덕근 커밋 확인용</H1>



    </main>

    <!--**chat-menu** include -->
   <%--  <jsp:include page="/WEB-INF/views/common/footer.jsp" /> --%>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
   
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>

</body>
</html>