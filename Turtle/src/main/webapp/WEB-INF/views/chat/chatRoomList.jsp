<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">  
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>Turtle</title>
</head>
<body>
    채팅방리스트 이동 확인
    <div>3</div>
    <div class="e">${projectNo}</div>
    <form id="list">
        <ul>
            <input type="hidden" id="projectNo" value="${projectNo}">
            <input type="hidden" id="roomList" value="${chatRoomList}">
            <input type="hidden" id="roomNo" value="${chatRoom.chatRoomNo}">
        <c:forEach var="chatRoom" items="${chatRoomList}">
            <li>
                <form action="../chatRoom/${projectNo}/${chatRoom.chatRoomNo}" id="room" value="${chatRoom.chatRoomNo}">
                    <button class="chatBtn" value="${chatRoom.chatRoomNo}">${chatRoom.chatRoomTitle}</button>
                </form>
            
            </li>  	    	   	
        </c:forEach>
        </ul>
        <div class="r"></div>
    </form>
    <!-- <script src="${contextPath}/resources/js/chat.js"></script> -->
    <script src="${contextPath}/resources/js/chatRoomList.js"></script>
     <!-- <script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js"></script> -->
    <script>
        
    //   const contextPath = "${contextPath}";
        //   console.log(contextPath);
    </script>
</body>
</html>