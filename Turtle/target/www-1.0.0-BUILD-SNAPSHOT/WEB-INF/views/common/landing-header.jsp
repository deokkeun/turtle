<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<header id="header-landing-box">

    <section id="header-box">
    
        <section>
            <a href="${contextPath}"><img src="${contextPath}/resources/images/auth/naver-login-icon.png" alt="logo" height="55px"></a>
        </section>

	    <section>
			<section id="login-box">
				<button id="login-modal-btn">
					<div><img src="${contextPath}/resources/image/common/login.png" alt="로그인"></div>
					<div>Login</div>
				</button>
				<form action="${contextPath}/member/signUp" method="GET">
					<button id="signUp-btn">
						<div>Sign up for free</div>
					</button>
				</form>
			</section>
	    </section>
    </section>
</header>


<form action="${contextPath}/member/login" method="GET">
	<button style="width: 150px; height: 50px; background-color: orangered;">
		main페이지 바로가기(landing-header.jsp)</button>
</form>


<!-- 로그인 모달창 -->
<section id="login-modal">
	<div class="login-modal-logo"><img src="${contextPath}/resources/images/auth/naver-login-icon.png" alt="logo" height="100px"></div>
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
	</p>
	<div class="text-center">
		<a href="#"><img width="40" src="${contextPath}/resources/images/auth/naver-login-icon.png" alt="Naver Login" /></a>
		<a href="https://accounts.google.com/o/oauth2/v2/auth?
 scope=https%3A//www.googleapis.com/auth/drive.metadata.readonly&
 access_type=offline&
 include_granted_scopes=true&
 response_type=code&
 state=security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2-login-demo.example.com%2FmyHome&
 redirect_uri=http://localhost:8080/www/member/login&
 client_id=584967116999-s1skvhb03k99ueq3l69rhnbbrjc6c5bm.apps.googleusercontent.com"><img width="40" src="${contextPath}/resources/images/auth/google-login-icon.svg" alt="Google Login" /></a>
	</div>	
	<a class="login-modal-close fa-solid fa-xmark"></a>
</section>

