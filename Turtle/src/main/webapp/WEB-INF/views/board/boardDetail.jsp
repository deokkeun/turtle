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
</head>
<body>

    <div class="boardDetail">
        <div contenteditable="true">${board.boardTitle}</div>
        <span> 최초 작성자 : <img src="${contextPath}${board.regProfileImg}"> ${board.regMemberName}</span>
        <span> 최근 수정자 : <img src="${contextPath}${board.updateProfileImg}">${board.updateMemberName}</span>
        <span>이벤트 시작 : </span><input type="date" value="${board.eventStartDate}">
        <span>이벤트 종료 : </span><input type="date" value="${board.eventEndDate}">
    </div>

    <div class="boardDetail-area">
        <c:forEach var="boardDetail" items="${boardDetailList}">        
            <div class="boardContent" data-boardDetailNo="${boardDetail.boardDetailNo}" contenteditable="true">
                ${boardDetail.boardContent}
            </div>
        
        </c:forEach>
    </div>
</body>
</html>