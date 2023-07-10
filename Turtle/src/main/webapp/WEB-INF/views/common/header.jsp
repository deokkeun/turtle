<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="memberName" value="${loginMember.memberName}" />
<c:set var="profileImage" value="${loginMember.profileImage}"/>
<c:set var="memberNo" value="${loginMember.memberNo}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
	<!-- main-style.css -->
  <link href="${contextPath}/resources/css/main-style.css" rel="stylesheet">

  <!-- bootstrap.css -->
  <link href="${contextPath}/resources/css/booystrapcss/bootstrap.css" rel="stylesheet">
  <link href="${contextPath}/resources/images/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${contextPath}/resources/images/remixicon/remixicon.css" rel="stylesheet">
  <link href="${contextPath}/resources/css/boxicons/css/boxicons.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <!--섬머노트 전용 css-->
  <link rel="stylesheet" href="${contextPath}/resources/css/summernote/summernote-lite.css">
  <!--섬머노트 전용 js -->
  <script src="${contextPath}/resources/js/summernote/summernote-lite.js"></script>
  <script src="${contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>

  

  <link rel="stylesheet" href="${contextPath}/resources/css/board/boardDetail.css">
  
</head>
<body>

<header id="header" class="header fixed-top d-flex align-items-center">

	

    <div class="d-flex align-items-center justify-content-between">
      <i class="bi bi-list toggle-sidebar-btn"></i>
      <a href="${contextPath}/project/${projectNo}" class="logo d-flex align-items-center">
        <img src="${contextPath}/resources/images/logo/turtleLogo-green.png" alt="Turtle"/>
        <span class="d-none d-lg-block">TURTLE</span>
      </a>
    </div><!-- End Logo -->
    
    <section>
		<!-- <form action="${contextPath}/member/logout" method="GET">
			<button>로그아웃 테스트(header.jsp)</button>
		</form> -->
	  </section>

     <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
       
        <!-- 알림 -->
        <!-- 알림 -->
        <li class="nav-item dropdown">

            <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                <i class="bi bi-bell"></i>
                <span class="badge bg-primary badge-number"></span>
            </a><!-- End Notification Icon -->

            <ul id="alert-area" class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications" style="width: 320px;">
                
               
            
            </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <!-- 사이드버튼 (필요없음) -->
        <!-- <li class="nav-item dropdown">
          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <button class="sidebar-toggle" id="toggleButton">
           
            <i class="bi bi-chat-left-text"></i> 
       
          </button>
          </a>
        </li> -->
       
      </ul>
    </nav><!-- End Icons Navigation -->


</header>

