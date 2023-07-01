<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="memberName" value="${loginMember.memberName}" />
<c:set var="profileImage" value="${loginMember.profileImage}"/>

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
    <div id="memo-area">
	    <c:forEach var="memo" items="${memoList}">
	    	<fmt:formatDate var="memoRegDate" value="${memo.memoRegDate}" pattern="MM-dd HH:mm"/>
	    	<fmt:formatDate var="memoUpdateDate" value="${memo.memoUpdateDate}" pattern="MM-dd HH:mm"/>
	    	<c:choose>
	    		
	    		<c:when test="${memo.memoType eq 'workspace'}">
	    			<div class="memoDetail workspace" data-memoBgColor="${memo.memoBgColor}">
			    		<div class="memoInfo"  style="background-color: ${memo.memoBgColor}">
							<span class="profile-image"><img src="${contextPath}${memo.profileImg}"></span>
			    			<span class="memberName">${memo.memberName}</span> 
			    			<c:choose>
				    			<c:when test="${empty memoUpdateDate}">
				    				<span class="memoUpdateDate">${memoRegDate}</span>
				    			</c:when>
				    			<c:otherwise>
				    				<span class="memoUpdateDate">${memoUpdateDate}</span>
				    			</c:otherwise>
				    		</c:choose>	    			
			    			<button>x</button>
			    		</div>	    		
		  				<div class="memoContent" contenteditable="true"
		  					data-pmNo="${pmNo}" data-memoNo="${memo.memoNo}" data-memoType="${memo.memoType}"  style="background-color: ${memo.memoBgColor}">					
		  					${memo.memoContent} 
		  				</div>
			  		</div>
	    		</c:when>
	    		
	    		<c:otherwise>
	    			<div class="memoDetail personal" data-memoBgColor="${memo.memoBgColor}" style="background-color: ${memo.memoBgColor}">
			    		<div class="memoInfo">
							<span class="profile-image"><img src="${contextPath}${memo.profileImg}"></span>
			    			<span>${memo.memberName}</span> 
			    			<c:choose>
				    			<c:when test="${empty memoUpdateDate}">
				    				<span class="memoUpdateDate">${memoRegDate}</span>
				    			</c:when>
				    			<c:otherwise>
				    				<span class="memoUpdateDate">${memoUpdateDate}</span>
				    			</c:otherwise>
				    		</c:choose>	    			
			    			<button>x</button>
			    		</div>	    		
		  				<div class="memoContent" contenteditable="true"
		  					data-pmNo="${pmNo}" data-memoNo="${memo.memoNo}" data-memoType="${memo.memoType}">					
		  					${memo.memoContent}
		  				</div>
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
    	
    	let memberName = "${memberName}";
    	let profileImage = "${profileImage}";
		
    	// 로그인이 되어 있을 경우에만
		// /memo 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		let memoSock = new SockJS(contextPath+"/memo");
			// -> websocket 프로토콜을 이용해서 해당 주소로 데이터를 송/수신 할 수 있다.

		let alertSock = new SockJS(contextPath+"/alert");
    </script>
    
    <!-- memo.js 연결 -->
    <script src="${contextPath}/resources/js/workspace/memo.js"></script>
</body>
</html>