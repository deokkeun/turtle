<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>결제 실패</title>
  <link href="paymentfail.css" rel="stylesheet">
  <style>
 
  </style>
</head>
<body>
  <div class="container">
    <h1>결제가 실패하였습니다.</h1>
    <div class="horizontal-line"></div>
    <p class="reason">사유:<span id="failure-reason">OO OOOO</span></p>
    <div class="back-button-container">
      <a href="index.html" class="back-button">돌아가기</a>
    </div>
  </div>
</body>
</html>