<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/workspace/memo.css">
</head>
<body>
    메모장 리스트 확인
    <div id="memo-area">
    <c:forEach var="memo" items="${memoList}">
    	<fmt:formatDate var="memoDate" value="${memo.memoUpdateDate}" pattern="MM-dd HH:mm"/>
    	<div>
    		<span>최근 수정자 : ${memo.updatePmNo}</span><br>
    		<span>최근 수정일 : ${memoDate}</span><br>
    		<div class="memoContent" contenteditable="true" style="background-color: ${memo.memoBgColor}">${memo.memoContent}</div>
    	</div>
    </c:forEach>
    </div>
    
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- loadmap.js 연결 -->
    <script src="${contextPath}/resources/js/workspace/memo.js"></script>
</body>
</html>