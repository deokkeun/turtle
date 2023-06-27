<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
	<!-- main-style.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
	<!-- loadmap.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/workspace/loadmap.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>
    <main id="main" class="main">
        <!-- header include -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <section id="loadmap-container">

            <section class="repos-container">
                <div class="get-repos">
                    <input type="text" placeholder="Github Username">
                    <span class="get-button">Get Repos</span>
                </div>
                <div class="show-data">
                    <span>No Data To Show</span>
                </div>
            </section>

            <section>
                // Define a tree element where dimensions are mandatory
                <div id="tree" style="height:700px; width:900px">
                    ㅇㅇㅇ
                </div>
            </section>
            
        </section>

    </main>

    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- loadmap.js 연결 -->
    <script src="${contextPath}/resources/js/workspace/loadmap.js"></script>
    <!-- treeviz -->
    <script src="https://rawgit.com/PierreCapo/treeviz/master/dist/index.js"></script>
</body>
</html>