<!-- ======= Sidebar(왼쪽 사이드바) ======= -->
  <aside id="sidebar" class="sidebar"> 

    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item dropdown pe-0"> 
        <!-- 프로필 --> 
        <a class="nav-link nav-profile d-flex align-items-center pe-0" id="nav-link-size" href="${contextPath}/member/myPage/info" data-bs-toggle="dropdown">

          <c:choose>
            <c:when test="${!empty loginMember.socialEmail}">
              <img src="${loginMember.profileImage}" alt="Profile" class="rounded-circle">
            </c:when>
            <c:otherwise>
              <c:if test="${empty loginMember.profileImage}">
                <img src="${contextPath}/resources/images/memberProfile/member.png" alt="Profile" class="rounded-circle">
              </c:if>
      
              <c:if test="${!empty loginMember.profileImage}">
                <img src="${contextPath}${loginMember.profileImage}" alt="Profile" class="rounded-circle">
              </c:if>
            </c:otherwise>
          </c:choose>


          <!-- <c:if test="${empty loginMember.profileImage}">
            <img src="${contextPath}/resources/images/memberProfile/member.png" alt="Profile" class="rounded-circle">
          </c:if>
  
          <c:if test="${!empty loginMember.profileImage}">
            <img src="${contextPath}${loginMember.profileImage}" alt="Profile" class="rounded-circle">
          </c:if> -->


          <!-- <img src="${loginMember.profileImage}" alt="Profile" class="rounded-circle"> -->
          <span class="d-none d-md-block dropdown-toggle ps-2">${loginMember.memberName}</span>
        </a><!-- End Profile Iamge Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <h6>${loginMember.memberName}</h6>
            <span>Web Designer</span>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <!-- 마이페이지 -->
            <a class="dropdown-item d-flex align-items-center" href="${contextPath}/member/myPage/info">
              <i class="bi bi-person"></i>
              <span>My Profile</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <!-- <li>
            <a class="dropdown-item d-flex align-items-center" href="">
              <i class="bi bi-gear"></i>
              <span>Account Settings</span>
            </a>
          </li>
          <li> -->
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="${contextPath}/etc/main-faq">
              <i class="bi bi-question-circle"></i>
              <span>Need Help?</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="${contextPath}/member/logout">
              <i class="bi bi-box-arrow-right"></i>
              <span>Sign Out</span>
            </a>
          </li>

        </ul><!-- End Profile Dropdown Items -->
      </li><!-- End Profile Nav -->
      <!-- <li class="nav-item">
        <a class="nav-link " href="${contextPath}/member/login">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li>End Dashboard Nav -->

  
   <li class="nav-item" style="position: relative;">
        <a class="nav-link collapsed" data-bs-target="#project-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-chevron-down" id="arrow"></i><i class="bi bi-menu-button-wide"></i><span>PROJECT</span>
        </a>

    
  <ul id="project-nav" class="nav-content collapse " data-bs-parent="">
    <c:forEach var="project" items="${projectList}">
      <c:if test="${project.createMemberNo == loginMember.memberNo}">        
          <li>
            <a href="${contextPath}/project/${project.projectNo}">
            <span>${project.projectEmoji}&nbsp</span> 
              <span>${project.projectName}</span>
              <div class="file-menu dropdown ms-auto" oncontextmenu="return false;">
                <button class="dropdown-nev" type="button" id="project1Dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="bi bi-three-dots-vertical" style="padding-right: 11px;"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="project1Dropdown">
                  <button class="dropdown-item rename-button" type="button" onclick="renameProject(${project.projectNo})"><i class="bi bi-pencil"></i> 이름 바꾸기</button>
				<button class="dropdown-item delete-button" type="button" onclick="deleteProject(${project.projectNo})" data-projectNo="${project.projectNo}"><i class="bi bi-trash"></i> 삭제하기</button>
                </div>
              </div>
            </a>
          </li>
        </c:if>
  </c:forEach>
    <!-- 추가적인 프로젝트 항목들 -->
  </ul>
