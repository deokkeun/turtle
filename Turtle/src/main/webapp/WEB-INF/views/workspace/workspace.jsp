<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="memberName" value="${loginMember.memberName}" />
<c:set var="profileImage" value="${loginMember.profileImage}"/>
<c:set var="memberNo" value="${loginMember.memberNo}"/>

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
                            <div class="boardListBoardTitle">
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
                            <div class="boardListEventDate">
                                <div class="boardListEventStartDate"></div>
                                <div></div>
                                <div class="boardListEventEndDate"></div>
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
                            <a onclick="toggleSide()" class="select-board-detail">
                                <div class="boardListBoardTitle" contenteditable="false">
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
                                <div class="boardListEventDate">
                                    <div class="boardListEventStartDate">${board.eventStartDate}</div>
                                    <div> - </div>
                                    <div class="boardListEventEndDate">${board.eventEndDate}</div>
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
                                <div class="boardListEventDate">
                                    <div class="boardListEventStartDate">${board.eventStartDate}</div>
                                    <div> - </div>
                                    <div class="boardListEventEndDate">${board.eventEndDate}</div>
                                </div>
                                </c:otherwise>
                            </c:choose>    							
                        </div>                                        
                    </div>                                
                </c:forEach>	
            </div>


            <!-- 메모 영역 -->            
            <div id="memo-area">
                <c:forEach var="memo" items="${memoList}"> 
                    <fmt:formatDate var="memoRegDate" value="${memo.memoRegDate}" pattern="MM-dd HH:mm"/>
                    <fmt:formatDate var="memoUpdateDate" value="${memo.memoUpdateDate}" pattern="MM-dd HH:mm"/>
                    <c:choose>
                        <c:when test="${memo.memoType eq 'workspace'}">
        
                            
                            <div class="team">
                            
                                <div class="division1">Team Memo</div>
        
                                <div class="division2">
                                    
                                    <div class="memoDetail workspace" data-memoBgColor="${memo.memoBgColor}" style="background-color: ${memo.memoBgColor}">
                                        
                                        <div class="memoContent" contenteditable="true"
                                            data-pmNo="${pmNo}" data-memoNo="${memo.memoNo}" data-memoType="${memo.memoType}"  style="background-color: ${memo.memoBgColor}">					
                                            ${memo.memoContent} 
                                        </div>
                                        
                                        <p><span class="counter"> 0 </span> / 150</p>
                                        
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
                                            
                                            <div class="profile-image2">
                                                <img class="memoProfileImg" src="${contextPath}${memo.profileImg}">
                                            </div>	
                                        </div>	    			
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        
                        <c:otherwise>
                            
                            <div class="solo">
                                <div class="division1">Personal Memo</div>
        
                                <div class="division2">
                                    
                                    <div class="memoDetail personal" data-memoBgColor="${memo.memoBgColor}" style="background-color: ${memo.memoBgColor}">
                                            
                                        <div class="memoContent" contenteditable="true"
                                            data-pmNo="${pmNo}" data-memoNo="${memo.memoNo}" data-memoType="${memo.memoType}" style="background-color: ${memo.memoBgColor}">					
                                            ${memo.memoContent}
                                        </div>
                                        
                                        <p><span class="counter"> 0 </span> / 150</p>
                                        
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
                                            
                                            <div class="profile-image2">
                                                <img class="memoProfileImg" src="${contextPath}${memo.profileImg}">
                                            </div>
                                        </div>	  
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                            
                </c:forEach>
            </div>
            
    </main>
    
    


     <!-- footer include -->
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />
     
     <!-- main.js 연결 -->
     <script src="${contextPath}/resources/js/main.js"></script>
      <!-- Vendor JS Files -->
 
     <!-- <script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js"></script> -->
     <!-- chat js -->
    <!-- <script src="${contextPath}/resources/js/chat.js"></script> -->
    
    <script>
        var pmNo = "${pmNo}";
        var projectNo = "${projectNo}";
        var workspaceNo = "${workspaceNo}";
        var contextPath = "${contextPath}";
        var boardNo = "${boardNo}";
        var memberNo = "${memberNo}";
        var memberName = "${memberName}";
        var profileImage = "${profileImage}";
        // 로그인이 되어 있을 경우에만
		// /memo 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		//let memoSock = new SockJS(contextPath+"/memo");
        // 로그인이 되어 있을 경우에만    
		// /boardList 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성		
		
    </script>
    <!-- boardList.js 연결 -->
    <script src="${contextPath}/resources/js/board/boardList.js"></script>
    <!-- memo.js 연결 -->
    <script src="${contextPath}/resources/js/workspace/memo.js"></script>
    
</body>
</html>