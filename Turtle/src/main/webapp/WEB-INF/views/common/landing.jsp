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
    
    <!-- Favicons -->
  	<link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
  	<link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
  	
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
						<h6 data-aos="fade-up" data-aos-delay="400">단절된 소통, 번거로운 자료 공유, 보안 위협은 이제 그만!</h6>
						<h6 data-aos="fade-up" data-aos-delay="400">협업툴 잔디와 함께라면 효율적으로 협업할 수 있습니다.</h6>
					
				
						<!-- 무료로 사용하기 버튼 -->
						<div data-aos="fade-up" data-aos-delay="600">
							<!-- 로그인이 안되었을 경우 (비로그인 상태)  -->
							<c:if test="${empty loginMember}">
								<div class="text-center text-lg-start">
									<a href="${contextPath}/member/signUp" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
										<span>무료로 사용하기</span> <i class="bi bi-arrow-right"></i>
									</a>
									<!-- 자동로그인 테스트부분 (나중에 지울거임) -->
									<div class="auto-login">
										<form action="member/testLogin" method="POST">
											<input type="hidden" name="memberEmail" value="test01@gmail.com">
											<input type="hidden" name="memberPw" value="password999!">
											<button>일일맨테스트로그인</button>
										</form>
										<form action="member/testLogin" method="POST">
											<input type="hidden" name="memberEmail" value="user999@gmail.com">
											<input type="hidden" name="memberPw" value="password999!">
											<button>구구맨테스트로그인</button>
										</form>
									</div> 
								</div>
							</c:if>  
							<!-- 로그인이 되었을 경우 (로그인 상태) && 프로젝트x : 프로젝트 생성(c:if and 조건으로)  -->
							<!-- 현재는 로그인되었을 경우 메인페이지 이동으로함. -->
							<c:if test="${!empty loginMember}">
								<div class="text-center text-lg-start">
									<a href="${contextPath}/member/login" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
										<span>프로젝트로 이동</span> <i class="bi bi-arrow-right"></i>
									</a>
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
						<img src="${contextPath}/resources/images/landing/hero-img.png" class="img-fluid" alt="메인사진안보여요">
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
					<p>하나의 툴로 모든 프로젝트 및 업무 관리</p>
					<!-- 큰제목 설명칸 -->
					<h2>해당 기능에 대한 홍보 문구 작성하기</h2>
				</header>
	
				<!-- 슬라이더 (사진+ 동그라미버튼) 전체 -->
	      		<div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="200">
	          		<!-- 슬라이더 사진부분 -->
					<div class="swiper-wrapper">
						<!-- 슬라이더1 -->
						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="${contextPath}/resources/images/landing/오둥1.jpeg" class="img-fluid" alt="안보여요">
							</div>
						</div>
						<!-- 슬라이더2-->
						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="${contextPath}/resources/images/landing/오둥2.jpg" class="img-fluid" alt="안보여요">       
							</div>
						</div>
						<!-- 슬라이더3 -->
						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="${contextPath}/resources/images/landing/오둥3.jpg" class="img-fluid" alt="안보여요">               
							</div>
						</div>
						<!-- 슬라이더4 -->
						<div class="swiper-slide">
							<div class="testimonial-item">			
								<img src="${contextPath}/resources/images/landing/오둥4.jpg" class="img-fluid" alt="안보여요">               
							</div>
						</div>
						<!-- 슬라이더5 -->
						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="${contextPath}/resources/images/landing/오둥5.jpg" class="img-fluid" alt="안보여요">       
							</div>
						</div>
	          		</div>
				
	          		<!-- 슬라이더 동그라미 버튼 (현재 페이지위치 보여주는거) -->
	          		<div class="swiper-pagination"></div>	
	    		</div>

			</div>
	    </section>
	    <!-- ======= [2] End AutoSwiper-1 ======= -->
	
	    
	    <!-- ======= [3] AutoSwiper-2 Section (원래 Clients Section) ======= -->
	    <section id="clients" class="clients">
	    	<div class="container" data-aos="fade-up">

				<!-- 글씨부분 -->
				<header class="section-header">
					<!-- 큰제목 -->
					<p>슬라이드기능2</p>
					<!-- 큰제목 설명칸 -->
					<h2>뭐가더좋을까요</h2>
				</header>
				
				<!-- 슬라이더 (사진+ 동그라미버튼) 전체 -->
				<div class="clients-slider swiper">
					<!-- 슬라이더 사진부분 -->
					<div class="swiper-wrapper align-items-center">
						<div class="swiper-slide">
							<img src="${contextPath}/resources/images/landing/오둥1.jpeg" class="img-fluid" alt="안보여요">
						</div>
						<div class="swiper-slide">
							<img src="${contextPath}/resources/images/landing/오둥2.jpg" class="img-fluid" alt="안보여요">
						</div>
						<div class="swiper-slide">
							<img src="${contextPath}/resources/images/landing/오둥3.jpg" class="img-fluid" alt="안보여요">
						</div>
						<div class="swiper-slide">
							<img src="${contextPath}/resources/images/landing/오둥4.jpg" class="img-fluid" alt="안보여요">
						</div>
						<div class="swiper-slide">
							<img src="${contextPath}/resources/images/landing/오둥5.jpg" class="img-fluid" alt="안보여요">
						</div>
						<div class="swiper-slide">
							<img src="${contextPath}/resources/images/landing/client-6.png" class="img-fluid" alt="안보여요">
						</div>
						<div class="swiper-slide">
							<img src="${contextPath}/resources/images/landing/client-7.png" class="img-fluid" alt="안보여요">
						</div>
						<div class="swiper-slide">
							<img src="${contextPath}/resources/images/landing/client-8.png" class="img-fluid" alt="안보여요">
						</div>
					</div>
	
	           		<!-- swiper 동그라미 버튼 (현재 페이지위치 보여주는거) -->
	          		<div class="swiper-pagination"></div>
	        	</div>

	      	</div>
	    </section>
	    <!-- ======= [3] End AutoSwiper-2 ======= -->
	
	    
	    <!-- ======= [4] Features Section ======= -->
	    <section id="features" class="features">
	    	<div class="container" data-aos="fade-up">
	
				<!-- 글씨부분 -->
		        <header class="section-header">
					<!-- 큰제목 -->
					<p>내가 만들고 싶은대로 커스텀 프로젝트 관리</p>
					<!-- 큰제목 설명칸 -->
					<h2>해당 기능에 대한 홍보 문구 </h2>
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
							<h4>실시간 채팅</h4>
						</a>
					</li>
					<!-- 3. 실시간 알림 -->
					<li class="nav-item col-6 col-md-4 col-lg-3">
						<a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-3">
							<h4>실시간 알림</h4>
						</a>
					</li>
					<!-- 4. 멤버 관리 -->
					<li class="nav-item col-6 col-md-4 col-lg-3">
						<a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-4">
							<h4>멤버 관리</h4>
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
								<video autoplay="" loop="" muted="" class="custom-video" poster="" width="90%">
								<source src="${contextPath}/resources/video/pexels-2022395.mp4" type="video/mp4">
							</div>
						
							<!-- 가운데공백 -->
							<div class="col-lg-1"></div>
							
							<!-- 오른쪽특징 -->
							<div class="col-lg-4 mt-5 mt-lg-0 d-flex">
								<div class="row align-self-center gy-4">
									<!-- 특징1 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="200">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>워크스페이스 기능에 대한 특징1</h3>
										</div>
									</div>
									<!-- 특징2 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="300">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>워크스페이스  기능에 대한 특징2</h3>
										</div>
									</div>
									<!-- 특징3 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="400">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>워크스페이스 기능에 대한 특징3</h3>
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
								<video autoplay="" loop="" muted="" class="custom-video" poster="" width="90%">
								<source src="${contextPath}/resources/video/pexels-2022395.mp4" type="video/mp4">
							</div>
						
							<!-- 가운데공백 -->
							<div class="col-lg-1"></div>
							
							<!-- 오른쪽특징 -->
							<div class="col-lg-4 mt-5 mt-lg-0 d-flex">
								<div class="row align-self-center gy-4">
									<!-- 특징1 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="200">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>실시간 채팅 기능에 대한 특징1</h3>
										</div>
									</div>
									<!-- 특징2 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="300">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>실시간 채팅 기능에 대한 특징2</h3>
										</div>
									</div>
									<!-- 특징3 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="400">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>실시간 채팅 기능에 대한 특징3</h3>
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
								<video autoplay="" loop="" muted="" class="custom-video" poster="" width="90%">
								<source src="${contextPath}/resources/video/pexels-2022395.mp4" type="video/mp4">
							</div>
						
							<!-- 가운데공백 -->
							<div class="col-lg-1"></div>
							
							<!-- 오른쪽특징 -->
							<div class="col-lg-4 mt-5 mt-lg-0 d-flex">
								<div class="row align-self-center gy-4">
									<!-- 특징1 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="200">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>실시간 알림 기능에 대한 특징1</h3>
										</div>
									</div>
									<!-- 특징2 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="300">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>실시간 알림 기능에 대한 특징2</h3>
										</div>
									</div>
									<!-- 특징3 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="400">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>실시간 알림 기능에 대한 특징3</h3>
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
								<source src="${contextPath}/resources/video/pexels-2022395.mp4" type="video/mp4">
							</div>
						
							<!-- 가운데공백 -->
							<div class="col-lg-1"></div>
							
							<!-- 오른쪽특징 -->
							<div class="col-lg-4 mt-5 mt-lg-0 d-flex">
								<div class="row align-self-center gy-4">
									<!-- 특징1 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="200">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>멤버관리 기능에 대한 특징1</h3>
										</div>
									</div>
									<!-- 특징2 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="300">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>멤버관리 기능에 대한 특징2</h3>
										</div>
									</div>
									<!-- 특징3 -->
									<div class="row-md-4" data-aos="zoom-out" data-aos-delay="400">
										<div class="feature-box d-flex align-items-center">
											<i class="bi bi-check"></i> <h3>멤버관리 기능에 대한 특징3</h3>
										</div>
									</div>
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
					<p>PC, 핸드폰 기기 제한 없이 최적화된 화면 제공</p>
					<!-- 큰제목 설명칸 -->
					<h2>해당내용 홍보문구 쓰기</h2>
				</header>
	
				<!-- 기기사진부분 -->
				<div class="w-100 position-relative bg-body-secondary text-white d-flex align-items-center">
					<div class="container-fluid px-vw-5">
						<!-- 사진 밑에부분 효과(현재 설정없앰) -->
						<div class="position-absolute w-100 h-50 bg-body-secondary bottom-0 start-0"></div>
						<!-- 사진 -->
						<div class="row d-flex align-items-center position-relative justify-content-center px-0 g-5">
							<div class="col-12 col-lg-6">
								<img src="${contextPath}/resources/images/landing/abstract18.jpg" width="2280" height="1732" alt="PC사진" 
										class="img-fluid position-relative rounded-5 shadow" data-aos="fade-up">
							</div>
							<div class="col-12 col-md-6 col-lg-3">
								<img src="${contextPath}/resources/images/landing/abstract6.jpg" width="1116" height="1578" alt="태블릿사진" 
										class="img-fluid position-relative rounded-5 shadow" data-aos="fade-up" data-aos-duration="2000">
							</div>
							<div class="col-12 col-md-6 col-lg-3">
								<img src="${contextPath}/resources/images/landing/abstract9.jpg" width="1116" height="848" alt="모바일사진" 
										class="img-fluid position-relative rounded-5 shadow" data-aos="fade-up" data-aos-duration="3000">
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
	           			<h4>Turtle과 함께 업무 효율성을 높여보세요</h4>

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