</li><!-- 내프로젝트 끝 -->


    <li class="nav-item" style="position: relative;">
        <a class="nav-link collapsed" data-bs-target="#shared-project-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-chevron-down" id="arrow"></i><i class="bi-share-fill"></i> <span>SHARED PROJECT</span>
        </a>
        <!-- <button class="add-file-button" onclick="addFileAndToggle('shared-project-nav', event)"><i class="bi bi-plus"></i></button> -->

        <ul id="shared-project-nav" class="nav-content collapse " data-bs-parent="">
                <c:forEach var="project" items="${projectList}">
                  
                    <c:if test="${project.createMemberNo != loginMember.memberNo}">
                      <li>
                        <a href="${contextPath}/project/${project.projectNo}">
                          <span>${project.projectEmoji}&nbsp</span> 
                          <span>${project.projectName}</span>
                          <div class="file-menu dropdown ms-auto" oncontextmenu="return false;">
                            <button class="dropdown-nev" type="button" id="project1Dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="bi bi-three-dots-vertical" style="padding-right: 11px;"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="project1Dropdown">
                              <button class="dropdown-item rename-button" type="button" onclick="renameProject(${project.projectNo})"><i class="bi bi-pencil"></i> 이름 바꾸기</button>
                              <button class="dropdown-item delete-button" type="button" onclick="deleteProject(${project.projectNo})" data-projectNo="${project.projectNo}"><i class="bi bi-trash"></i> 삭제하기</button>
                            </div>
                          </div>
                        </a>
                      </li>
                    
                  </c:if>    
              </c:forEach>
                <!-- 추가적인 프로젝트 항목들 -->
              </ul>
    </li><!-- End Shared Project Nav -->


  <li class="nav-item" style="position: relative;">
          <a class="nav-link collapsed" data-bs-target="#workspace-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-chevron-down" id="arrow"></i><i class="bx bx-desktop"></i><span>WORKSPACE</span>
          </a>
		   <button class="add-file-button" type="button" onclick="redirectToCreateWorkspace(${projectNo})"><i class="bi bi-plus"></i></button>
          <ul id="workspace-nav" class="nav-content collapse" data-bs-parent="">
            <c:forEach var="workspace" items="${workspaceList}">
              <c:if test="${workspace.workspaceName != 'calendar' && workspace.workspaceName != 'loadmap'}">
                <li>
                  <a href="${contextPath}/project/${projectNo}/${workspace.workspaceNo}">
                  	<span>${workspace.workspaceEmoji}&nbsp</span>
                    <span>${workspace.workspaceName}</span>
                    <div class="file-menu dropdown ms-auto" oncontextmenu="return false;">
                      <button class="dropdown-nev" type="button" id="project1Dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="bi bi-three-dots-vertical" style="padding-right: 11px;"></i>
                      </button>
                      <div class="dropdown-menu" aria-labelledby="project1Dropdown">
                        <button class="dropdown-item rename-button" type="button" onclick="renameWorkspace(${workspace.workspaceNo})"><i class="bi bi-pencil"></i> 이름 바꾸기</button>
                        <button class="dropdown-item delete-button" type="button" onclick="deleteWorkspace(${workspace.workspaceNo})" data-workspaceNo="${workspace.workspaceNo}"><i class="bi bi-trash"></i> 삭제하기</button>
                      </div>
                    </div>
                  </a>
                </li>
              </c:if>                          
            </c:forEach>
            <!-- 추가적인 작업 공간 항목들 -->
          </ul>
        </li><!-- End Workspace Nav -->
        <br><br><br><br><br><br><br><br>
        <c:forEach var="workspace" items="${workspaceList}">
        <c:if test="${workspace.workspaceName == 'loadmap'}">
        <li class="nav-item">
          <a class="nav-link collapsed" href="${contextPath}/workspace/loadmap/${projectNo}/${workspace.workspaceNo}"><!-- projectNo, workspaceNo -->
            <i class="ri-github-fill"></i>
            <span>GitHub</span>
          </a>
        </li>
        </c:if>
        <c:if test="${workspace.workspaceName == 'calendar'}"> 
        <li class="nav-item">
          <a class="nav-link collapsed" href="${contextPath}/calendar/calendar/${projectNo}/${workspace.workspaceNo}">
            <i class="bi bi-calendar-check"></i>
            <span>Calendar</span>
          </a>
          <div id="line"></div>
        </li>
        </c:if>
        </c:forEach>
        <li class="nav-heading">Report</li>

        <!-- 결제 -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="${contextPath}/payment/pay/${projectNo}">
            <i class="bx bxs-receipt"></i>
            <span>Payment Details</span>
          </a>
        </li>
        
      </ul>    
  </aside><!-- End Sidebar-->


<!-- right sidebar(오른쪽 사이드바) --> 
  
