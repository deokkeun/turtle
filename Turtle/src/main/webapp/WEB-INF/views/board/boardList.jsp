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
    
    <link rel="stylesheet" href="${contextPath}/resources/css/board/boardList.css">
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>

    
    <div class="board-area">   	
		<fmt:formatDate var="boardRegDate" value="${board.boardRegDate}" pattern="MM-dd HH:mm"/>
		<fmt:formatDate var="boardUpdateDate" value="${board.boardUpdateDate}" pattern="MM-dd HH:mm"/>	
		
				
		<div class="board firstBoard" data-boardSort="0" data-pmNo="${pmNo}">
			<div class="edit-board-area">
				<div class="first-add-board" style="visibility:visible;">
					<button class="add-board-btn">+</button>
				</div>
				<div class="select-board-detail">
					<div class="boardTitle">
					</div>
				</div>
				<div class="edit-boardTitle" style="visibility:hidden;">
				</div>
			</div>
				<div class="board-info">
					<div>
						<span class="profile-image"></span>
						<span class="user-name"></span>
					</div>
					<div class="eventDate">
						<div class="eventStartDate"></div>
						<div></div>
						<div class="eventEndDate"></div>
					</div>						
				</div>
			<div class="delete-board" style="visibility:hidden;">
			</div>
		</div>
		
	
		<c:forEach var="board" items="${boardList}" varStatus="status">									
			
			<div class="board" data-boardNo="${board.boardNo}" data-pmNo="${pmNo}" data-boardSort="${board.boardSort}">
				<div class="edit-board-area">
					<div class="add-board" style="visibility:hidden;">
						<button class="add-board-btn">+</button>
					</div>
					<div class="emoji-btn">
						<i class="fa-regular fa-file"></i>
					</div>
					<a href="../../boardDetail/${projectNo}/${workspaceNo}/${board.boardNo}" class="select-board-detail">
						<div class="boardTitle" contenteditable="false">
							${board.boardTitle}
						</div>
					</a>
					<div class="edit-boardTitle" style="visibility:hidden;">
						<button class="edit-boardTitle-btn"><i class="fa-regular fa-pen-to-square"></i></i></button>
						<button class="close-edit-boardTitle-btn" style="display:none;"><i class="fa-regular fa-pen-to-square"></i></button>
					</div>
				</div>
				<div class="board-info">
					<c:choose>
						<c:when test="${empty board.updateMemberName}">
						<div class="user-profile">
							<span class="profile-image"><img src="${contextPath}${board.regProfileImg}"></span>
							<span class="user-name">${board.regMemberName}</span>
						</div>
						<div class="eventDate">
							<div class="eventStartDate">${board.eventStartDate}</div>
							<div> - </div>
							<div class="eventEndDate">${board.eventEndDate}</div>
						</div>
						</c:when>
						<c:otherwise>
						<div class="user-profile">
							<span class="profile-image"><img src="${contextPath}${board.updateProfileImg}"></span>
							<span class="user-name">${board.updateMemberName}</span>
						</div>
						<div class="eventDate">
							<div class="eventStartDate">${board.eventStartDate}</div>
							<div> - </div>
							<div class="eventEndDate">${board.eventEndDate}</div>
						</div>
						</c:otherwise>
					</c:choose>    							
				</div>
				<div class="delete-board" style="visibility:hidden;">
					<button class="delete-board-btn">-</button>
				</div>    						
			</div>
							
		</c:forEach>
				
				
				
	    		
	
    </div>
     
 	<!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	 
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>    
   
    	const pmNo = "${pmNo}";
    	const projectNo = "${projectNo}";
    	const workspaceNo = "${workspaceNo}";
    	const contextPath = "${contextPath}";
    	
    	let memberName = "${memberName}";
    	let profileImage = "${profileImage}";
    	
    	// 로그인이 되어 있을 경우에만
		// /boardList 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성		
		// 게시글 수정용 sock
		let boardListSock = new SockJS(contextPath+"/boardList");
		// /insertBoard 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		// 게시글 추가용 sock
		let insertBoardSock = new SockJS(contextPath+"/insertBoard");
		// /deleteBoard 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		// 게시글 삭제용 sock
		let deleteBoardSock = new SockJS(contextPath+"/deleteBoard");
		// /updateBoardDetail 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		// 게시글 내용 수정용 sock
		let updateBoardDetailSock = new SockJS(contextPath+"/updateBoardDetail");
		// -> websocket 프로토콜을 이용해서 해당 주소로 데이터를 송/수신 할 수 있다.
		// 게시글 내용 추가용 sock
		let insertBoardDetailSock = new SockJS(contextPath+"/insertBoardDetail");
		// 게시글 내용 삭제용 sock
		let deleteBoardDetailSock = new SockJS(contextPath+"/deleteBoardDetail");
		// 이벤트 시간 생성용 sock
        let updateEventDateSock = new SockJS(contextPath+"/updateEventDate");
    </script>

    <!-- memo.js 연결 -->
    <script src="${contextPath}/resources/js/board/boardList.js"></script>    
    
</body>
</html>