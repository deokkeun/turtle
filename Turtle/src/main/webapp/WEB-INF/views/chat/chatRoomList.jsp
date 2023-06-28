<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">  
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
</head>
<body>
    채팅방리스트 이동 확인
    <div>${projectNo}</div>
    <ul>
        <input type="hidden" id="projectNo" value="${projectNo}">
    <c:forEach var="chatRoom" items="${chatRoomList}">
    	<li>
            <form action="../chatRoom/${projectNo}/${chatRoom.chatRoomNo}">
    			<button class="chatBtn" value="${chatRoom.chatRoomNo}">${chatRoom.chatRoomTitle}</button>
            </form>
         
    	</li>  	    	   	
    </c:forEach>
    </ul>
    <!--  <script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js"></script> -->
    <script>
      
          
    </script>
</body>
</html>