<aside class="board-detail-area right-sidebar" id="rightSidebar" >

  <div class="boardDetailBoard-area" data-boardNo="${board.boardNo}">
    <div class="board-info-area">
        <div class="boardTitle">${board.boardTitle}</div>
        <div class="regInfo">
            <div class="regMember"> 
                <div><i class="fa-regular fa-circle-user">  생성자</i></div>
                <div class="regMemberImageAndName">
                    <img class="regMemberImage" src="${contextPath}${board.regProfileImg}">
                </div>
                <div class="regMemberName">${board.regMemberName}</div>
            </div>
            <div class="regDate-area">
                <div><i class="fa-regular fa-clock">  생성일</i></div>
                <div class="regDate">${board.boardRegDate}</div>
            </div>
        </div>

        <div class="updateInfo">
            <div class="updateMember">
                <div><i class="fa-regular fa-circle-user">  최근 수정자</i></div>                    
                <div class="updateMemberImageAndName">
                    <c:choose>
                        <c:when test="${!empty board.updateProfileImg}">
                            <img class="updateMemberImage" src="${contextPath}${board.updateProfileImg}">
                        </c:when>
                        <c:otherwise>
                            <img class="updateMemberImage">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="updateMemberName">${board.updateMemberName}</div>
            </div>
            <div class="updateDate-area">
                <div><i class="fa-regular fa-clock">  최근 수정일</i></div>                    
                    <div class="updateDate">
                        <c:if test="${!empty board.boardUpdateDate}">
                            ${board.boardUpdateDate}
                        </c:if>
                    </div>
            </div>
        </div>
        <div class="eventDate">                
            <div><i class="fa-regular fa-calendar">  이벤트</i></div>
            <div><input type="date" class="eventStartDate" value="${board.eventStartDate}"></div>
            <div> - </div>
            <div><input type="date" class="eventEndDate" value="${board.eventEndDate}"></div>                
        </div>
        
        
    </div>

    <hr>
    
    <div class="boardDetail-area">
        
    </div>
</div>
 
</aside>
<div class="chat-div">
  <a class ="chat-btn" href="javascript:join()"><i class="fa-regular fa-comments"></i></a>
</div>
</body>
  
  <!-- <script src='${contextPath}/resources/js/chat.js'></script>  -->
  <script src="${contextPath}/resources/js/bootstrapjs/bootstrap.bundle.js"></script>
  <script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js?ver=5"></script> 

  <!-- Template Main JS File -->
  <script src="${contextPath}/resources/js/bootstrapjs/bootstrapmain.js?ver=4"></script>

  <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->	
  <!-- https://github.com/sockjs/sockjs-client -->
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  <script>
    var pmNo = "${pmNo}";
    var projectNo = "${projectNo}";
    var workspaceNo = "${workspaceNo}";
    var contextPath = "${contextPath}";
    var memberNo = "${memberNo}";
    var memberName = "${memberName}";
    var profileImage = "${profileImage}";
    var boardNo = "${boardNo}";

		// 이벤트 시간 생성용 sock
    let updateEventDateSock = new SockJS(contextPath+"/updateEventDate");  
    // /memo 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		let memoSock = new SockJS(contextPath+"/memo");
    // 알람용 sock
    let alertSock = new SockJS(contextPath+"/alert");
    // 캘린더 연동용 sock
    let calendarSock = new SockJS(contextPath+"/calendar");
    // 게시글 내용 수정용 sock
		let updateBoardDetailSock = new SockJS(contextPath+"/updateBoardDetail");
		// 게시글 내용 추가용 sock
		let insertBoardDetailSock = new SockJS(contextPath+"/insertBoardDetail");
		// 게시글 내용 삭제용 sock
		let deleteBoardDetailSock = new SockJS(contextPath+"/deleteBoardDetail");
    // 게시글 수정용 sock
		let boardListSock = new SockJS(contextPath+"/boardList");
		// 게시글 추가용 sock
		let insertBoardSock = new SockJS(contextPath+"/insertBoard");
		// 게시글 삭제용 sock
		let deleteBoardSock = new SockJS(contextPath+"/deleteBoard");
    // 이모지 수정용 sock
    let updateEmojiSock = new SockJS(contextPath+"/updateEmoji");
</script>
<script src="${contextPath}/resources/js/header.js"></script>
<!-- boardDetail.js 연결 -->
<script src="${contextPath}/resources/js/board/boardDetail.js"></script>

