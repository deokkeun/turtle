<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap.css -->
    <link href="${contextPath}/resources/css/booystrapcss/bootstrap.css" rel="stylesheet">
    <link href="${contextPath}/resources/images/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${contextPath}/resources/images/remixicon/remixicon.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/boxicons/css/boxicons.min.css" rel="stylesheet">
    <!-- Favicons -->
    <link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
    <link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
     <!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
    <!-- 날씨 조회용 (bootstrap, jquery-ui) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
   
       <!-- header에 main-style.css때문에 맨 아래 main-style-1.css 적용 -->
     <title>Turtle</title>
   
</head>
<body>
   
    <!-- header include -->
    
    
    <main id="main" class="main" style="background-color: rgba(0, 0, 0, 0.03);">
    <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <!-- 세션 잘담기는지 테스트 -->
        <!-- <span>loginMember : ${loginMember}</span><br>
        <span>projectNo : ${projectNo}</span><br>
        <span>projectMember : ${projectMember}</span><br>
        <span>workspaceNo : ${workspaceNo}</span>
        <span>workspace : </span> -->
        <!-- <c:forEach var="workspace" items="${workspaceList}"> -->
            <!-- <span>${workspace}</span><br> -->
        <!-- </c:forEach> -->
        <!-- <span>project : </span> -->
        <!-- <c:forEach var="project" items="${projectList}"> -->
            <!-- <span>${project}</span><br> -->
            <!-- <span>${project.projectName}</span><br> -->
        <!-- </c:forEach> -->

        <div class="main-layout">
            <!-- 위 -->
            <div class="projectTitle">
                <!-- 이모지 -->
                <!-- <i class="fa-regular fa-face-smile"></i> -->
                <span id="emoji_btn2" class="projectEmoji">
                    
                    <c:forEach var="project" items="${projectList}">
                        <c:if test="${project.projectNo == projectNo}">
                            <c:if test="${empty project.projectEmoji}">
                                <div class="projectTitle-content">
                                    <img src="${contextPath}/resources/images/smilingFace.svg" alt="" width="50px">
                                    <div id="projectTitle-content-title">${project.projectName}</div>
                                </div>
                            </c:if>
                            <c:if test="${!empty project.projectEmoji}">
                                <div class="projectTitle-content">
                                    <div style="font-size: 50px;">${project.projectEmoji}</div>
                                    <div id="projectTitle-content-title">${project.projectName}</div>
                                </div>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </span>
                <!-- 이미지 변경 하고싶을때 변경하기  -->
                <!-- <script src="https://cdn.jsdelivr.net/npm/@joeattardi/emoji-button@3.0.3/dist/index.min.js"></script> -->
            </div>


            <!-- 중간 -->
            <div class="middle-layout">
                <div class="watch-N-dDay">
                    <div class="watch">
                        <div id="clock" value="0">00 : 00 : 00</div>
                    </div>
                    <div class="d-day">
                        <!-- 캘린더 남은 일정 -->
                        <section id="schedule-box">
                            <div id="schedule-title">일정 (마감 임박)</div>
                            <div id="schedule"></div>
                        </section>
                    </div>
                </div>
                <!-- 날씨 -->
                <div class="weather">
                    <div>
                        <form action="#">
                            <input type="hidden" id="datepicker" size="30" value="Date" style="padding:  5px 10px;">
                            <button style="display: none;"></button>
                        </form>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>날짜</th>
                                    <th>시간</th>
                                    <th>온도</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="4">조회 내용이 없습니다.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 아래 -->
            <div class="apiLi">
                <h2 id="api-title">API COLLECTION <span style="color: red; font-size: 16px; font-weight: bold;"> TOP 10</span></h2>
                <div class="apibanner">
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/1.webp" alt="1" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/Google_Maps-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 1위: Google Maps API -->
                        <div class="card-body">
                            <h5 class="card-title">Google Maps API</h5>
                            <p class="card-text">지도, 지리적 데이터 및 위치 관련 서비스를 제공합니다.</p>
                            <a href="https://developers.google.com/maps?hl=ko" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/2.webp" alt="2" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/YouTube-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 2위: YouTube API -->
                        <div class="card-body">
                            <h5 class="card-title">YouTube API</h5>
                            <p class="card-text">YouTube 동영상 및 채널 관련 정보와 기능을 제공합니다.</p>
                            <a href="https://developers.google.com/youtube" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/3.webp" alt="3" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/Twitter-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 3위: Twitter API -->
                        <div class="card-body">
                            <h5 class="card-title">Twitter API</h5>
                            <p class="card-text">Twitter 플랫폼의 트윗, 사용자, 트렌드 등과 관련된 정보를 제공합니다.</p>
                            <a href="https://developer.twitter.com" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/4.webp" alt="4" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/Facebook-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 4위: Facebook Graph API -->
                        <div class="card-body">
                            <h5 class="card-title">Facebook Graph API</h5>
                            <p class="card-text">Facebook 플랫폼의 사용자, 페이지, 포스트 등에 대한 정보와 상호작용 기능을 제공합니다.</p>
                            <a href="https://developers.facebook.com/docs/graph-api" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/5.webp" alt="5" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/OpenWeather-Logo-xl.jpg" style="margin: 12px 0" class="card-img-top" alt="...">
                        <!-- 5위: OpenWeatherMap API -->
                        <div class="card-body">
                            <h5 class="card-title">OpenWeatherMap API</h5>
                            <p class="card-text">실시간 날씨 데이터 및 날씨 예보 정보를 제공합니다.</p>
                            <a href="https://openweathermap.org/api" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/6.webp" alt="6" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/Spotify-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 6위: Spotify API -->
                        <div class="card-body">
                            <h5 class="card-title">Spotify API</h5>
                            <p class="card-text">Spotify 음악 스트리밍 플랫폼의 음악 데이터, 사용자 정보, 재생 목록 등을 제공합니다.</p>
                            <a href="https://developer.spotify.com" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/7.webp" alt="7" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/GitHub-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 7위: GitHub API -->
                        <div class="card-body">
                            <h5 class="card-title">GitHub API</h5>
                            <p class="card-text">GitHub 코드 호스팅 플랫폼의 저장소, 사용자, 이슈 등과 관련된 정보를 제공합니다.</p>
                            <a href="https://docs.github.com/en/rest" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/8.webp" alt="8" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/Stripe_(company)-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 8위: Stripe API -->
                        <div class="card-body">
                            <h5 class="card-title">StripeAPI</h5>
                            <p class="card-text">온라인 결제 및 금융 서비스를 위한 결제 처리 기능을 제공합니다.</p>
                            <a href="https://stripe.com/docs/api" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/9.webp" alt="9" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/Twilio-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 9위: Twilio API -->
                        <div class="card-body">
                            <h5 class="card-title">Twilio API</h5>
                            <p class="card-text">SMS, 음성 및 영상 통화, 인증 등의 통신 기능을 제공합니다.</p>
                            <a href="https://www.twilio.com/docs/quickstart" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                    <div class="card" style="width: 20rem;">
                        <img src="${contextPath}/resources/images/number/10.webp" alt="10" class="card-ranking">
                        <img src="${contextPath}/resources/images/main/Amazon_Web_Services-Logo.wine.svg" class="card-img-top" alt="...">
                        <!-- 10위: AWS S3 API -->
                        <div class="card-body">
                            <h5 class="card-title">AWS S3 API</h5>
                            <p class="card-text">Amazon S3 (Simple Storage Service)의 객체 스토리지 서비스를 제어하는 기능을 제공합니다.</p>
                            <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html" class="btn btn-primary" target="_blank">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- <form action="${contextPath}/workspace/loadmap/${projectNo}/10" method="GET">
            <button>git loadMap test(GET)</button>
        </form>
      
        <form action="${contextPath}/calendar/calendar/${projectNo}/5" method="GET">
           <button>calendar</button>
        </form>
              
        <form action="../chat/chatRoomList/${projectNo}" method="get">
        	<button>채팅 테스트</button>
        </form>
        
        <form action="../workspace/memo/${projectNo}/5" method="get">
        	<button>메모장 테스트</button>
        </form>
        <form action="../board/boardList/${projectNo}/5" method="get">
            <button>게시판 테스트</button>
        </form> -->
        

<!-- 
        <form action="../project/createProject" method="get">
            <button>성훈 테스트</button>
        </form>
        
        <a href="javascript:join()">채팅방</a>
     	
        <form action="../board/boardList/${projectNo}/5" method="get">
        	<button>게시판 테스트</button>
        </form> -->
       
       

    </main>

    
    <!-- main-style-1.css -->
    <link href="${contextPath}/resources/css/main-style-1.css" rel="stylesheet">
    <script>
    //   const contextPath = "${contextPath}";
    </script>
    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <!-- <script src="${contextPath}/resources/js/main.js"></script> -->
    <!-- main-style.js 연결 -->
    <script src="${contextPath}/resources/js/main-style.js"></script>
    <!-- chat js -->
    <script src="${contextPath}/resources/js/chat.js"></script>
    <!-- fullcalendar -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <!-- 날씨 조회용  -->
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</body>
</html>