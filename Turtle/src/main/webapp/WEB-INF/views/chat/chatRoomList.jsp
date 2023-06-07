<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅방 목록</title>
</head>
<body>
    채팅방리스트 이동 확인
    <ul>
    <c:forEach var="chatRoom" items="${chatRoomList}">
    	<li>
    		<form action="../chatRoom/${chatRoom.chatRoomNo}"><button>${chatRoom.chatRoomTitle}</button></form>
    	</li>  	    	   	
    </c:forEach>
    </ul>
    
</body>
</html>