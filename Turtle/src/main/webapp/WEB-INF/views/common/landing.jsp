<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="" name="description">
  	<meta content="" name="keywords">
  	
    <title>랜딩페이지</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Favicons -->
  	<link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
  	<link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
  	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  	
  	<!-- Google Fonts -->
  	<!-- 	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|
              Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"> -->
    
    <!-- Fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
    
    <!-- Vendor CSS Files -->
	<link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    
    <!-- 랜딩(헤더/본문/풋터).css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-header.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-footer.css" />
</head>


<body>
    <main>
    	<!-- [0] 랜딩 헤더.jsp -->
      	<jsp:include page="/WEB-INF/views/common/landing-header.jsp" /> 
      
		<!-- 메인페이지 들어가는 버튼(나중에 지울거임) -->         
		<!-- <form action="${contextPath}/member/login" method="GET">
			<button class="mainBtn" style="width: 200px; height: 50px; background-color: orangered; margin-top: 150px;">
				main페이지 바로가기(landing-header.jsp)</button>
		</form> -->

		<!-- 로그인한 회원정보 불러옴 -->
		<!--<c:if test="${!empty loginMember}">
				<div>로그인시(멤버정보)</div>
			<div>회원번호 : ${loginMember.memberNo}</div>
			<div>회원명 : ${loginMember.memberName}</div>
			<div>프로필 이미지 : ${loginMember.profileImage}</div>
			<div>회원 이메일 : ${loginMember.memberEmail}</div>
			<div>회원 가입일 : ${loginMember.enrollDate}</div>
		</c:if>-->
		
		<!-- <c:if test="${empty loginMember}">
			<div class="empty">empty loginMember(landing-header.jsp부분)</div>
		</c:if>  --> 
  	
	
	  	<!-- 이거 없으면  topbanner창 안뜸(js 걸려있음). 꼭 활성화하기  -->
	  	<i class="mobile-nav-toggle"></i>
	  
		<!-- ======= [1] Top banner Section (원래 Hero Section) ======= -->
	  	<section id="topbanner" class="topbanner d-flex align-items-center">
			<div class="container">
				<div class="row">

					<!-- 왼쪽 타이핑효과 문구 및 버튼 (크기 col-lg-7) -->
					<div class="col-lg-7 d-flex flex-column justify-content-center">
					
						<!-- 타이핑 효과 (js랑 연결) -->
						<h1 data-aos="">
							<p id="example1"></p>
						</h1>
						<!-- <h1 data-aos="fade-up">TOTAL 협업툴</h1>
						<h1 data-aos="fade-up">TURTLE</h1> -->
						<h6 data-aos="fade-up" data-aos-delay="400">하나의 공간에서 다양한 협업툴로 쉽고 간편하게!</h6>
						<h6 data-aos="fade-up" data-aos-delay="400">개인, 팀별 프로젝트도 TURTLE과 함께 효율적으로 관리하세요</h6>
					
				
						<!-- 무료로 사용하기 버튼 -->
						<div data-aos="fade-up" data-aos-delay="600">
							<!-- 로그인이 안되었을 경우 (비로그인 상태)  -->
							<c:if test="${empty loginMember}">
								<div class="text-center text-lg-start">
									<a href="${contextPath}/member/signUp" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
										<span>무료로 사용하기</span> <i class="bi bi-arrow-right"></i>
									</a>
								</div>
							</c:if>  
							<!-- 로그인이 되었을 경우 (로그인 상태) && 프로젝트x : 프로젝트 생성(c:if and 조건으로)  -->
							<!-- 현재는 로그인되었을 경우 메인페이지 이동으로함. -->
							<c:if test="${!empty loginMember}">
								<div class="text-center text-lg-start">
									<c:choose>
										<c:when test="${projectNo != 0}">
											<a href="${contextPath}/project/${projectNo}" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
												<span>내 프로젝트로 이동</span> <i class="bi bi-arrow-right"></i>
											</a>
										</c:when>
										<c:otherwise>
											<a href="${contextPath}/project/createProject" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
												<span>내 프로젝트 생성</span> <i class="bi bi-arrow-right"></i>
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>	
							<!-- 로그인이 되었을 경우 (로그인 상태) && 프로젝트o : 메인페이지 이동  -->
							<!-- 아직 프로젝트 컨트롤러 없어서 코드 미작성중 -->
							<!--<c:if test="${!empty loginMember} && ">
								<div class="text-center text-lg-start">
									<a href="${contextPath}/member/login" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
										<span>프로젝트</span> <i class="bi bi-arrow-right"></i>
									</a>
								</div>
							</c:if> -->	    
						</div>	
					
					</div>

			
					<!--오른쪽 사진설정 col-lg-5(크기) -->
					<div class="col-lg-5 hero-img" data-aos="zoom-out" data-aos-delay="200">
						<img src="${contextPath}/resources/images/landing/pc-main.png" class="img-fluid" alt="메인사진안보여요">
					</div>
			
				</div>
			</div>
	  	</section>
	  	<!-- ======= [1] End Topbanner ======= -->


	  	<!-- ======= [2] AutoSwiper-1 Section (원래 Testimonials Section)  ======= -->
	  	<section id="AutoSwiper-1" class="AutoSwiper-1">
	    	<div class="container" data-aos="fade-up">
				
				<!-- 글씨부분 -->
				<header class="section-header">
					<!-- 큰제목 -->
					<p>
						다양한 협업툴로 
						<br>
						프로젝트 및 업무 관리
					</p>
					<!-- 큰제목 설명칸 -->
					<h2>다양한 협업툴로 여기저기 흩어져있는 업무를 한 공간에서 사용할 수 있습니다.</h2>
				</header>
	
				<!-- 슬라이더 (사진+ 동그라미버튼) 전체 -->
	      		<div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="200">
	          		<!-- 슬라이더 사진부분 -->
					<div class="swiper-wrapper">
						<!-- 슬라이더1 -->
						<div class="swiper-slide">
							<div class="testimonial-item">
                                <div class="imoticon">
								    <img src="${contextPath}/resources/images/landing/이모티콘-채팅.png" class="img-fluid" alt="안보여요">
                                </div>
                                <div class="imoticon-name">메신저</div>
                                <div class="imoticon-info">개인별, 워크스페이스별로 <br>효율적인 업무용 메신저</div>
							</div>
						</div>
						<!-- 슬라이더2-->
						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="imoticon">
								    <img src="${contextPath}/resources/images/landing/이모티콘-게시판.png" class="img-fluid" alt="안보여요">
                                </div>
                                <div class="imoticon-name">게시판</div>
                                <div class="imoticon-info">목록별로 업무내용을 공유하고 <br>소통하는 게시판</div>
							</div>
						</div>
						<!-- 슬라이더3 -->
						<div class="swiper-slide">
							<div class="testimonial-item">
                                <div class="imoticon">
								    <img src="${contextPath}/resources/images/landing/이모티콘-달력.png" class="img-fluid" alt="안보여요">
                                </div>
                                <div class="imoticon-name">캘린더</div>
                                <div class="imoticon-info">캘린더 형태로 업무일정을 <br>한눈에 파악하고 관리</div>
						    </div>
                        </div>
						<!-- 슬라이더4 -->
						<div class="swiper-slide">
							<div class="testimonial-item">			
                                <div class="imoticon">
								    <img src="${contextPath}/resources/images/landing/이모티콘-메모.png" class="img-fluid" alt="안보여요">
                                </div>
                                <div class="imoticon-name">메모</div>
                                <div class="imoticon-info">간단한 내용이나 공지사항 등<br>필요한 정보를 빠르게 메모</div>
                            </div>
						</div>
						<!-- 슬라이더5 -->
						<div class="swiper-slide">
							<div class="testimonial-item">			
                                <div class="imoticon">
								    <img src="${contextPath}/resources/images/landing/이모티콘-알림.png" class="img-fluid" alt="안보여요">
                                </div>
                                <div class="imoticon-name">실시간 알림</div>
                                <div class="imoticon-info">업데이트 된 내용을<br>실시간으로 알려주는 알림기능</div>
                            </div>
						</div>
                        <!-- 슬라이더6 -->
						<div class="swiper-slide">
							<div class="testimonial-item">			
                                <div class="imoticon">
								    <img src="${contextPath}/resources/images/landing/이모티콘-github.png" class="img-fluid" alt="안보여요">
                                </div>
                                <div class="imoticon-name">gitHub</div>
                                <div class="imoticon-info">gitHub 연동을 통해<br>저장소를 트리형태로 시각화</div>
                            </div>
						</div>
                        <!-- 슬라이더7 -->
						<div class="swiper-slide">
							<div class="testimonial-item">			
                                <div class="imoticon">
								    <img src="${contextPath}/resources/images/landing/이모티콘-api.png" class="img-fluid" alt="안보여요">
                                </div>
                                <div class="imoticon-name">추천 API</div>
                                <div class="imoticon-info">개발관련 업무에 활용 가능한<br>API 추천리스트</div>
                            </div>
						</div>
						<!-- 슬라이더8 -->
                        <div class="swiper-slide">
							<div class="testimonial-item">			
                                <div class="imoticon">
								    <img src="${contextPath}/resources/images/landing/이모티콘-날씨.png" class="img-fluid" alt="안보여요">
                                    <img src="${contextPath}/resources/images/landing/이모티콘-시계.png" class="img-fluid" alt="안보여요">
                                </div>
                                <div class="imoticon-name">부가 위젯기능</div>
                                <div class="imoticon-info">현재 위치한 장소의<br> 날씨 및 시간 정보</div>
                            </div>
						</div>
	          		</div>
				
	          		<!-- 슬라이더 동그라미 버튼 (현재 페이지위치 보여주는거) -->
	          		<div class="swiper-pagination"></div>	
	    		</div>

			</div>
	    </section>
	    <!-- ======= [2] End AutoSwiper-1 ======= -->
	
	
	
	    
	    <!-- ======= [4] Features Section ======= -->
	    <section id="features" class="features">
	    	<div class="container" data-aos="fade-up">
	
				<!-- 글씨부분 -->
		        <header class="section-header">
					<!-- 큰제목 -->
					<p>
						TURTLE을 사용하는 이유
						<br>
						
					</p>
					<!-- 큰제목 설명칸 -->
					<h2>협업에 필요한 기본적인 기능 외에도
						<br>
						차별화된 기능으로 업무 생산성이 증가됩니다.
					</h2>
	        	</header>
	  
		        <!-- 메뉴 탭메뉴 -->
		        <ul class="nav row gy-4 d-flex">
					<!-- 1. 워크스페이스 (col-lg-3이 tab 자리수임) -->
					<li class="nav-item col-6 col-md-4 col-lg-3">
						<a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#tab-1">
							<h4>워크스페이스</h4>
						</a>
					</li>
					<!-- 2. 실시간 채팅 -->
					<li class="nav-item col-6 col-md-4 col-lg-3">
						<a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-2">
							<h4>실시간 메신저</h4>
						</a>
					</li>
					<!-- 3. 실시간 알림 -->
					<li class="nav-item col-6 col-md-4 col-lg-3">
						<a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-3">
							<h4>알림 및 동기화</h4>
						</a>
					</li>
					<!-- 4. Git Tree -->
					<li class="nav-item col-6 col-md-4 col-lg-3">
						<a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-4">
							<h4>gitHub</h4>
						</a>
					</li>
	        	</ul>
	  
		        <!-- 탭메뉴에 대한 설명 -->
		        <div class="tab-content">
					<!-- 1번 설명 -->
					<div class="tab-pane active show" id="tab-1">
						<div class="row gy-4">
							<!-- 왼쪽특징 -->
							<div class="col-lg-7 video-wrap">
								<video autoplay="" loop="" muted="" class="custom-video" poster="" width="340px">
								<source src="${contextPath}/resources/video/동영상-워크스페이스.mp4" type="video/mp4">
							</div>
						
							<!-- 가운데공백 -->
							<div class="col-lg-1"></div>
							
							<!-- 오른쪽특징 -->
							<div class="col-lg-4 mt-5 mt-lg-0 d-flex">
								<div class="row align-self-center gy-4">
									<!-- 특징1 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="200">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>업무에 다용도로 활용가능한 게시판</h3>
										</div>
									</div>
									<!-- 특징2 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="300">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>일정을 한 눈에 확인할 수 있는 캘린더</h3>
										</div>
									</div>
									<!-- 특징3 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="400">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>간단한 정보를 입력할 수 있는 메모</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
					<!-- 2번 설명 -->
					<div class="tab-pane" id="tab-2">
						<div class="row gy-4">
							<!-- 왼쪽특징 -->
							<div class="col-lg-7 video-wrap">
								<video autoplay="" loop="" muted="" class="custom-video" poster="" height="340px">
								<source src="${contextPath}/resources/video/동영상-메신저.mp4" type="video/mp4">
							</div>
						
							<!-- 가운데공백 -->
							<div class="col-lg-1"></div>
							
							<!-- 오른쪽특징 -->
							<div class="col-lg-4 mt-5 mt-lg-0 d-flex">
								<div class="row align-self-center gy-4">
									<!-- 특징1 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="200">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>프로젝트별, 개인별로 가능한 메신저</h3>
										</div>
									</div>
									<!-- 특징2 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="300">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>팝업형태의 메신저로 타작업과 동시 사용</h3>
										</div>
									</div>
									<!-- 특징3 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="400">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>이모지를 이용하여 재밌는 대화내용 전달</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
					<!-- 3번 설명 -->
					<div class="tab-pane" id="tab-3">
						<div class="row gy-4">
							<!-- 왼쪽특징 -->
							<div class="col-lg-7 video-wrap">
								<video autoplay="" loop="" muted="" class="custom-video" poster="" height="340px">
								<source src="${contextPath}/resources/video/동영상-실시간알림.mp4" type="video/mp4">
							</div>
						
							<!-- 가운데공백 -->
							<div class="col-lg-1"></div>
							
							<!-- 오른쪽특징 -->
							<div class="col-lg-4 mt-5 mt-lg-0 d-flex">
								<div class="row align-self-center gy-4">
									<!-- 특징1 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="200">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>작업 업데이트 내용을 배지로 표시</h3>
										</div>
									</div>
									<!-- 특징2 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="300">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>확인한 알림은 읽음표시 처리</h3>
										</div>
									</div>
									<!-- 특징3 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="400">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>실시간으로 멤버간 게시판 편집 가능</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
					<!-- 4번 설명 -->
					<div class="tab-pane" id="tab-4">
						<div class="row gy-4">
							<!-- 왼쪽특징 -->
							<div class="col-lg-7 video-wrap">
								<video autoplay="" loop="" muted="" class="custom-video" poster="" width="90%">
								<source src="${contextPath}/resources/video/GitHubLoadmap.mp4" type="video/mp4">
							</div>
						
							<!-- 가운데공백 -->
							<div class="col-lg-1"></div>
							
							<!-- 오른쪽특징 -->
							<div class="col-lg-4 mt-5 mt-lg-0 d-flex">
								<div class="row align-self-center gy-4">
									<!-- 특징1 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="200">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>개발자 협업툴인 gitHub 연동지원</h3>
										</div>
									</div>
									<!-- 특징2 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="300">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>repository를 tree구조로 시각화</h3>
										</div>
									</div>
									<!-- 특징3 -->
									<!-- <div class="row-md-4" data-aos="zoom-out" data-aos-delay="400">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>GitHub 저장소 로드맵 기능</h3>
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
		
		        </div>
		        <!-- 탭메뉴 설명끝  -->
		   	
			</div>
	    </section>
	    <!-- ======= [4] End Features Section ======= -->
	
	
	    <!-- ======= [5] MultiDivice Section (원래Recent Blog Posts Section) ======= -->
	    <section id="recent-blog-posts" class="recent-blog-posts bg-body-secondary">
	    	<div class="container" data-aos="fade-up">
				
				<!-- 글씨부분 -->
				<header class="section-header">
					<!-- 큰제목 -->  
					<p>
						기기 제한 없이
						<br>
						최적화된 화면 제공
					</p>
					<!-- 큰제목 설명칸 -->
					<h2>PC, 태블릿, 핸드폰 다양한 디바이스에서 최적화된 화면제공</h2>
				</header>
	
				<!-- 기기사진부분 -->
				<div class="w-100 position-relative bg-body-secondary text-white d-flex align-items-center">
					<div class="container-fluid px-vw-5">
						<!-- 사진 밑에부분 효과(현재 설정없앰) -->
						<div class="position-absolute w-100 h-50 bg-body-secondary bottom-0 start-0"></div>
						<!-- 사진 -->
						
						<div class="row d-flex align-items-center position-relative justify-content-center px-0 g-5">
							<div class="col-12 col-lg-6">
								<img src="${contextPath}/resources/images/landing/pc-main.png" width="2280" height="1732" alt="PC사진" 
										class="img-fluid position-relative shadow" data-aos="fade-up">
							</div>
							
							<div class="col-12 col-md-6 col-lg-3">
								<img src="${contextPath}/resources/images/landing/태블릿사진최종.png" width="1116" height="500" alt="모바일사진" 
										class="img-fluid position-relative shadow" data-aos="fade-up" data-aos-duration="3000">
							</div>
							<div class="col-12 col-md-6 col-lg-3">
								<img src="${contextPath}/resources/images/landing/핸드폰사진.png" width="1116" height="1000" alt="태블릿사진" 
										class="img-fluid  rounded-5 shadow" data-aos="fade-up" data-aos-duration="2000">
							</div>
						</div>
					</div>
				</div>
	
	      	</div>
	    </section>
	    <!-- ======= [5] End MultiDivice Section ======= -->
	

	    <!-- ======= [6] 업무의 효율을 높여보세요 ======= -->
	    <section class="newsletter">
	    	<div class="container">
	        	
				<div class="justify-content-center">
	          		<div class="col-lg-12 text-center">
						<!-- 홍보문구 글씨 -->
	           			<h4>TURTLE과 함께 업무 효율성을 높여보세요</h4>

	    				<!-- 무료로 사용하기 버튼 -->
	            		<div data-aos="zoom-out" data-aos-delay="400">
							
							<!-- 로그인이 안되었을 경우 (비로그인 상태)  -->
							<c:if test="${empty loginMember}">
								<div class="text-center text-lg-center">
									<a href="${contextPath}/member/signUp" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
										<span>무료로 사용하기</span> <i class="bi bi-arrow-right"></i>		
									</a>
								</div>
							</c:if>  
						
							<!-- 로그인이 되었을 경우 (로그인 상태) && 프로젝트x : 프로젝트 생성(c:if and 조건으로)  -->
							<!-- 현재는 로그인되었을 경우 메인페이지 이동으로함. -->
							<c:if test="${!empty loginMember}">
								<div class="text-center text-lg-center">
									<a href="${contextPath}/member/login" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
										<span>프로젝트로 이동</span> <i class="bi bi-arrow-right"></i>	
									</a>
								</div>
							</c:if>	      
	              		</div>
	            	</div>
	          	</div>

	    	</div>
	    </section>
		<!-- ======= [6] End 업무의 효율을 높여보세요 ======= -->

    </main>
    <!-- [0] ~ [6] End main -->
     
    <!-- top버튼 -->
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
		<img src="${contextPath}/resources/images/top버튼거북이.png" alt="거북이" width="50px" >
	    <!-- <i class="bi bi-arrow-up-short"></i> -->
	</a>	

    <!-- 랜딩 푸터.jsp -->
   	<jsp:include page="/WEB-INF/views/common/landing-footer.jsp" />
   

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
   
   	<!-- Vendor JS Files -->	  
	<script src="${contextPath}/resources/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${contextPath}/resources/vendor/aos/aos.js"></script>
	<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/php-email-form/validate.js"></script>

    
    <!-- 랜딩 타이핑효과 js (랜딩js보다 위에 있어야함) -->
	<script src="${contextPath}/resources/js/typeit.min.js"></script>
    
    <!-- landing2.js (프론트 최종작업용) 연결 -->
    <script src="${contextPath}/resources/js/landing2.js"></script>
</body>
</html>