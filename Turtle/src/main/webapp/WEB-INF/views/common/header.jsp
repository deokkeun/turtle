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
	<!-- main-style.css -->
  <link href="${contextPath}/resources/css/main-style.css" rel="stylesheet">
  <!-- bootstrap.css -->
  <link href="${contextPath}/resources/css/booystrapcss/bootstrap.css" rel="stylesheet">
  <link href="${contextPath}/resources/images/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${contextPath}/resources/images/remixicon/remixicon.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <link href="${contextPath}/resources/css/boxicons/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

<header id="header" class="header fixed-top d-flex align-items-center">

	

    <div class="d-flex align-items-center justify-content-between">
      <i class="bi bi-list toggle-sidebar-btn"></i>
      <a href="${contextPath}/member/login" class="logo d-flex align-items-center">
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

        <li class="nav-item dropdown">
          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <button class="sidebar-toggle" id="toggleButton">
           
            <i class="bi bi-chat-left-text"></i> <!-- 아이콘 추가 -->
       
          </button>
          </a>
          </li>
       
      </ul>
    </nav><!-- End Icons Navigation -->


</header>

<!-- ======= Sidebar(왼쪽 사이드바) ======= -->
  <aside id="sidebar" class="sidebar"> 

    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item dropdown pe-3"> 
        <!-- 프로필 --> 
        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="${contextPath}/member/myPage/info" data-bs-toggle="dropdown">
          <c:if test="${empty loginMember.profileImage}">
            <img src="${contextPath}/resources/images/memberProfile/member.png" alt="Profile" class="rounded-circle">
          </c:if>
  
          <c:if test="${!empty loginMember.profileImage}">
            <img src="${contextPath}${loginMember.profileImage}" alt="Profile" class="rounded-circle">
          </c:if>
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

          <li>
            <a class="dropdown-item d-flex align-items-center" href="">
              <i class="bi bi-gear"></i>
              <span>Account Settings</span>
            </a>
          </li>
          <li>
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
      <c:if test="${project.projectNo == projectMember.projectNo}">
        <c:if test="${projectMember.projectManager == 'Y'}">
          <li>
            <a href="${contextPath}/project/${project.projectNo}">
              <span>${project.projectName}</span>
              <div class="file-menu dropdown ms-auto" oncontextmenu="return false;">
                <button class="dropdown-nev" type="button" id="project1Dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="bi bi-three-dots-vertical" style="padding-right: 11px;"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="project1Dropdown">
                  <button class="dropdown-item rename-button" onclick="renameFile(this)"><i class="bi bi-pencil"></i> 이름 바꾸기</button>
                  <button class="dropdown-item delete-button" onclick="deleteFile(this)"><i class="bi bi-trash"></i> 삭제하기</button>
                  <button class="dropdown-item duplicate-button" onclick="duplicateFile(this)"><i class="bi bi-files"></i> 복제하기</button>
                </div>
              </div>
            </a>
          </li>
        </c:if>
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
                  
                    <c:if test="${project.projectNo != projectMember.projectNo}">
                      <li>
                        <a href="${contextPath}/project/${project.projectNo}">
                          <span>${project.projectName}</span>
                          <div class="file-menu dropdown ms-auto" oncontextmenu="return false;">
                            <button class="dropdown-nev" type="button" id="project1Dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="bi bi-three-dots-vertical" style="padding-right: 11px;"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="project1Dropdown">
                              <button class="dropdown-item rename-button" onclick="renameFile(this)"><i class="bi bi-pencil"></i> 이름 바꾸기</button>
                              <button class="dropdown-item delete-button" onclick="deleteFile(this)"><i class="bi bi-trash"></i> 삭제하기</button>
                              <button class="dropdown-item duplicate-button" onclick="duplicateFile(this)"><i class="bi bi-files"></i> 복제하기</button>
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
         <!--   <button class="add-file-button" onclick="addFile('workspace-nav', event)"><i class="bi bi-plus"></i></button> -->
          <ul id="workspace-nav" class="nav-content collapse" data-bs-parent="">
            <c:forEach var="workspace" items="${workspaceList}">
              <c:if test="${workspace.workspaceName != 'calendar' && workspace.workspaceName != 'loadmap'}">
                <li>
                  <a href="${contextPath}/workspace/${projectNo}/${workspace.workspaceNo}">
                    <span>${workspace.workspaceName}</span>
                    <div class="file-menu dropdown ms-auto" oncontextmenu="return false;">
                      <button class="dropdown-nev" type="button" id="project1Dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="bi bi-three-dots-vertical" style="padding-right: 11px;"></i>
                      </button>
                      <div class="dropdown-menu" aria-labelledby="project1Dropdown">
                        <button class="dropdown-item rename-button" onclick="renameFile(this)"><i class="bi bi-pencil"></i> 이름 바꾸기</button>
                        <button class="dropdown-item delete-button" onclick="deleteFile(this)"><i class="bi bi-trash"></i> 삭제하기</button>
                        <button class="dropdown-item duplicate-button" onclick="duplicateFile(this)"><i class="bi bi-files"></i> 복제하기</button>
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
          <a class="nav-link collapsed" href="${contextPath}/payment/pay/1">
            <i class="bx bxs-receipt"></i>
            <span>Payment Details</span>
          </a>
        </li>
        
      </ul>    
  </aside><!-- End Sidebar-->


