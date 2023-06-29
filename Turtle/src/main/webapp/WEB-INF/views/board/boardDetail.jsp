<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>

    <!--섬머노트 전용 css-->
    <link rel="stylesheet" href="${contextPath}/resources/css/summernote/summernote-lite.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/board/boardDetail.css">
</head>
<body>
    <div class="board-area">
        <div class="board-info-area">
            <div class="boardTitle" contenteditable="true">${board.boardTitle}</div>
            <div class="regInfo">
                <div class="regMember"> 
                    <div>최초 작성자 : </div>
                    <div class="regMemberImg"><img src="${contextPath}${board.regProfileImg}"> ${board.regMemberName}</div>
                </div>
                <div class="regDate">
                    <div>최초 작성일 : </div>
                    <div>${board.boardRegDate}</div>
                </div>
            </div>
            <div class="updateInfo">
                <div class="updateMember">
                    <div>최근 수정자 : </div>
                    <c:if test="${!empty board.updateProfileImg}">
                        <div class="updateMemberImg"><img src="${contextPath}${board.updateProfileImg}">${board.updateMemberName}</div>
                    </c:if>
                </div>
                <div class="updateDate">
                    <div>최근 수정일 : </div>
                    <c:if test="${!empty board.boardUpdateDate}">
                        <div>${board.boardUpdateDate}</div>
                    </c:if>
                </div>
            </div>
            <div class="eventDate">                
                <div>이벤트 : </div>
                <div><input type="date" value="${board.eventStartDate}"></div>
                <div> - </div>
                <div><input type="date" value="${board.eventEndDate}"></div>                
            </div>
            
            
        </div>
        <hr>
        <div class="boardDetail-area">
            <c:forEach var="boardDetail" items="${boardDetailList}">
                <div class="edit-boardDetail-area">
                    <div class="add-boardDetail" style="visibility:hidden;">
                        <button class="add-boardDetail-btn">+</button>
                    </div>
                    <div class="boardDetail" data-boardDetailNo="${boardDetail.boardDetailNo}" data-boardDetailSort="${boardDetail.boardDetailSort}" contenteditable="true">
                        ${boardDetail.boardContent}
                    </div>
                </div>
                
            
            </c:forEach>
        </div>
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
		// /insertBoardDetail 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		// 게시글 내용 추가용 sock
		//let insertBoardDetailSock = new SockJS(contextPath+"/insertBoardDetail");
        // /updateBoardDetail 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		// 게시글 내용 수정용 sock
		//let updateBoardDetailSock = new SockJS(contextPath+"/updateBoardDetail");
        // /deleteBoardDetail 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
        // 게시글 내용 삭제용 sock
        //let deleteBoardDetailSock = new SockJS(contextPath+"/deleteBoardDetail");
		// -> websocket 프로토콜을 이용해서 해당 주소로 데이터를 송/수신 할 수 있다.
		
    </script>
    <!--섬머노트 전용 js (css태그는 head에 있음)-->
    <script src="${contextPath}/resources/js/summernote/summernote-lite.js"></script>
    <script src="${contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
    <!-- boardDetail.js 연결 -->
    <script src="${contextPath}/resources/js/board/boardDetail.js"></script>
</body>
</html>