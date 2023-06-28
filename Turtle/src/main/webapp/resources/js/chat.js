// 페이지 로딩 완료 시 채팅창을 제일 밑으로 내리기
(function(){

	const display = document.getElementsByClassName("display-chatting")[0];
	
	if(display != null){
		display.scrollTop = display.scrollHeight;
	}

})();


const send = document.getElementById("send");



//
$("#inputChatting").keyup(function(keyNum) {
	const inputChatting = document.getElementById("inputChatting"); 
	if(keyNum.keyCode == 13) {
		
		sendMessage();
		
	
		
	}
	


})


// 채팅 메세지 보내기
if(send != null) {
send.addEventListener("click", sendMessage);


// 채팅 보내기 함수
function sendMessage(){

	// 채팅이 입력되는 textarea
	const inputChatting = document.getElementById("inputChatting"); 

	if(inputChatting.value.trim().length == 0){
		// 입력이 되지 않은 경우
		alert("채팅을 입력해주세요.");
		
		inputChatting.value = ""; // 공백문자 삭제
		inputChatting.focus();

	} else{
		// 입력이 된 경우

		// 메세지 입력 시 필요한 데이터를 js객체로 생성
		const chatMessage = {
			"pmNo" : pmNo,
			"chatRoomNo" : chatRoomNo,
			"memberName" : memberName,
			"chatMessage" : inputChatting.value
			
		};


		// JSON.parse(문자열) : JSON -> JS Object
		// JSON.stringify(객체) :  JS Object -> JSON
		console.log(chatMessage);
		console.log(    JSON.stringify(chatMessage)   );

		// chattingSock(웹소켓 객체)을 이용하여 메세지 보내기
		// chattingSock.send(값) : 웹소켓 핸들러로 값을 보냄
		chattingSock.send( JSON.stringify(chatMessage) );

		inputChatting.value = ""; // 입력된 채팅 내용 삭제
	}
	
}
}

// 웹소켓 핸들러에서
// s.sendMessage( new TextMessage(message.getPayload()) );
// 구문이 수행되어 메세지가 전달된 경우
chattingSock.onmessage = function(e){
	// 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const chatMessage = JSON.parse(e.data);  // JSON -> JS Object
	console.log(chatMessage);
	console.log(chatMessage.memberName);
	console.log(previousMemberName);
	const mName = document.getElementsByName('mName')[0].value;
	const cDate = document.getElementsByName('date')[0].value;
	console.log(mName + "0");

	const li = document.createElement("li");

	const p = document.createElement("p");
	p.classList.add("chat");
	
					// 줄바꿈
	p.innerHTML = chatMessage.chatMessage.replace(/\\n/gm , "<br>" ) ; 
	// 내용


	const span = document.createElement("span");
	span.classList.add("chatDate");
	//span.innerText = chatMessage.createDate; // 날짜
	span.innerText = currentTime(); // 날짜
	const br = document.createElement("br"); // 개행

	

	if(mName != chatMessage.memberName) {
		
		if( cDate != currentTime2() ){
			
			li.innerHTML = "<div class='chatCalender'><i class='fa-regular fa-calendar-days'><span>"+currentTime2()+"</span></i></div>";
			li.innerHTML = "<div><a class='user-img'><i class='fa-solid fa-circle-user'></i></a><b>"+chatMessage.memberName+"님</b></div>";
			li.append(p,span);
			li.setAttribute('id','yourChat');
			location.reload();
			

		}else{
			li.setAttribute('id','yourChat');
			console.log(cDate);
			li.innerHTML = "<div><a class='user-img'><i class='fa-solid fa-circle-user'></i></a><b>"+chatMessage.memberName+"님</b></div>";
			li.append(p,span);
		}

	}else {
		if( cDate != currentTime2() ){
		

			li.innerHTML = "<div class='chatCalender'><i class='fa-regular fa-calendar-days'><span>"+currentTime2()+"</span></i></div>";
			li.append(span,p);
			li.setAttribute('id','myChat');
			location.reload();
	
		}else{
			console.log(cDate);
			li.setAttribute('id','myChat');
			li.append(span,p);
		}

	}
/*
	if( cDate != currentTime2() ){
		

		li.innerHTML = "<div class='chatCalender'><i class='fa-regular fa-calendar-days'><span>"+cDate+"</span></i></div>";
		li.append(span,p);
		li.setAttribute('id','myChat');

	}else if(chatMessage.memberName == previousMemberName){
		li.setAttribute('id','myChat');
		console.log(cDate);
		console.log(currentTime2());
		console.log(currentTime());
		

		
		li.append(span,p);
	}
*/

	previousMemberName = chatMessage.memberName;

	// 채팅창
	const display = document.getElementsByClassName("display-chatting")[0];

	// 채팅창에 채팅 추가
	display.append(li);
	
	// 채팅창 제일 밑으로 내리기
	display.scrollTop = display.scrollHeight;
	// scrollTop : 스크롤 이동
	// scrollHeight : 스크롤되는 요소의 전체 높이
	
	


// 현재 시간 출력 함수
// 2022년 07월 07일 14:47:22
function currentTime(){
	const now = new Date();

	var hh= now.getHours();
	var apm = hh > 12 ? "오후":"오전";

	const time = " " + addZero( apm )
				+ " "+ addZero(now.getHours() ) + ":" 
			   + addZero( now.getMinutes() ); 

	return time;
}

function currentTime2() {
	const now = new Date();
	
	const time = now.getFullYear()
				+ "-" + addZero(now.getMonth()+1)
				+ "-" + addZero(now.getDate());
	
	return time;


}

// 10보다 작을 경우 앞에 0을 붙이는 함수
function addZero(temp){
	return temp < 10 ? "0" + temp : temp;;
}
}



//뒤로가기
document.querySelector('#back-btn').onclick = function() {
  history.back();
}

//이모티콘
 let button2 = document.querySelector("#emoji_btn");
const picker = new EmojiButton({
  position: 'bottom-start'
});

button2.addEventListener('click', () => {
  picker.togglePicker(button2);
});

picker.on('emoji', emoji => {
  const text_box = document.querySelector('#inputChatting');
  text_box.value += emoji;
});

//입력중
