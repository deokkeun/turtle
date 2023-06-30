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

        <input type="text" value="projectNo = ${projectNo}">
        <input type="hidden" value="projectNo" name="${projectNo}">

        <input type="text" value="workspaceNo = ${workspaceNo}">
        <input type="hidden"  id="workspaceNo" value="${workspaceNo}">

        <input type="text" value="${gitCommitList}">
        <input type="text" value="${loadmap}">


        
        <div>
            -----------------------------------------------------
            ${gitCommitList}
            -----------------------------------------------------
        </div>
        <div>
            -----------------------------------------------------
            ${loadmap}
            -----------------------------------------------------
        </div>
        <div>
            <c:forEach var="gc" items="${gitCommitList}">
                <div class="git-commit">
                    <div class="git-user"><b>[${ gc.login }]</b> ${gc.message}</div>
                    <div class="git-files">${gc.files}</div>
                </div>

            </c:forEach>
        </div>
        


		<section id="loadmap-container">
            <section class="repos-container">
                <div class="get-repos">
                    <input type="text" id="gitRepo" placeholder="Github Username">
                    <input type="text" id="branch" placeholder="branch">
                    <input type="text" id="ignore" placeholder="ignore">
                    <span class="get-button">Get</span>
                </div>
                <div class="show-data">
                    <span>No Data To Show</span>
                </div>
            </section>

            <section id="tree-box">

                <div>
                    <div>
                        <input type="button" id="add" value="Add data"></input>
                        <input type="button" id="remove" value="Remove data"></input>
                        <div id="onedeps" class="btn btn-primary">되돌리기</div>
                        <div id="allview" class="btn btn-primary">전체 보기</div>
                        <div id="modifybtn" class="btn btn-info">수정하기</div>
                        <div id="gitbtn" class="btn btn-primary">연동하기</div>
                    </div>

                    

                    
                    <div id="tree">

                        <!-- <div id="loadmap-content">
                            로드맵은 <br>
                            GitHub Username/GitHub Repository <br>
                            branch 를 모두 입력하시면 조회를 하실 수 있습니다.
                        </div> -->
                    </div>
                </div>
            </section>


            
		</section>
   

    </main>


    <script>
        const contextPath = "${contextPath}";
    </script>
    <!-- treeviz -->
    <script src="https://cdn.jsdelivr.net/npm/treeviz@2.3.0/dist/index.min.js"></script>

    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- loadmap.js 연결 -->
    <script src="${contextPath}/resources/js/workspace/loadmap.js"></script>
</body>
</html>