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
    <title>메모기능</title>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/workspace/memo.css">
</head>
<body> 
    <div id="memo-area">
	    <c:forEach var="memo" items="${memoList}"> 
	    	<fmt:formatDate var="memoRegDate" value="${memo.memoRegDate}" pattern="MM-dd HH:mm"/>
	    	<fmt:formatDate var="memoUpdateDate" value="${memo.memoUpdateDate}" pattern="MM-dd HH:mm"/>
	    	<c:choose>
	    		<c:when test="${memo.memoType eq 'workspace'}">

					<!-- 팀 메모 영역-->
					<div class="team">
					
						<div class="division1">Team Memo</div>

						<div class="division2">
							<!-- 팀 메모지 -->
							<div class="memoDetail workspace" data-memoBgColor="${memo.memoBgColor}" style="background-color: ${memo.memoBgColor}">
								<!-- 팀메모 작성 부분 -->
								<div class="memoContent" contenteditable="true"
									data-pmNo="${pmNo}" data-memoNo="${memo.memoNo}" data-memoType="${memo.memoType}"  style="background-color: ${memo.memoBgColor}">					
									${memo.memoContent} 
								</div>
								<!-- 메모 글자수 카운트 -->
								<p><span class="counter"> 0 </span> / 150</p>
								<!-- 메모 수정자 정보 -->
								<div class="memoInfo"  style="background-color: ${memo.memoBgColor}">
									<div class="modifyInfo">
										<div class="memberName">수정자 : ${memo.memberName}</div>
										<c:choose>
											<c:when test="${empty memoUpdateDate}">
												<div class="memoUpdateDate">수정일 : ${memoRegDate}</div>
											</c:when>
											<c:otherwise>
												<div class="memoUpdateDate">수정일 : ${memoUpdateDate}</div>
											</c:otherwise>
										</c:choose>
									</div>
									<!-- 수정자 프로필사진 -->
									<div class="profile-image">
										<img src="${contextPath}${memo.profileImg}">
									</div>	
								</div>	    			
							</div><!-- memodetail 끝-->
						</div><!-- division2 끝-->
					</div><!-- 팀 메모끝-->
	    		</c:when>
	    		
	    		<c:otherwise>
					<!-- 개인 메모 영역-->
					<div class="solo">
						<div class="division1">Personal Memo</div>

						<div class="division2">
							<!-- 개인 메모지-->
							<div class="memoDetail personal" data-memoBgColor="${memo.memoBgColor}" style="background-color: ${memo.memoBgColor}">
								<!-- 개인메모 작성 부분 -->	
								<div class="memoContent" contenteditable="true"
									data-pmNo="${pmNo}" data-memoNo="${memo.memoNo}" data-memoType="${memo.memoType}" style="background-color: ${memo.memoBgColor}">					
									${memo.memoContent}
								</div>
								<!-- 메모 글자수 카운트 -->
								<p><span class="counter"> 0 </span> / 150</p>
								<!-- 메모 수정자 정보-->
								<div class="memoInfo" style="background-color: ${memo.memoBgColor}">
									<div class="modifyInfo">
										<div class="memberName">수정자 : ${memo.memberName}</div> 
										<c:choose>
											<c:when test="${empty memoUpdateDate}">
												<div class="memoUpdateDate">수정일 : ${memoRegDate}</div>
											</c:when>
											<c:otherwise>
												<div class="memoUpdateDate">수정일 : ${memoUpdateDate}</div>
											</c:otherwise>
										</c:choose>
									</div>
									<!-- 수정자 프로필사진 -->
									<div class="profile-image">
										<img src="${contextPath}${memo.profileImg}">
									</div>
								</div>	  
							</div><!-- memodetail 끝-->
						</div><!-- division2 끝-->
					</div><!--개인메모 끝-->
	    		</c:otherwise>
	    	</c:choose>
	    	    	
	   </c:forEach>
    </div>
    
    
    
    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	
	<script>
    	//const pmNo = "${pmNo}";
    	//const workspaceNo = "${workspaceNo}";
		//const memberNo = "${memberNo}";
    	//const contextPath = "${contextPath}";
    	//const projectNo = "${projectNo}";
    	//let memberName = "${memberName}";
    	//let profileImage = "${profileImage}";
    	// 로그인이 되어 있을 경우에만
		
			// -> websocket 프로토콜을 이용해서 해당 주소로 데이터를 송/수신 할 수 있다.

		//let alertSock = new SockJS(contextPath+"/alert");
    </script>
    
    <!-- memo.js 연결 -->
    <script src="${contextPath}/resources/js/workspace/memo.js"></script>
  </body>
</html>