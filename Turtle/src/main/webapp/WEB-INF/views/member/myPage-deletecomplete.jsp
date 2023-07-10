<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>탈퇴 완료</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/deleteComplete.css"/>
</head>
<style>
 
</style>
</head>
<body>
  
   <div id="deletetext">
    <img src="${contextPath}/resources/images/logo/turtleLogo-green.png" alt="로고" />
    <h1>회원 탈퇴가 완료되었습니다.</h1>
	<div>그동안 Turtle을 이용해 주셔서 감사합니다.<br>
	더욱 노력하고 발전하는 Turtle이 되겠습니다.</div>

  <button onclick="window.location.href = '${contextPath}';">홈으로 돌아가기</button>
</body>
</html>