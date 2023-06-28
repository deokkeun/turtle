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

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->
    <section>
		<!-- <form action="${contextPath}/member/logout" method="GET">
			<button>로그아웃 테스트(header.jsp)</button>
		</form> -->
	</section>

     <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->
       
        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Dicta reprehenderit</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        
        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bx bxs-category"></i>
            <span class="badge bg-success badge-number"></span>
          </a><!-- End Messages Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${contextPath}/resources/images/memberProfile/member.png" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${contextPath}/resources/images/memberProfile/member.png" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${contextPath}/resources/images/memberProfile/member.png" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->
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
        <button class="add-file-button" onclick="addFile('project-nav', event)"><i class="bi bi-plus"></i></button>

  <ul id="project-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
 <!--    <li>
      <a href="my-projects/project1.html">
        <span>project 1</span>
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
    </li> -->
    <!-- 추가적인 프로젝트 항목들 -->
  </ul>
</li><!-- End My Project Nav -->
  
 <li class="nav-item" style="position: relative;">

          <a class="nav-link collapsed" data-bs-target="#shared-project-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-chevron-down" id="arrow"></i><i class="bi-share-fill"></i> <span>SHARED PROJECT</span>
          </a>
          <button class="add-file-button" onclick="addFile('shared-project-nav', event)"><i class="bi bi-plus"></i></button>
          <ul id="shared-project-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
  <!--           <li>
              <a href="">
                <span>project 1</span>
                <div class="file-menu dropdown ms-auto" oncontextmenu="return false;">
                  <button class="dropdown-nev" type="button" id="project1Dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="bi bi-three-dots-vertical" style="padding-right: 11px;
                    "></i>
                  </button>
                  <div class="dropdown-menu" aria-labelledby="project1Dropdown">
                    <button class="dropdown-item rename-button" onclick="renameFile(this)"><i class="bi bi-pencil"></i>이름 바꾸기</button>
                    <button class="dropdown-item delete-button" onclick="deleteFile(this)"><i class="bi bi-trash"></i>삭제하기</button>
                    <button class="dropdown-item duplicate-button" onclick="duplicateFile(this)"><i class="bi bi-files"></i>복제하기</button>
                  </div>
                </div>
              </a>
            </li> -->
       
            <!-- 추가적인 프로젝트 항목들 -->
          </ul>
        </li><!-- End Shared Project Nav -->

        <br>

  <li class="nav-item" style="position: relative;">
          <a class="nav-link collapsed" data-bs-target="#workspace-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-chevron-down" id="arrow"></i><i class="bx bx-desktop"></i><span>WORKSPACE</span>
          </a>
          <button class="add-file-button" onclick="addFile('workspace-nav', event)"><i class="bi bi-plus"></i></button>
          <ul id="workspace-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
          <!--   <li>
              <a href="">
               <span>파일</span>
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
            <li>
              <a href="">
                <span>할일 목록</span>
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
            </li> -->
            <!-- 추가적인 작업 공간 항목들 -->
          </ul>
        </li><!-- End Workspace Nav -->



        <br><br><br><br><br><br><br><br>




        <li class="nav-item">
          <a class="nav-link collapsed" href="${contextPath}/workspace/loadmap/1">
            <i class="ri-message-3-line"></i>
            <span>GitHub</span>
          </a>
          <div id="line"></div>
        </li> 
        <li class="nav-item">
          <a class="nav-link collapsed" href="${contextPath}/calendar/calendar/1/9">
            <i class="ri-message-3-line"></i>
            <span>Calendar</span>
          </a>
          <div id="line"></div>
        </li> 


        <li class="nav-heading">Report</li>

        <!-- 결제 -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="${contextPath}/payment/pay/1">
            <i class="bx bxs-receipt"></i>
            <span>Payment Details</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="">
            <i class="ri-settings-5-line"></i>
            <span>Settings</span>
          </a>
        </li><!-- End Error 404 Page Nav --><!-- End Blank Page Nav -->


      </ul>
  </aside><!-- End Sidebar-->

      </ul>
  </aside><!-- End Sidebar-->
<!-- right sidebar(오른쪽 사이드바) --> 
  
  <aside class="right-sidebar" id="rightSidebar" >
	
     <jsp:include page='/WEB-INF/views/chat/chatRoomList.jsp'/>
     <input type="hidden" id="projectNo" value="${projectNo}">
    
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
  
  <script src='${contextPath}/resources/js/chat.js'></script> 
  <script src="${contextPath}/resources/js/bootstrapjs/bootstrap.bundle.js"></script>

  <!-- Template Main JS File -->
  <script src="${contextPath}/resources/js/bootstrapjs/bootstrapmain.js?ver=3"></script>
 
  
  <script>




  </script>