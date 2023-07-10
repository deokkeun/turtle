<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        #error-container {
            width: 800px;
            height: 300px;
            text-align: center;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
        }
        
        #error-container > h1 { margin-bottom: 50px; }

        .error-content-title {
            text-align: left;
            font-weight: bold;
        }
        
        #btn-area {
            text-align: center;
        }

        /* 스타일 추가 */
        a {
            text-decoration: none;
            color: black;
        }
        
        button {
            padding: 8px 13px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div id="error-container">
        <img src="${contextPath}/resources/images/crying-turtle.png" style="width:200px; height:200px" >
        <h2>${requestScope.errorMessage}</h2>
        
        <span class="error-content-title"> 발생한 예외 : ${e}</span>
        <p>
            자세한 문제 원인은 이클립스 콘솔을 확인해주세요.
        </p>
        
        <div id="btn-area">
            <button onclick="redirectToMainPage()">메인 페이지</button>
            
            <button onclick="history.back()">뒤로 가기</button>
        </div>
    </div>

    <script>
        function redirectToMainPage() {
            window.location.href = '${pageContext.servletContext.contextPath}';
        }
    </script>
</body>
</html>
