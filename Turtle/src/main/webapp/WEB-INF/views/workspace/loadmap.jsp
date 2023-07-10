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

        <input type="hidden" value="projectNo" name="${projectNo}">
        <input type="hidden"  id="workspaceNo" value="${workspaceNo}">
        <input type="hidden" value="${gitCommitList}">
        <input type="hidden" id="loadmap" value="${loadmap}">

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
                    <div id="btn-box">
                        <!-- <input type="button" id="add" value="Add data"></input>
                        <input type="button" id="remove" value="Remove data"></input> -->
                        <div id="allview" class="btn btn-primary">전체 보기</div>
                        <div id="onedeps" class="btn btn-primary">되돌리기</div>
                        <!-- <div id="modifybtn" class="btn btn-info">수정하기</div> -->

                        <div> 
                            로드맵 조회 필수 입력(사용자이름/저장소이름, 브랜치명)
                        </div>
                    </div>

                    <div id="tree"></div>
                </div>

                <!-- commitList 내역 -->
                <div id="commitList-box">
                    <c:forEach var="gc" items="${gitCommitList}">
                        <div class="git-commit">
                            <div class="git-user"><b>[${ gc.login }]</b> ${gc.message}</div>
                            <div class="git-files">${gc.files}</div>
                        </div>
                    </c:forEach>
                </div>
            </section>


            
		</section>
   

    </main>


    <script>
        let dataJson = [];
        let dataArr = [];
        let data = [];
        let root = "";
        let rootObject = [];

        if(loadmap != null) {
        dataJson = JSON.parse('${loadmap.gitTree}');
        root = "${loadmap.gitRepo}"
        rootObject.push({id: root, text_1: root, father: null});
        dataArr = [rootObject[0]];
        data = [rootObject[0]];
        }

        console.log("data Json 실행 후");
        console.dir(dataJson);




        // 첫 애 넣어주기
        $('.git-files').each(function() {
        
        let files = JSON.parse($(this).text());
        console.dir(files);
        
        files.forEach(function(e) {
            
            dataArr.some(function(data) {
            if( data.text_1 == e) {
                console.dir("일치" + data.text_1)  
                return true;
            }
            return false;
            
            })
        })
        
        })
    




        dataJson.forEach(function(e) {

            let d;
            if(!e.prev) {
            d =  { id: e.sha , text_1:e.path , father: root , color:"#2196F3" };
            rootObject.push(d);
                data.push(d);
            }else {
                let color;
                if(e.type=="tree") {
                color = "#B076CF";
                }else if(e.type=="blob"){
                color ="#E971AD";
                }
                $('.git-files').each(function() {
                    let files = JSON.parse($(this).text());
                    files.forEach(function(f) {
                    if(e.path == f) {
                    color="#FFCD42";	
                    }
                    })
                })
            d =  { id: e.sha , text_1:e.path , father: e.prev , color:color };
            }
            dataArr.push(d);
        })

            console.dir(dataArr);



    </script>

    <script>
        // const contextPath = "${contextPath}";
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