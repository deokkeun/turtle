//메모 메세지 업데이트

const memoDetails = document.querySelectorAll(".memoDetail");
const memoContents = document.querySelectorAll(".memoContent");
const memoDivs = document.querySelectorAll('.memoContent');

for (let i = 0; i < memoDivs.length; i++) {
  const div = memoDivs[i];
  const maxContentHeight = 200; // 최대 높이 설정 (200px)

  div.addEventListener('input', function() {
    while (this.scrollHeight > maxContentHeight) {
      const endIndex = this.textContent.length - 1;
      this.textContent = this.textContent.substring(0, endIndex);
    }
    
    // 텍스트가 영역을 초과할 경우에만 '...'을 추가
    if (this.scrollHeight > this.offsetHeight) {
      this.classList.add('ellipsis'); // 'ellipsis' 클래스 추가
    } else {
      this.classList.remove('ellipsis'); // 'ellipsis' 클래스 제거
    }
  });
}

// 메모 색상
const colors = ['#FEE182', '#F6A9B0', '#A1D5AE', '#9FDFEB', '#D8BBDC'];

memoContents.forEach((memoContent) => {
	const pmNo = memoContent.dataset.pmno;
	const memoNo = memoContent.dataset.memono;
	let memoBgColor = memoContent.dataset.memobgcolor;
	const memoType = memoContent.dataset.memotype;

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
    	memoBgColor = currentColor;
  	});

	memoContent.addEventListener('click', function(memoContent) {

    	if (isFocused) {
      		if (isFirstClick) {
		        currentColor = this.style.backgroundColor;
		        isFirstClick = false;
		        memoBgColor = currentColor;
      		} else {
		        const currentIndex = colors.indexOf(currentColor);
		        const nextIndex = (currentIndex + 1) % colors.length;
		        const nextColor = colors[nextIndex];
		        this.style.backgroundColor = nextColor;
		        currentColor = nextColor;
		        memoBgColor = currentColor;
		        
		        clearTimeout(typingTimer);
  		
				const div = this;
      			const text = div.textContent.trim(); // 공백 문자 제거
      			memoContent.innerHTML = text; // 수정된 텍스트로 업데이트

		  		typingTimer = setTimeout(function() {

		  			// 1.5초동안 아무런 동작이 없으면 로직 실행					  			
		  			updateMemo();		  			
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
		if(memoType == "workspace") {
			let memo = {
				"workspaceNo" : workspaceNo,
				"pmNo" : pmNo,
				"memoContent" : memoContent.innerHTML,
				"memoBgColor" : memoBgColor,
				"memoNo" : memoNo
			};

			// JSON.parse(문자열) : JSON -> JS Object
			// JSON.stringify(객체) :  JS Object -> JSON
			console.log(memo);
			console.log(JSON.stringify(memo));
		
			// memoSock(웹소켓 객체)을 이용하여 메세지 보내기
			// memoSock.send(값) : 웹소켓 핸들러로 값을 보냄
			memoSock.send( JSON.stringify(memo) );
		} else if(memoType == "personal") {
			// ajax 코드 작성
			$.ajax({
				url : contextPath +"/workspace/memo/updateMemo",
				data : {"workspaceNo" : workspaceNo,
						"pmNo" : pmNo,
						"memoContent" : memoContent.innerHTML,
						"memoBgColor" : memoBgColor,
						"memoNo" : memoNo
				},
				type : "get",

				dataType : "JSON",

				success : function(result) {
					if(result == 1) {
						location.reload();
					} else{console.log("업로드 실패")}
					
				},
				error : function(request, status, error){
					console.log("AJAX 에러 발생");
					console.log("상태코드 : " + request.status); // 404, 500
				}
			});
		}					
	}

	
});

// 웹소켓 핸들러에서
	// s.sendMessage( new TextMessage(message.getPayload()) );
	// 구문이 수행되어 메세지가 전달된 경우

	memoSock.onmessage = function(e){
		// 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
		// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

		// 전달 받은 메세지를 JS 객체로 변환
		const memo = JSON.parse(e.data);  // JSON -> JS Object
		/*
		memoContents.forEach((memoContent) => {
			if(memo.memoNo == memoContent.dataset.memono) {

				memoContent.innerHTML = memo.memoContent;
				memoContent.style.backgroundColor = memo.memoBgColor;

				
			}
		});
		*/
		memoDetails.forEach((memoDetail) => {
			changedMemoContent = memoDetail.querySelector(".memoContent");

			if(memo.memoNo == changedMemoContent.dataset.memono) {
				changedMemoContent.innerHTML = memo.memoContent;
				changedMemoContent.style.backgroundColor = memo.memoBgColor;

				const memoUpdateDate = memoDetail.querySelector(".memoUpdateDate");
				const changedMemberName = memoDetail.querySelector(".pmNo");

				memoUpdateDate.innerText = "최근 수정일 : " + currentTime();
				changedMemberName.innerText = `최근 수정자 : ${memberName}`;
				//memoDetail.querySelector(".memoUpdateDate").innerHTML = "최근 수정일 : " + memo.memoUpdateDate;
				//memoDetail.querySelector(".memoPmNo").innerHTML = "최근 수정자 : " + memberName;
			}

		})
};

function currentTime() {
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
	

	

  	
  	
  	
  	
  	
  	
  	
	
	
	

	 	


	