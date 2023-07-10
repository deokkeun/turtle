<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

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
					<c:choose>
						<c:when test="${projectNo != 0}">
							<li><a href="${contextPath}/project/${projectNo}" class="nav-btn">프로젝트 이동</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${contextPath}/project/createProject" class="nav-btn">프로젝트 생성</a></li>
						</c:otherwise>
					</c:choose>
					
				</c:if>	
			</ul>
			<!--  로그인 상태일 때 특정 js 작동 안하게 하는 코드(화면에서 안보임)-->
			<script>
				// 로그인버튼 이메일 포커스 js 
				<c:if test="${empty loginMember}">
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

	<div id="naver_id_login" title="네이버 아이디로 로그인"> </div>

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
		<a href="${contextPath}/member/findPassword">비밀번호 찾기</a>
		<br><br>
		<span class="question">회원이 아니신가요? </span><a href="${contextPath}/member/signUp"> 회원가입</a>
	</p>
	
	<a class="login-modal-close fa-solid fa-xmark"></a>
</section>

	<script>
		var naver_id_login = new naver_id_login("aQpBvST4iYdjSLDbWXWl", "http://3.36.176.197:8080/www-1.0.0-BUILD-SNAPSHOT/member/callback");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 3,45);
		naver_id_login.setDomain("http://3.36.176.197:8080/www-1.0.0-BUILD-SNAPSHOT");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>


