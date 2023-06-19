<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>카카오 결제 페이지</title>
  <link href="${contextPath}/resources/css/payment/payment.css" rel="stylesheet">
 <style>


 </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <h1>카카오 결제 페이지</h1>

  <div class="container">
    <form id="payment-form">
      <div class="form-group">
        <label for="payment-info">결제 정보</label>
        <input type="text" id="payment-info" name="payment-info" requiredreadonly>
      </div>

      <div class="form-group">
        <label for="payment-method">결제 수단</label>
        <div class="radio-box">
          <input type="radio" id="payment-method-kakaopay" name="payment-method" value="kakaopay" required>
          <label for="payment-method-kakaopay">카카오페이</label>
        </div>
      </div>
      <div class="form-group">
        <label for="payment-amount">결제 금액</label>
        <div class="form-group">
          <div class="input-box with-border">
            <label for="item-price" class="input-label">상품 금액:</label>
            <input type="text" id="item-price" name="item-price" class="input-value" placeholder="상품 금액" readonly>
          </div>
          <div class="input-box with-border">
            <label for="discount" class="input-label">할인 금액:</label>
            <input type="text" id="discount" name="discount" class="input-value" placeholder="할인 금액" readonly>
          </div>
          <div class="input-box with-border">
            <label for="total-amount" class="input-label">총 금액:</label>
            <input type="text" id="total-amount" name="total-amount" class="input-value" placeholder="총 금액" readonly>
          </div>
        </div>
      </div>

      <button type="submit" class="submit-button">구매하기</button>
    </form>
  </div>

  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script src="${contextPath}/resources/js/payment.js">
 
  </script>
</body>
</html>
