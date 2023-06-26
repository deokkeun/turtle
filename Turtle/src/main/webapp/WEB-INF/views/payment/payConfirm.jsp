<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
    <!-- payConfirm -->
    <link href="${contextPath}/resources/css/payment/payConfirm.css" rel="stylesheet">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
     <!-- Favicons -->
    <link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
    <link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
</head>
<body>

	<!-- header include -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main id="main" class="main">

        <div class="container">
            <div class="pay-confirm-title">결제가 완료되었습니다!</div>
            <div class="horizontal-line"></div>
            <div class="details">
              <p>결제번호: <span id="transaction-date">${payInfo.payNo}</span></p>
              <p>구매자: <span id="seller">${payInfo.payName}</span></p>
              <p>상품명: <span id="product">${payInfo.payType}</span></p>
              <p>금액: <span id="amount"><sup>￦</sup>${payInfo.price}</span></p>
              <p>사용 시작일: <span id="transaction-date">${payInfo.payRegDate}</span></p>
              <p>사용 종료일: <span id="transaction-date">${payInfo.expireDate}</span></p>
            </div>
            <p class="pay-result">결제가 성공적으로 완료되었습니다. 감사합니다.</p>
            <div class="back-button-container">
              <a href="${contextPath}/member/login" class="back-button">돌아가기</a>
            </div>
          </div>


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