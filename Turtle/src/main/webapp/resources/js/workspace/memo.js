//---------------------------------------공용 메모 공간---------------------------------------

// 메모 메세지 테스트
const workspaceMemoDetails = document.querySelectorAll('.workspaceMemoDetail');

let memoContent;
let memoBgColor;
let memoNo;
let ChangedMemoContent;

// 메모 색상
const colors = ['#FEE182', '#F6A9B0', '#A1D5AE', '#9FDFEB', '#D8BBDC'];

// 각각의 memoContent 접근
workspaceMemoDetails.forEach((workspaceMemoDetail) => {

	let memoContent = workspaceMemoDetail.querySelector('.memoContent');
	let memoBgColor = workspaceMemoDetail.querySelector('.memoBgColor');
	let memoNo =  workspaceMemoDetail.querySelector('.memoNo');

	// 딜레이 2초 설정
	let typingTimer;
  	const delay = 1500; // 1.5초
	
	let isFocused = false;
	let isFirstClick = true;
	let currentColor = ''; 	

	memoContent.addEventListener('focus', function() {

		isFocused = true;
	});

	memoContent.addEventListener('blur', function() { 	

    	isFocused = false;
    	isFirstClick = true;
    	memoBgColor.value = currentColor;
  	});

  	memoContent.addEventListener('click', function(memoContent) {

    	if (isFocused) {
      		if (isFirstClick) {
		        currentColor = this.style.backgroundColor;
		        isFirstClick = false;
		        memoBgColor.value = currentColor;
      		} else {
		        const currentIndex = colors.indexOf(currentColor);
		        const nextIndex = (currentIndex + 1) % colors.length;
		        const nextColor = colors[nextIndex];
		        this.style.backgroundColor = nextColor;
		        currentColor = nextColor;
		        memoBgColor.value = currentColor;
		        
		        clearTimeout(typingTimer);
  		
		  		typingTimer = setTimeout(function() {
		  			// 1.5초동안 아무런 동작이 없으면 로직 실행  			
		  			
		  			changeColor(memoContent);

					

					
		  			
		  		}, delay);
				
				
				
			}
    	}
		
		
    	
  	});
  	
  	memoContent.addEventListener('input', function() {
		
  		clearTimeout(typingTimer);
  		
  		
  	});
  	
  	memoContent.addEventListener('keyup', function() {
  		clearTimeout(typingTimer);
  		
  		typingTimer = setTimeout(function() {
  			// 1.5초동안 아무런 동작이 없으면 로직 실행
  			
  		updateMemo();
  			
  		}, delay);
  		
  	});
  	
  	//메모 보내기 함수
	function updateMemo() {
		console.log(memoContent);	
			let memo = {
				"workspaceNo" : workspaceNo,
				"updatePmNo" : pmNo,
				"memoContent" : memoContent.innerHTML,
				"memoBgColor" : memoBgColor.value,
				"memoNo" : memoNo.value
			};
			
			
			// JSON.parse(문자열) : JSON -> JS Object
			// JSON.stringify(객체) :  JS Object -> JSON
			console.log(memo);
			console.log(JSON.stringify(memo));
			
			// memoSock(웹소켓 객체)을 이용하여 메세지 보내기
			// memoSock.send(값) : 웹소켓 핸들러로 값을 보냄
			memoSock.send( JSON.stringify(memo) );
			
	}
	
	function changeColor() {

		let memo = {
			"workspaceNo" : workspaceNo,
			"memoBgColor" : memoBgColor.value,
			"memoNo" : memoNo.value
		};


		// JSON.parse(문자열) : JSON -> JS Object
		// JSON.stringify(객체) :  JS Object -> JSON
		console.log(memo);
		console.log(JSON.stringify(memo));
		
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
						
						

						

						memoContent.style.backgroundColor = memo.memobgColor;
						console.log(memoContent);
						
					}; 
	 	
});


//---------------------------------------개인 메모 공간---------------------------------------
const personalMemoDetails = document.querySelectorAll('.personalMemoDetail');


// 각각의 memoContent 접근
personalMemoDetails.forEach((personalMemoDetail) => {

	let memoContent = personalMemoDetail.querySelector('.memoContent');
	let memoBgColor = personalMemoDetail.querySelector('.memoBgColor');
	let memoNo =  personalMemoDetail.querySelector('.memoNo');

	// 딜레이 2초 설정
	let typingTimer;
  	const delay = 1500; // 1.5초
	
	let isFocused = false;
	let isFirstClick = true;
	let currentColor = ''; 	

	memoContent.addEventListener('focus', function() {

		isFocused = true;
	});

	memoContent.addEventListener('blur', function() { 	

    	isFocused = false;
    	isFirstClick = true;
    	memoBgColor.value = currentColor;
  	});

  	memoContent.addEventListener('click', function() {

    	if (isFocused) {
      		if (isFirstClick) {
		        currentColor = this.style.backgroundColor;
		        isFirstClick = false;
		        memoBgColor.value = currentColor;
      		} else {
		        const currentIndex = colors.indexOf(currentColor);
		        const nextIndex = (currentIndex + 1) % colors.length;
		        const nextColor = colors[nextIndex];
		        this.style.backgroundColor = nextColor;
		        currentColor = nextColor;
		        memoBgColor.value = currentColor;
		        
		        clearTimeout(typingTimer);
  		
		  		typingTimer = setTimeout(function() {
		  			// 1.5초동안 아무런 동작이 없으면 로직 실행  			
		  			
		  			changePersonalMemoColor();

					

					
		  			
		  		}, delay);
				
				
				
			}
    	}
		
		
    	
  	});
  	
  	memoContent.addEventListener('input', function() {
		
  		clearTimeout(typingTimer);
  		
  		
  	});
  	
  	memoContent.addEventListener('keyup', function() {
  		clearTimeout(typingTimer);
  		
  		typingTimer = setTimeout(function() {
  			// 1.5초동안 아무런 동작이 없으면 로직 실행
  			
  		updatePersonalMemo();
  			
  		}, delay);
  		
  	});
  	
  	//메모 보내기 함수
	function updatePersonalMemo() {
		
		// memo에 정보담기
		let memo = {
			"workspaceNo" : workspaceNo,
			"updatePmNo" : pmNo,
			"memoContent" : memoContent.innerHTML,
			"memoBgColor" : memoBgColor.value,
			"memoNo" : memoNo.value
		};
		
		JSON.stringify(memo);
		console.log(memo);
			
		// ajax 코드 작성
		$.ajax({
			url : contextPath +"/workspace/memo/updateMemo",
			data : {"memo" : memo},
			type : "get",

			dataType : "JSON",

			success : function(result) {
				if(result == 1) {
					console.log("메모 수정 성공!" + memo)
				} else{console.log("몰라")}
				
			},
			error : function(request, status, error){
				console.log("AJAX 에러 발생");
				console.log("상태코드 : " + request.status); // 404, 500
			}

		});
			
	}
	
	function changePersonalMemoColor() {
		
		let memo = {
			"workspaceNo" : workspaceNo,
			"memoBgColor" : memoBgColor.value,
			"memoNo" : memoNo.value
		};

		console.log(memo);

		// ajax 코드 작성
		$.ajax({
			url : contextPath +"/workspace/memo/updateMemo",
			data : {"memo" : memo},
			type : "get",

			dataType : "JSON",

			success : function(result) {
				if(result == 1) {
					console.log("색상 수정 성공!" + memo);
				} else{console.log("몰라")}
				
			},
			error : function(request, status, error){
				console.log("AJAX 에러 발생");
				console.log("상태코드 : " + request.status); // 404, 500
			}

		});
		
	}

});
