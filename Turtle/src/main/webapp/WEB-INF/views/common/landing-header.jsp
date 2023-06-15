<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!-- ======= 최종작업용 Header ======= -->
  <header id="header" class="header fixed-top">
    <div id="allnav" class="container-fluid container">
      <nav id="navbar" class="navbar container-fluid">
      
      
		 <!-- 로고그림 및 이름 -->	
        <a href="${contextPath}" class="logo d-flex">
          <img src="${contextPath}/resources/images/logo/turtleLogo-green.png" alt="로고안보임">
          <span>TURTLE</span>
        </a>

        
		<!-- 메뉴 -->
        <ul class="nav-links">
          <li><a href="${contextPath}">소개</a></li>
          <li><a href="${contextPath}/etc/fee">요금제</a></li>
          <li><a href="${contextPath}/etc/faq">고객센터</a></li>
        </ul>
          
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
        	<form action="member/testLogin" method="POST">
        		<input type="hidden" name="memberEmail" value="deokk91@gmail.com">
        		<input type="hidden" name="memberPw" value="deokkeun!">
        		<button>emailTest</button>
        	</form>
    	</div>



		<%-- if - else --%>
   <%--      <c:choose>  
       		로그인이 되어있지 않은 경우
			<c:when test="${ empty sessionScope.loginMember }"> 
            		
       			<form action="member/login" method="POST" name="login-form" onsubmit="return loginValidate()">
		                 
            		
           	</c:when>
            	
            	 --%>
            <%-- 로그인이 되어있는 경우 --%>
            <%-- <c:otherwise> --%>
            			
	            <!-- 로그아웃 + 프로젝트 글씨 -->                                       
	          <%--   <div class="my-info">
	               <div>
	                   <a href="${contextPath}/member/myPage/info" id="nickname">${loginMember.memberNickname}</a>
	
	                   <a href="${contextPath}/member/logout" id="logout-btn">로그아웃</a>
	               </div>
	
	               <p>
	                   ${loginMember.memberEmail}
	               </p>
	            </div>
            			
            		
           	</c:otherwise>
        </c:choose> --%>
		
		
        <ul class="nav-links2">
          <li>           
          	<div id="login-box">
          		<a id="login-modal-btn">로그인</a>
          	</div>
          </li>
          
          
         
          <li><a href="${contextPath}/member/signUp" class="nav-btn">무료로 사용하기</a></li> 
        </ul>
      
        <!-- 반응형시 보이는 햄버거버튼 -->
        <a href="#" class="bar">
          <i class="fa-solid fa-bars"></i>
        </a>
      </nav>
    </div>
  </header>
 <!-- ======= End Header ======= -->

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