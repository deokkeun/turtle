<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
    <!-- pay -->
	<!-- <link rel="stylesheet" href="${contextPath}/resources/css/payment/pay.css" /> -->
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>

	<!-- header include -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main id="main" class="main">

        <div>결제 확인</div>




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
    <!-- pay.js 연결 -->
    <!-- <script src="${contextPath}/resources/js/payment/pay.js"></script> -->
    <!-- chat js -->
    <!-- <script src="${contextPath}/resources/js/chat.js"></script> -->
</body>
</html>