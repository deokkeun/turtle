<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <form action="/inviteMember/${pmEmail}/${project.inviteCode}/accept" method="POST">
        <h2>수락하시겠습니까?</h2>
        <input type="submit" value="수락" id="acceptBtn" name="acceptBtn">
    </form>
</body>
</html>
