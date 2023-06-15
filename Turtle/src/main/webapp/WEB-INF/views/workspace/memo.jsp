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
    	<fmt:formatDate var="memoRegDate" value="${memo.memoRegDate}" pattern="MM-dd HH:mm"/>
    	<fmt:formatDate var="memoUpdateDate" value="${memo.memoUpdateDate}" pattern="MM-dd HH:mm"/>
    	<c:choose>
    		<c:when test="${memo.memoType == 'workspace'}">
    			<div class="workspaceMemoDetail">
    				<input type="hidden" name="pmNo" value="${pmNo}">
		    		<input type="hidden" class="memoNo" value="${memo.memoNo}"/>
		    		<input type="hidden" class="memoBgColor" value="${memo.memoBgColor}">
		    		<span>메모넘버 : ${memo.memoNo}</span>
		    		<span class="updatePmNo">최근 수정자 : ${memo.updatePmNo}</span><br>
		    		<span class="memoUpdateDate">최근 수정일 : ${memoDate}</span><br>
    				<div class="memoContent" contenteditable="true" style="background-color: ${memo.memoBgColor}" tabindex="0">${memo.memoContent}</div>
    			</div>
    		</c:when>
    		<c:otherwise>
    			<div class="personalMemoDetail">
    			<input type="hidden" name="pmNo" value="${pmNo}">
		    		<input type="hidden" class="memoNo" value="${memo.memoNo}"/>
		    		<input type="hidden" class="memoBgColor" value="${memo.memoBgColor}">
		    		<c:choose>
		    			<c:when test="${empty memoUpdateDate}">
		    				<span class="memoUpdateDate">메모 생성일 : ${memoRegDate}</span><br>
		    			</c:when>
		    			<c:otherwise>
		    				<span class="memoUpdateDate">최근 수정일 : ${memoUpdateDate}</span><br>
		    			</c:otherwise>
		    		</c:choose>
		    		
    				<div class="memoContent" contenteditable="true" style="background-color: ${memo.memoBgColor}" tabindex="0">${memo.memoContent}</div>
    			</div>
    		</c:otherwise>
    	</c:choose>
    	
    </c:forEach>
    </div>
    
    
    
    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>    
   
    	const pmNo = "${pmNo}";
    	const workspaceNo = "${workspaceNo}";
    	const contextPath = "${contextPath}";
    	
    	
    	// 로그인이 되어 있을 경우에만
		// /chat 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		let memoSock = new SockJS(contextPath+"/memo");
			// -> websocket 프로토콜을 이용해서 해당 주소로 데이터를 송/수신 할 수 있다.
    </script>
    
    <!-- loadmap.js 연결 -->
    <script src="${contextPath}/resources/js/workspace/memo.js"></script>
</body>
</html>