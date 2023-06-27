<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="memberName" value="${loginMember.memberName}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src="https://kit.fontawesome.com/0041fb1dcb.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
    <title>채팅방</title>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/chat-style.css">
</head>
<body>
	채팅방 테스트
		<!-- 채팅입력 날짜와 이전채팅의 날짜가 다른경우 날짜를 보여주는 div 추가 -->
		<!-- 이전 채팅과 현재 입력채팅의 입력시간이 다를 경우 시간 출력((AM || PM)시,분) ,이미지,이름과 같이 출력-->
		<!-- 채팅입력한 멤버와 로그인멤버가 다를 경우 프로필 이미지하고 같이 출력, 같을경우는 채팅내용과 시간만 출력 -->
	<div class="chatting-area">
		<div id="back-area">
			<button class="btn btn-outline-danger" id="back-btn">나가기</button>
		</div>
		<input type="hidden" name="mName" value="${loginMember.memberName}">
		
		<ul class="display-chatting">
			<c:set var="previousMemberName" value="${chatMessage.memberName}" />
				
			<c:forEach var="chatMessage" items="${chatMessageList}" varStatus="vs">
				<fmt:formatDate var="chatDate" value="${chatMessage.cmRegDate}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="chatDate2" value="${chatMessage.cmRegDate}" pattern="HH:mm"/>
				<fmt:formatDate  var="chatDate3" value="${chatMessage.cmRegDate}" pattern="HH"/>
				<c:choose>

			
				
					<c:when test="${chatMessage.memberName ne memberName}">
						<li class="yourChat">
							<div class="chat-user">
								<c:if test="${chatDate ne previousDate}"> 
								
									<div class="chatCalender"><i class="fa-regular fa-calendar-days">	<span>${chatDate}</span></i></div>
							
					
								</c:if>
								<a class="user-img"><i class='fa-solid fa-circle-user'></i></a>
								<b>${chatMessage.memberName}님</b>
								
							</div>
								<p class="chat">${chatMessage.chatMessage}</p>
										
								<span class="chatDate">
								

									<span><c:if test="${chatDate3 >= 12}">오후</c:if>
										<c:if test="${chatDate3 < 12}">오전</c:if>
									</span>
									${chatDate2}					
									
								</span>	
						</li>
					</c:when>
					<c:otherwise>
						<li id="myChat">
							<c:if test="${chatDate ne previousDate}"> 
								
								<div class="chatCalender"><i class="fa-regular fa-calendar-days">	<span>${chatDate}</span></i></div>
							
					
							</c:if>
							<br>

							
							
							<span class="chatDate">
							

								<span><c:if test="${chatDate3 >= 12}">오후</c:if>
									<c:if test="${chatDate3 < 12}">오전</c:if>
								</span>
								${chatDate2}					
								
							</span>	
							<p class="chat">${chatMessage.chatMessage}</p>
						</li>
					</c:otherwise>
				</c:choose>
				<c:set var="previousMemberName" value="${chatMessage.memberName}" />
				<c:set var="previousDate" value="${chatMessage.cmRegDate}" />
			</c:forEach>
		</ul>
		
		<div class="input-area">
			<textarea id="inputChatting" rows="3"></textarea>
			<script src="https://cdn.jsdelivr.net/npm/@joeattardi/emoji-button@3.0.3/dist/index.min.js"></script>
			<button id="emoji_btn"><i class="fa-regular fa-face-smile"></i></button>
		

			<button id="send"><i class="fa-regular fa-paper-plane"></i></button>
		</div>
		<input type="hidden" name="date" value="${chatDate}">
	</div>
	

	
	<!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
		
		const pmNo = "${pmNo}";
		const chatRoomNo = "${chatRoomNo}";
		const contextPath = "${contextPath}";
		let memberName = '${memberName}';
		
		console.log(memberName);

		let previousMemberName = '${previousMemberName}';

		// 로그인이 되어 있을 경우에만
		// /chat 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		const chattingSock = new SockJS(contextPath+"/chat");
			// -> websocket 프로토콜을 이용해서 해당 주소로 데이터를 송/수신 할 수 있다.


		/*  WebSocket
		
		- 브라우저와 웹 서버간의 전이중 통신을 지원하는 프로토콜

		* 전이중 통신(Full Duplex) : 두대의 단말기가 데이터를 동시에 송/수신 하기 위해
		  각각 독립된 회선을 사용하는 통신 방식(ex. 전화 )

		- HTML5 부터 지원
		- Java 7 부터 지원 (8 버전 이상 사용 권장)
		- Spring Framework 4 이상 부터 지원
		*/


	</script>
	<script src='${contextPath}/resources/js/chat.js'></script>
	<script src="${contextPath}/resources/js/bootstrapjs/rightsidebar.js"></script>
	<script>
		// 페이지 로딩 완료 시 채팅창을 제일 밑으로 내리기





	</script>
</body>
</html>