<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--
<c:set var="memberName" value="${loginMember.memberName}" />
<c:set var="profileImage" value="${loginMember.profileImage}"/>
<c:set var="memberNo" value="${loginMember.memberNo}"/>
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- css 모음 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/workspace/workspace.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/workspace/memo.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/board/boardList.css">
    
    <!-- bootstrap.css -->
    <link href="${contextPath}/resources/css/booystrapcss/bootstrap.css" rel="stylesheet">
    <link href="${contextPath}/resources/images/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${contextPath}/resources/images/remixicon/remixicon.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/boxicons/css/boxicons.min.css" rel="stylesheet">
    <!-- Favicons -->
    <link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
    <link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
     <!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>

    <title>Turtle</title>
</head>
<body>
    

    <!-- header include -->
        
    <main id="main" class="main">
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <div class="workspace-layout">
            <!-- 게시판 영역 -->
            <div class="board-area">   	
                <fmt:formatDate var="boardRegDate" value="${board.boardRegDate}" pattern="MM-dd HH:mm"/>
                <fmt:formatDate var="boardUpdateDate" value="${board.boardUpdateDate}" pattern="MM-dd HH:mm"/>	
                                    
                <div class="board firstBoard" data-boardSort="0" data-pmNo="${pmNo}">
                    <div class="edit-board-area">
                        <div class="first-add-board" style="visibility:visible;">
                            <button class="add-board-btn"><i class="fa-solid fa-plus"></i></button>
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
                                <button class="add-board-btn"><i class="fa-solid fa-plus"></i></button>
                            </div>
                            <div class="emoji-btn">
                                <c:choose>
                                    <c:when test="${!empty board.boardEmoji}">
                                        <i class="emo emoji-area">${board.boardEmoji}</i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="emoji-area fa-regular fa-file"></i>
                                    </c:otherwise>
                                </c:choose>	
                            </div>
                            <script src="https://cdn.jsdelivr.net/npm/@joeattardi/emoji-button@3.0.3/dist/index.min.js"></script>
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
                                <div class="delete-board" style="visibility:hidden;">
                                    <button class="delete-board-btn"><i class="fa-solid fa-xmark"></i></button>
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
                                <div class="delete-board" style="visibility:hidden;">
                                    <button class="delete-board-btn"><i class="fa-solid fa-xmark"></i></button>
                                </div>    	
                                <div class="eventDate">
                                    <div class="eventStartDate">${board.eventStartDate}</div>
                                    <div> - </div>
                                    <div class="eventEndDate">${board.eventEndDate}</div>
                                </div>
                                </c:otherwise>
                            </c:choose>    							
                        </div>                                        
                    </div>                                
                </c:forEach>	
            </div>


            <!-- 메모 영역 -->
            <div>
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
            </div>
        </div>
    </main>
    
    


     <!-- footer include -->
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />
     <!-- jQuery 라이브러리 추가 -->
     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
     <!-- main.js 연결 -->
     <script src="${contextPath}/resources/js/main.js"></script>
      <!-- Vendor JS Files -->
 
     <!-- <script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js"></script> -->
     <!-- chat js -->
     <script src="${contextPath}/resources/js/chat.js"></script>

     <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>    
   
    	
    	
        // 로그인이 되어 있을 경우에만
		// /memo 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		let memoSock = new SockJS(contextPath+"/memo");
		// /boardList 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성		
		// 게시글 수정용 sock
		let boardListSock = new SockJS(contextPath+"/boardList");
		// /insertBoard 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		// 게시글 추가용 sock
		let insertBoardSock = new SockJS(contextPath+"/insertBoard");
		// /deleteBoard 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		// 게시글 삭제용 sock
		let deleteBoardSock = new SockJS(contextPath+"/deleteBoard");
        // 이모지 수정용 sock
        let updateEmojiSock = new SockJS(contextPath+"/updateEmoji");
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
		// 알람용 sock
        //let alertSock = new SockJS(contextPath+"/alert");
    </script>

    <!-- memo.js 연결 -->
    <script src="${contextPath}/resources/js/workspace/memo.js"></script>
    <!-- boardList.js 연결 -->
    <script src="${contextPath}/resources/js/board/boardList.js"></script>    
</body>
</html>