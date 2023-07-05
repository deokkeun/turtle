<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- main-style.css -->
    <link href="${contextPath}/resources/css/main-style.css" rel="stylesheet">
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
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
    <main id="main" class="main">

        
        <div class="main-layout">
            <!-- 위 -->
            <div class="projectTitle">
                <textarea placeholder=" 어렵지 않으면 왼쪽에 이모지 가져오고, 여기에 프로젝트 제목 불러오기"></textarea>
            </div>
            <!-- 중간 -->
            <div class="middle-layout">
                <div class="watch-N-dDay">
                    <div class="watch">
                        <div id="clock" value="0">00 : 00 : 00</div>
                    </div>
                    <div class="d-day">
                        <!-- 캘린더 남은 일정 -->
                        <section id="schedule-box">
                            <div id="schedule-title">남은 일정</div>
                            <div id="schedule"></div>
                        </section>
                    </div>
                </div>
                <div class="boardLi">
                    <jsp:include page="/WEB-INF/views/board/boardList.jsp" />
                </div>
            </div>
            <!-- 아래-->
            <div class="memoLi">
                <!--  메모장 -->
                <jsp:include page="/WEB-INF/views/workspace/memo.jsp" />
            </div>
        </div>
        

        <!-- 세션 잘담기는지 테스트 -->
        <span>loginMember : ${loginMember}</span><br>
        <span>projectNo : ${projectNo}</span><br>
        <span>projectMember : ${projectMember}</span><br>
        <span>workspaceNo : ${workspaceNo}</span>
        <span>workspace : </span>
        <c:forEach var="workspace" items="${workspaceList}">
            <span>${workspace}</span><br>
        </c:forEach>
        <span>project : </span>
        <c:forEach var="project" items="${projectList}">
            <span>${project}</span><br>
        </c:forEach>


       
        
        
        <form action="${contextPath}/member/myPage/info" method="GET">
                <button>마이페이지 이동</button>
        </form>
        

        <form action="${contextPath}/workspace/loadmap/${projectNo}/10" method="GET">
            <button>git loadMap test(GET)</button>
        </form>
      
        <form action="${contextPath}/calendar/calendar/${projectNo}/5" method="GET">
           <button>calendar</button>
        </form>
              
        <form action="../chat/chatRoomList/${projectNo}" method="get">
        	<button>채팅 테스트</button>
        </form>
        
        <form action="../workspace/memo/${projectNo}/5" method="get">
        	<button>메모장 테스트</button>
        </form>

        <form action="../project/createProject" method="get">
        	<button>성훈 테스트</button>
        </form>
        
        <form action="../board/boardList/${projectNo}/5" method="get">
        	<button>게시판 테스트</button>
        </form>
        <a href="javascript:join()">채팅방</a>
     	
       

    </main>
    
   
    <script>
    //   const contextPath = "${contextPath}";
    </script>
    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- chat js -->
    <script src="${contextPath}/resources/js/chat.js"></script>
    <!-- fullcalendar -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

</body>
</html>