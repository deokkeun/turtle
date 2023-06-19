<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>결제 실패</title>
  <link href="${contextPath}/resources/css/payment/paymentfail.css" rel="stylesheet">
  <style>
 
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <div class="container">
    <h1>결제가 실패하였습니다.</h1>
    <div class="horizontal-line"></div>
    <p class="reason">사유:<span id="failure-reason">OO OOOO</span></p>
    <div class="back-button-container">
      <a href="index.html" class="back-button">돌아가기</a>
    </div>
  </div>
</body>
<script></script>
</html>