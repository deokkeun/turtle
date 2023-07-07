<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">  
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/chat-style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>Turtle</title>
</head>
<body id="page1" class="ani">
    <ul>
        
    <c:forEach var="chatRoom" items="${chatRoomList}">
        <li class="chatList">
            <form action="../chatRoom/${projectNo}/${chatRoom.chatRoomNo}" id="room" value="${chatRoom.chatRoomNo}" onsubmit="change()">
                <button class="chatBtn" value="${chatRoom.chatRoomNo}">${chatRoom.chatRoomTitle}</button>
            </form>
        </li>  	    	   	
    </c:forEach>
    </ul>
    
  
    <script src="${contextPath}/resources/js/chat.js"></script>
    <!-- <script src="${contextPath}/resources/js/chatRoomList.js"></script> -->
     <!-- <script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js"></script> -->
    <script>
        
    //   const contextPath = "${contextPath}";
        //   console.log(contextPath);
    </script>
</body>
</html>