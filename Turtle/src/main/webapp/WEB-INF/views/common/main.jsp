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

	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>

    	<!-- header include -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

 <!-- ======= Sidebar(왼쪽 사이드바) ======= -->
  <aside id="sidebar" class="sidebar"> 

    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item dropdown pe-3"> <!-- 프로필 --> 

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
          <span class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
        </a><!-- End Profile Iamge Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <h6>Kevin Anderson</h6>
            <span>Web Designer</span>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="">
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
            <a class="dropdown-item d-flex align-items-center" href="">
              <i class="bi bi-question-circle"></i>
              <span>Need Help?</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="#">
              <i class="bi bi-box-arrow-right"></i>
              <span>Sign Out</span>
            </a>
          </li>

        </ul><!-- End Profile Dropdown Items -->
      </li><!-- End Profile Nav -->
      <li class="nav-item">
        <a class="nav-link " href="">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

  
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-target="#project-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-chevron-down" id="arrow"></i><i class="bi bi-menu-button-wide"></i><span>나의 프로젝트</span>
            <button class="add-file-button ms-auto" onclick="addFile('project-nav', event)"><i class="bi bi-plus"></i></button>
          </a>
      
          <ul id="project-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
  
            <li>
              <a href="my-projects/project1.html">
                <i class="bi bi-circle"></i><span>프로젝트 1</span>
                <div class="file-menu">
                  <button class="rename-button" onclick="renameFile(this)"><i class="bi bi-pencil"></i></button>
                  <button class="delete-button" onclick="deleteFile(this)"><i class="bi bi-trash"></i></button>
                </div>
              </a>
            </li>
        
            <!-- 추가적인 프로젝트 항목들 -->
  
          </ul>
        </li><!-- End My Project Nav -->
  
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-target="#shared-project-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-chevron-down" id="arrow"></i> </i><span>공유 프로젝트</span>
            <button class="add-file-button ms-auto" onclick="addFile('shared-project-nav')"><i class="bi bi-plus"></i></button>
          </a>
          <ul id="shared-project-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
            <li>
              <a href="">
                <i class="bi bi-circle"></i><span>프로젝트 1</span>
                <div class="file-menu">
                  <button class="rename-button" onclick="renameFile(this)"><i class="bi bi-pencil"></i></button>
                  <button class="delete-button" onclick="deleteFile(this)"><i class="bi bi-trash"></i></button>
                </div>
              </a>
            </li>
       
            <!-- 추가적인 프로젝트 항목들 -->
          </ul>
        </li><!-- End Shared Project Nav -->
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-target="#workspace-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-chevron-down" id="arrow"></i><span>작업 공간</span>
            <button class="add-file-button ms-auto" onclick="addFile('workspace-nav', event)"><i class="bi bi-plus"></i></button>
          </a>
          <ul id="workspace-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
            <li>
              <a href="">
                <i class="bi bi-circle"></i><span>파일</span>
                <div class="file-menu">
                  <button class="rename-button" onclick="renameFile(this)"><i class="bi bi-pencil"></i></button>
                  <button class="delete-button" onclick="deleteFile(this)"><i class="bi bi-trash"></i></button>
                </div>
              </a>
            </li>
            <li>
              <a href="">
                <i class="bi bi-circle"></i><span>할일 목록</span>
                <div class="file-menu">
                  <button class="rename-button" onclick="renameFile(this)"><i class="bi bi-pencil"></i></button>
                  <button class="delete-button" onclick="deleteFile(this)"><i class="bi bi-trash"></i></button>
                </div>
              </a>
            </li>
            <!-- 추가적인 작업 공간 항목들 -->
          </ul>
        </li><!-- End Workspace Nav -->
<br>

        <li class="nav-item">
          <a class="nav-link collapsed" href="">
            <i class="bi bi-envelope"></i>
            <span>Chating</span>
          </a>
          <div id="line"></div>
        </li> 
   
        <li class="nav-heading">Report</li>


        <li class="nav-item">
          <a class="nav-link collapsed" href="">
            <i class="bi bi-dash-circle"></i>
            <span>Settings</span>
          </a>
        </li><!-- End Error 404 Page Nav -->
  
        <li class="nav-item">
          <a class="nav-link collapsed" href="">
            <i class="bi bi-file-earmark"></i>
            <span>Payment Detailss</span>
          </a>
        </li><!-- End Blank Page Nav -->

      </ul>
  </aside><!-- End Sidebar-->
<!-- right sidebar(오른쪽 사이드바) --> 

<aside class="right-sidebar" id="rightSidebar">
    <form action="../chat/chatRoomList/1" method="get">
        	<button>채팅 테스트</button>
    </form>
        
 <jsp:include page="/WEB-INF/views/chat/chatRoomList.jsp"></jsp:include> 

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
    <main id="main" class="main">
 	

		<!-- (index.jsp)/member/login -> (main.jsp)common/main.jsp -->
        <H1>로그인 성공!!</H1>
        <H1>민수 커밋 확인용</H1>
        <H1>덕근 커밋 확인용</H1>
        <H1>수진 커밋 확인용 '_'</H1>

        <div>로그인시(멤버정보)</div>
        <div>회원번호 : ${loginMember.memberNo}</div>
        <div>회원명 : ${loginMember.memberName}</div>
        <div>프로필 이미지 : ${loginMember.profileImage}</div>
        <div>회원 이메일 : ${loginMember.memberEmail}</div>
        <div>회원 가입일 : ${loginMember.enrollDate}</div>
        <div>
            access_token
            <input type="text" name="access_token" value="" style="width: 600px;">
        </div>
        
        
       
        <form action="myPage/info" method="GET">
                <button>마이페이지 이동</button>
        </form>
        

        <form action="../workspace/loadmap" method="GET">
            <button>git loadMap test(GET)</button>
        </form>
      
        <form action="../calendar/calendar" method="GET">
           <button>calendar</button>
        </form>
              
        <form action="../chat/chatRoomList/1" method="get">
        	<button>채팅 테스트</button>
        </form>
        
        <form action="../workspace/memo/1/5" method="get">
        	<button>메모장 테스트</button>
        </form>

        <form action="../project/createProject" method="get">
        	<button>성훈 테스트</button>
        </form>
        


    </main>
    <script>
      const contextPath = "${contextPath}";

    </script>
    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
     <!-- Vendor JS Files -->
	
  <script src="${contextPath}/resources/js/bootstrapjs/bootstrap.bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${contextPath}/resources/js/bootstrapjs/bootstrapmain.js"></script>
  <script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js"></script>

  <!-- chat js -->
  <script src="${contextPath}/resources/js/chat.js"></script>
</body>
</html>