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
    
    <style>
                /* 로딩페이지 */
        /* #load {
            width: 100%;
            height: 100%;
            top: 45%;
            left: 0;
            position: fixed;
            display: block;
            opacity: 0.8;
            background: white;
            z-index: 99;
            text-align: center;       
        } */
    </style>

	
    <title>Turtle</title>
   
</head>
<body>
   
 

    <!-- header include -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
    <main id="main" class="main">    
        <!-- 로딩 -->
        <!-- <div id="load">
            <div><img id="loading-image" src="${contextPath}/resources/images/top버튼거북이2.png" width="150px"></div>
            <div><img src="${contextPath}/resources/images/load.gif" width="100px"></div>
        </div>    -->
        
        <div id="clock" value="0">00 : 00 : 00</div>



        <!--  메모장 -->
        <jsp:include page="/WEB-INF/views/workspace/memo.jsp" />
        
        
      
        <form action="${contextPath}/workspace/loadmap/${projectNo}/10" method="GET">
            <button>git loadMap test(GET)</button>
        </form>
      
        <form action="${contextPath}/calendar/calendar/${projectNo}/5" method="GET">
           <button>calendar</button>
        </form>
              
        <form action="../chat/chatRoomList/1" method="get">
        	<button>채팅 테스트</button>
        </form>
        
        <form action="../workspace/memo/1/5" method="get">
        	<button>메모장 테스트</button>
        </form>

        <form action="../project/createProject" method="get">
        	<button>성훈 테스트</button>
        </form>
        
        <form action="../board/boardList/1/5" method="get">
        	<button>게시판 테스트</button>
        </form>
        <a href="javascript:join()">채팅방</a>
     	
       

    </main>
    
     <!--loading 페이지-->
     <!-- <script type="text/javascript">
        $(window).one('load', function() {
            setTimeout(function(){
                $("#load").fadeOut();
            }, 500);
        }); -->
 
    <script>
    //   const contextPath = "${contextPath}";
    </script>
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
    <!-- fullcalendar -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

</body>
</html>