<!-- right sidebar(오른쪽 사이드바) --> 
  
  <aside class="right-sidebar" id="rightSidebar" >
	  <div>${projectNo}</div>
    <div>3</div>
    <div style="overflow: scroll; height: 200px;">		
					<div style="overflow: scroll;">chatRoomList : ${chatRoomList}</div>	
					<div>projectNo : ${projectNo}</div>
					<div>loginMember : ${loginMember}</div>
					<div>chatRoomNo : ${chatRoomNo}</div>
					<div>pmNo : ${pmNo}</div>
				</div>
        
    <form id="list">
      <ul>
         
      <c:forEach var="chatRoom" items="${chatRoomList}">
          <li class="chatList">
              <form action="../chatRoom/${projectNo}/${chatRoom.chatRoomNo}" id="room" value="${chatRoom.chatRoomNo}">
                  <button class="chatBtn" value="${chatRoom.chatRoomNo}">${chatRoom.chatRoomTitle}</button>
              </form>
          
          </li>  	    	   	
      </c:forEach>
      </ul>
      <div class="r"></div>
  </form>

    
  <button class="sidebar-close-btn" onclick="toggleSidebar()"><i class="bi bi-chevron-double-right"></i></button>
  <ul class="right-sidebar-nav" id="right-sidebar-nav">
 
    <li class="nav-item">
      <span class="nav-link" onclick="toggleSubMenu('project-chatting-nav')">
        <i class="bi bi-chevron-right"></i><span>Project Chatting</span>
      </span>
      <ul class="sub-menu" id="project-chatting-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Project 1</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Project 2</a>
        </li>
        <!-- 추가적인 하위 메뉴 항목들 -->
      </ul>
    </li>
    <li class="nav-item">
      <span class="nav-link" onclick="toggleSubMenu('member-nav')">
        <i class="bi bi-chevron-right"></i><span>MEMBER</span>
      </span>
      <ul class="sub-menu" id="member-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">맴버 1</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">맴버 2</a>
        </li>
        <!-- 추가적인 하위 메뉴 항목들 -->
      </ul>
    </li>
    <!-- 추가적인 메뉴 항목들 -->
  </ul>
  
 
</aside>
  
  
  <!-- <script src='${contextPath}/resources/js/chat.js'></script>  -->
  <script src="${contextPath}/resources/js/bootstrapjs/bootstrap.bundle.js"></script>
  <script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js"></script> 

  <!-- Template Main JS File -->
  <script src="${contextPath}/resources/js/bootstrapjs/bootstrapmain.js?ver=4"></script>
<!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->	
<!-- https://github.com/sockjs/sockjs-client -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>  
    // 로그인이 되어 있을 경우에만
    // 알람용 sock
    const projectNo = "${projectNo}";
    const pmNo = "${pmNo}";
    const contextPath = "${contextPath}";
    let alertSock = new SockJS(contextPath+"/alert");
</script>
<script src="${contextPath}/resources/js/header.js"></script>