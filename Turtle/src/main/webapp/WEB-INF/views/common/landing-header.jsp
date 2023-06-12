<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<header id="header-landing-box">

    <section id="header-box">
    
    	<!-- 테스트로그인용 나중에 삭제할거임 -->
    	<section>
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
        	<form action="member/testLogin" method="POST">
        		<input type="hidden" name="memberEmail" value="deokk91@gmail.com">
        		<input type="hidden" name="memberPw" value="deokkeun!">
        		<button>emailTest</button>
        	</form>
    	</section>
    	
    	<!-- 네이버아이콘  -->
        <section>
            <a href="${contextPath}"><img src="${contextPath}/resources/images/auth/naver-login-icon.png" alt="logo" height="55px"></a>
        </section>
		
		<!-- 로그인/회원가입 박스  -->
	    <section>
			<section id="login-box">
				<button id="login-modal-btn">
<!-- 					<div><img style="width: 40px;" src="${contextPath}/resources/images/memberProfile/member.png" alt="로그인"></div> -->
					<div><img src="${contextPath}/resources/images/lock.png" alt="로그인" style="width:20px; height:20px"></div>
					<div>Login</div>
				</button>
				
				<form action="${contextPath}/member/signUp" method="GET">
					<button id="header-signUp-btn">
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


	 <c:if test="${!empty loginMember}">
  		    <div>로그인시(멤버정보)</div>
        <div>회원번호 : ${loginMember.memberNo}</div>
        <div>회원명 : ${loginMember.memberName}</div>
        <div>프로필 이미지 : ${loginMember.profileImage}</div>
        <div>회원 이메일 : ${loginMember.memberEmail}</div>
        <div>회원 가입일 : ${loginMember.enrollDate}</div>
  	</c:if>
  	<c:if test="${empty loginMember}">
  		<div>empty loginMember</div>
  	</c:if> 


<!-- 로그인 모달창 -->
<section id="login-modal">
	<!-- 구글 로그인 -->
	<div id="g_id_onload"
	data-client_id="713601013116-33sqneo96i1er8o2e6bs5a8o5522k2rq.apps.googleusercontent.com"
	data-context="signup"
	data-ux_mode="popup"
	data-login_uri="http://localhost:8080/login/oauth2/google"
	data-nonce=""
	data-itp_support="true">
  </div>
  
  <div class="g_id_signin"
	  data-type="standard"
	  data-shape="rectangular"
	  data-theme="outline"
	  data-text="signin_with"
	  data-size="large"
	  data-logo_alignment="left"
	  data-locale="en">
  </div>
	<!-- <button id="google-btn" onclick="location.href='https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id=584967116999-s1skvhb03k99ueq3l69rhnbbrjc6c5bm.apps.googleusercontent.com&scope=openid%20email&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fwww%2Fmember%2Flogin&state=security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2-login-demo.example.com%2FmyHome&login_hint=jsmith@example.com&nonce=0394852-3190485-2490358&hd=gmail.com'">
		<img width="20" src="${contextPath}/resources/images/auth/google-login-custom.png" alt="Google Login"/><div id="google-btn-name">Continue with Google</div>
	</button> -->
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