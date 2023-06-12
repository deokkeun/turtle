const memoContentDivs = document.querySelectorAll('.memoContent');
const memoDetailDivs = document.querySelectorAll('.memoDetail');

// 메모 메세지 테스트



for(let i = 0; i < memoDetailDivs.length; i++) {
	
	const memoDetailDiv = memoDetailDivs[i];
	
	document.querySelector(".test").addEventListener("click", updateMemo);
	
	//메모 보내기 함수
	function updateMemo() {
				
			let memo = {
				"workspaceNo" : workspaceNo,
				"updatePmNo" : pmNo,
				"memoContent" : memoDetailDiv.querySelector(".memoContent").innerHTML,
				"memoBgColor" : memoDetailDiv.querySelector(".memoBgColor").value,
				"memoNo" : memoDetailDiv.querySelector(".memoNo").value
			};
			
			
			// JSON.parse(문자열) : JSON -> JS Object
			// JSON.stringify(객체) :  JS Object -> JSON
			console.log(memo);
			console.log(JSON.stringify(memo));
			
			// chattingSock(웹소켓 객체)을 이용하여 메세지 보내기
			// chattingSock.send(값) : 웹소켓 핸들러로 값을 보냄
			memoSock.send( JSON.stringify(memo) );
					
	}
	
	// 웹소켓 핸들러에서
	// s.sendMessage( new TextMessage(message.getPayload()) );
	// 구문이 수행되어 메세지가 전달된 경우
	
	memoSock.onmessage = function(e){
		// 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
		// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)
	
		// 전달 받은 메세지를 JS 객체로 변환
		const memo = JSON.parse(e.data);  // JSON -> JS Object
		
		memoDetailDiv.querySelector(".memoUpdateDate").innerHTML = "테스트";

		console.log(memoUpdateDate);
		
	}
	
	
}
