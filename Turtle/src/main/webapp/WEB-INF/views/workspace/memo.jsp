<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
</head>
<body>
    메모장 리스트 확인
    <div style="display: flex;">
    <c:forEach var="memo" items="${memoList}">
    	<fmt:formatDate var="memoDate" value="${memo.memoUpdateDate}" pattern="MM-dd HH:mm"/>
    	<div>
    		<span>최근 수정자 : ${memo.updatePmNo}</span><br>
    		<span>최근 수정일 : ${memoDate}</span><br>
    		<textarea cols="25" rows="12.5" style="resize: none">${memo.memoContent}</textarea>
    	</div>
    </c:forEach>
    </div>
</body>
</html>