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
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
	<!-- myPageInfo.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body>
    <main id="main" class="main">
 		<!-- header include -->
       	<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<section id="myPage-box">
			<section id="profile-box">
				<form action="profile" method="POST" name="myPage-form"
						enctype="multipart/form-data" onsubmit="return profileValidate()">
					<div id="myPage-title">개인 정보</div>
					<div class="profile-image-area">
						<c:if test="${empty loginMember.profileImage}">
							<img src="${contextPath}/resources/images/memberProfile/member.png" alt="profile-image" id="profile-image">
						</c:if>
		
						<c:if test="${!empty loginMember.profileImage}">
							<img src="${contextPath}${loginMember.profileImage}" alt="profile-image" id="profile-image">
						</c:if>
						<!-- camera-icon -->
						<img src="${contextPath}/resources/images/member/camera.svg" alt="camera" id="camera">
					</div>
					
		
					<!-- 프로필 모달창 -->
					<section id="profile-modal">
						<div class="profile-image-area">
							<c:if test="${empty loginMember.profileImage}">
								<img src="${contextPath}/resources/images/memberProfile/member.png" alt="profile-image" id="profile-image-modal">
							</c:if>
			
							<c:if test="${!empty loginMember.profileImage}">
								<img src="${contextPath}${loginMember.profileImage}" alt="profile-image" id="profile-image-modal">
							</c:if>
						</div>

						<div class="profile-btn-area">
							<input type="file" name="uploadImage" id="input-image" accept="image/*">
							<label for="input-image">
								<div class="select-image">
									이미지 선택
								</div>
							</label>
							<button type="submit" id="changes-save">변경사항 저장</button>
						</div>
						
						<div>
							<input type="button" id="delete-image">
							<label for="delete-image" id="delete-btn">
								<img src="${contextPath}/resources/images/member/dash-circle.svg" alt="">
							</label>
						</div>
						<!-- 삭제버튼 안눌러짐(0), 눌러짐(1)  -->
						<input type="hidden" name="delete" id="delete" value="0">
			

						<!-- 프로필 모달 닫기 -->
						<a class="profile-modal-close fa-solid fa-xmark"></a>
					</section>
				</form>
			</section>



			<!-- 회원 정보 -->
			<section id="member-info">
				<section>
					<div id="member-info-title">
						기본 정보
					</div>
					<div class="member-info-main-title">
						일부 정보가 Turtle 서비스를 사용하는 다른사람에게 표시될 수 있습니다.
					</div>
				</section>
				<section>
					<div class="member-info-title">
						이름
					</div>
					<div>
						${loginMember.memberName}
					</div>
				</section>
				<section>
					<div class="member-info-title">
						이메일
					</div>
					<div>
						${loginMember.memberEmail}
					</div>
				</section>
				<section>
					<div class="member-info-title">
						비밀번호
					</div>
					<button type="button" id="changePw-btn">비밀번호 변경</button>
				</section>
					<form action="../myPage/deleteAccount" method="GET">
						<button class="deleteAccount-btn">Turtle 계정 삭제</button>
					</form>
			</section>
	






			<!-- 비밀번호 변경 모달창 -->
			<section id="changePw-modal">
				<section id="changePw-modal-box">
					
					<form action="../myPage/changePw" method="POST" onsubmit="return currentPwValidate()">
						<div id="changePw-modal-top">
							<div>TURTLE</div>
							<div>${loginMember.memberName}</div>
							<div>${loginMember.memberEmail}</div>
							<div>비밀번호를 변경하려면 본인임을 인증하세요.</div>
						</div>
						<fieldset id="currentPw-box">
							<div class="currentPw-value">비밀번호 입력</div>
							<input type="password" name="currentPw" class="currentPw" autocomplete="false">
						</fieldset>
						<span id="currentPwMessage"></span>
						<div class="flex-left">
							<input type="checkbox" id="showPw"><pre> </pre><label for="showPw">비밀번호 표시</label>
							<input type="hidden" id="showPw-value" value="0">
						</div>
						<div class="next-box">
							<a href="../findPassword" class="findPassword">비밀번호 찾기</a><button class="next">다음</button>
						</div>
					</form>
				</section>
				<!-- 비밀번호 변경 모달 닫기 -->
				<a class="changePw-modal-close fa-solid fa-xmark"></a>
			</section>
			
		
		</section>


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
    <!-- myPage.js 연결 -->
    <script src="${contextPath}/resources/js/member/myPage.js"></script>
</body>
</html>