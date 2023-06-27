<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!-- ======= 최종작업용 Header ======= -->
<header id="header" class="header fixed-top">
    <div id="allnav" class="container">
      	<nav id="navbar" class="navbar container-fluid">

			
			<!-- 로고그림 및 이름 -->	
			<a href="${contextPath}" class="logo d-flex">
				<img src="${contextPath}/resources/images/logo/turtleLogo-green.png" alt="로고안보임">
				<span>TURTLE</span>
			</a>

			<!-- 메뉴 -->
			<ul class="nav-links">
				<li><a href="${contextPath}">소개</a></li>
				<li><a href="${contextPath}/etc/pricing">요금제</a></li>
				<li><a href="${contextPath}/etc/faq">고객센터</a></li>
			</ul>
          
			
			<!-- <ul class="nav-links2">		
				<li>          
					<div id="login-box">
						<a id="login-modal-btn">로그인</a>
					</div>
				</li>  
				<li><a href="/www/member/signUp" class="nav-btn">무료로 사용하기</a></li>	
			</ul> -->


	
			<ul class="nav-links2">
				<!-- 로그인이 안되었을 경우 (비로그인 상태)  -->
				<c:if test="${empty loginMember}">
					<li>          
						<div id="login-box">
							<a id="login-modal-btn">로그인</a>
						</div>
					</li>  
					<li><a href="${contextPath}/member/signUp" class="nav-btn">무료사용</a></li> 
				</c:if>
				<!-- 로그인이 되었을 경우 (로그인 상태)  -->
				<c:if test="${!empty loginMember}">
					<li>
						<div id="login-box">
							<a href="${contextPath}/member/logout" id="login-modal-btn">로그아웃</a>
						</div>
					</li>
					<li><a href="${contextPath}/project/createProject" class="nav-btn">프로젝트</a></li>
				</c:if>	
			</ul>
 
			<!--  로그인 상태일 때 특정 js 작동 안하게 하는 코드(화면에서 안보임)-->
			<script>
				<c:if test="${empty loginMember}">
					// 로그인버튼 이메일 포커스 js 
					window.onload = function() {
						document.getElementById("login-modal-btn").addEventListener("click", function() {
							const memberEmail = document.getElementsByName("memberEmail");
							memberEmail[0].focus();
						});
						//모달창 띄우는 js
						document.querySelector("#login-modal-btn").addEventListener("click", function() {
							modal("login-modal");
						});
					};
				</c:if>  
			</script>
      
        	<!-- 반응형시 보이는 햄버거버튼 -->
        	<a href="#" class="bar"><i class="fa-solid fa-bars"></i></a>
        
      	</nav>
    </div>
    
   

</header>
 <!-- ======= End Header ======= -->

<!-- 로그인 모달창 -->
<section id="login-modal">
	<!-- 구글 로그인 -->
	<div id="g_id_onload"
	     data-client_id="713601013116-33sqneo96i1er8o2e6bs5a8o5522k2rq.apps.googleusercontent.com"
	     data-context="signin"
	     data-ux_mode="popup"
	     data-login_uri="http://localhost:8080/www/member/login"
	     data-auto_prompt="false">
	</div>
	
	<div class="g_id_signin"
	     data-type="standard"
	     data-shape="rectangular"
	     data-theme="outline"
	     data-text="signin_with"
	     data-size="large"
	     data-locale="en-US"
	     data-logo_alignment="center"
	     data-width="300">
	</div>
	
	<div class="login-divider">or</div>
	<form action="${contextPath}/member/login" method="POST" onsubmit="return loginValidate()">
		<div>
			<input type="text" name="memberEmail" class="login-modal-input" placeholder="아이디(이메일)" autocomplete="off" value="${cookie.saveId.value}">
		</div>
		<div>
			<input type="password" name="memberPw" class="login-modal-input" placeholder="비밀번호" autocomplete="off" >
		</div>
		
		<c:if test="${!empty cookie.saveId.value}">
			<c:set var="chk" value="checked"/>
		</c:if>

		<label id="save-id-box">
			<input type="checkbox" name="saveId" ${chk} id="saveId"><div>아이디 저장</div>
		</label>
		<div>
			<button type="submit" class="sign-in-btn">로그인</button>
		</div>

	</form>
	<p id="login-modal-find-box">
		<a href="${contextPath}/member/findAccount">아이디 찾기</a><span class="more-action-divider"></span><a href="${contextPath}/member/findPassword">비밀번호 찾기</a>
		<br><br>
		<span class="question">회원이 아니신가요? </span><a href="${contextPath}/member/signUp"> 회원가입</a>
	</p>
	
	<a class="login-modal-close fa-solid fa-xmark"></a>
</section>

<script src="https://accounts.google.com/gsi/client" async defer></script>


