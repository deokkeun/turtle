<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
        
    <!-- Favicons -->
    <link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
    <link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
    

	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>

    	<!-- header include -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />



 
    <main id="main" class="main">
 	

		<!-- (index.jsp)/member/login -> (main.jsp)common/main.jsp -->
        <H1>로그인 성공!!</H1>
        <H1>민수 커밋 확인용</H1>
        <H1>덕근 커밋 확인용</H1>
        <H1>수진 커밋 확인용 '_'</H1>

        <div>로그인시(멤버정보)</div>
        <div>회원번호 : ${loginMember.memberNo}</div>
        <div>회원명 : ${loginMember.memberName}</div>
        <div>프로필 이미지 : ${loginMember.profileImage}</div>
        <div>회원 이메일 : ${loginMember.memberEmail}</div>
        <div>회원 가입일 : ${loginMember.enrollDate}</div>
        <div>
            access_token
            <input type="text" name="access_token" value="" style="width: 600px;">
        </div>
        
        
       
        <form action="${contextPath}/member/myPage/info" method="GET">
                <button>마이페이지 이동</button>
        </form>
        

        <form action="../workspace/loadmap" method="GET">
            <button>git loadMap test(GET)</button>
        </form>
      
        <form action="${contextPath}/calendar/calendar/1/9" method="GET">
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
        


    </main>
    <script>
      const contextPath = "${contextPath}";

    </script>
    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
     <!-- Vendor JS Files -->

    <!-- chat js -->
    <script src="${contextPath}/resources/js/chat.js"></script>
</body>
</html>