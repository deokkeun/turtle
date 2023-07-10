<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>결제 완료</title>
  <link href="${contextPath}/resources/css/payment/paymentcomplete.css" rel="stylesheet">
  <style>
 
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <div class="container">
    <h1>결제가 완료되었습니다!</h1>
    <div class="horizontal-line"></div>
    <div class="details">
      <p>거래일시: <span id="transaction-date"></span></p>
      <p>판매자: <span id="seller"></span></p>
      <p>거래상품: <span id="product"></span></p>
      <p>금액: <span id="amount"></span></p>
    </div>
    <p>결제가 성공적으로 완료되었습니다. 감사합니다.</p>
    <div class="back-button-container">
      <a href="index.html" class="back-button">돌아가기</a>
    </div>
  </div>
</body>
</html>