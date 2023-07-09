//메모 메세지 업데이트
const memoDetails = document.querySelectorAll(".memoDetail");
const memoContents = document.querySelectorAll(".memoContent");
const memoDivs = document.querySelectorAll('.memoContent');
const memoInfos = document.querySelectorAll('.memoInfo');

for (let i = 0; i < memoDivs.length; i++) {
  const div = memoDivs[i];
  const maxContentHeight = 300; // 최대 높이 설정 (200px)

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

// 메모 색상 동기화
const colors = ['#FEE182', '#F6A9B0', '#A1D5AE', '#9FDFEB', '#D8BBDC'];

memoDetails.forEach((memoDetail) => {

	const memoContent = memoDetail.querySelector(".memoContent");
	const memoInfo = memoDetail.querySelector(".memoInfo");

	const pmNo = memoContent.dataset.pmno;
	const memoNo = memoContent.dataset.memono;
	let memoBgColor = memoDetail.dataset.memobgcolor;
	const memoType = memoContent.dataset.memotype;

	// 딜레이 1초 설정
	let typingTimer;
  	const delay = 1000; // 1초
	
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
				memoInfo.style.backgroundColor = nextColor;
				memoDetail.style.backgroundColor =nextColor;

		        currentColor = nextColor;
		        memoBgColor = currentColor;
						        
		        clearTimeout(typingTimer);

		  		typingTimer = setTimeout(function() {

		  			// 1초동안 아무런 동작이 없으면 로직 실행					  			
		  			updateMemo();		  			
		  		}, delay);				
			}
    	}    	
  	});

	memoContent.addEventListener('input', function() {		
		clearTimeout(typingTimer);		
	});

	memoContent.addEventListener('keyup', function() {
		if(currentColor != '') {
			memoBgColor = currentColor;
		} else {
			memoBgColor = memoDetail.style.backgroundColor;
		}
		
		clearTimeout(typingTimer);
		
		typingTimer = setTimeout(function() {
		// 1초동안 아무런 동작이 없으면 로직 실행			
			updateMemo();			
		}, delay);		
	});

	//메모 보내기 함수
	function updateMemo() {
		// 개행 제거
		const cleanedmemoContent = memoContent.innerText.replace(/\n|\t/g, "");

		if(memoType == "workspace") {
			let memo = {
				"workspaceNo" : workspaceNo,
				"pmNo" : pmNo,
				"memoContent" : cleanedmemoContent,
				"memoBgColor" : memoBgColor,
				"memoNo" : memoNo,
				"profileImg" : profileImage,
				"memberName" : memberName
			};

			// JSON.parse(문자열) : JSON -> JS Object
			// JSON.stringify(객체) :  JS Object -> JSON
			console.log(memo);
			console.log(JSON.stringify(memo));
		
			// memoSock(웹소켓 객체)을 이용하여 메세지 보내기
			// memoSock.send(값) : 웹소켓 핸들러로 값을 보냄
			memoSock.send( JSON.stringify(memo) );

			// 알림 웹소켓으로 보냄
			let alert = {
				"projectNo" : projectNo,
				"memberNo" : memberNo,
				"alertContent" : "님이 메모장을 수정하였습니다.",
				"link" : contextPath + "/workspace/memo/" + projectNo + "/" + workspaceNo + "/",
				"memberName" : memberName
			}
		
			console.log(alert);
			console.log(JSON.stringify(alert));
		
			alertSock.send( JSON.stringify(alert) );
		
		} else if(memoType == "personal") {
			// ajax 코드 작성
			$.ajax({
				url : contextPath +"/workspace/memo/updateMemo",
				data : {"workspaceNo" : workspaceNo,
						"pmNo" : pmNo,
						"memoContent" : cleanedmemoContent,
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

	memoDetails.forEach((memoDetail) => {
		const changedMemoContent = memoDetail.querySelector(".memoContent");
		
		if(memo.memoNo == changedMemoContent.dataset.memono) {
		
			const changedMemoInfo = memoDetail.querySelector(".memoInfo");
			
			const changedMemberName = changedMemoInfo.querySelector(".memberName");
			const changedProfileImage = changedMemoInfo.querySelector(".memoProfileImg");
			const changedMemoUpdateDate = changedMemoInfo.querySelector(".memoUpdateDate");
			
			
			// 수정 멤버 정보 변경

			changedProfileImage.src = (contextPath + memo.profileImg);
			//$(changedProfileImage).attr(src, contextPath + memo.profileImg);
			changedMemberName.innerHTML = "수정자 : " +  memo.memberName;
			changedMemoUpdateDate.innerHTML = "수정일 : " + recurrentTime();
			changedMemoContent.dataset.pmno = memo.pmNo;

			// 수정 메모 내용 변경
			changedMemoContent.innerHTML = memo.memoContent;

			// 수정 메모 색상 변경
			changedMemoInfo.style.backgroundColor = memo.memoBgColor;
			changedMemoContent.style.backgroundColor = memo.memoBgColor;
			memoDetail.style.backgroundColor = memo.memoBgColor;
			memoDetail.dataset.memobgcolor = memo.memoBgColor;
			
		}

	});
};

// 시간 형식을  mm-dd hh:mm 으로 출력 
function recurrentTime() {
	const now = new Date();
	
	const month = addZero(now.getMonth() + 1);
	const date = addZero(now.getDate());
	const hours = addZero(now.getHours());
	const minutes = addZero(now.getMinutes());
	
	const time = month + "-" + date + " " + hours + ":" + minutes;
	
	return time;
  }

// 10보다 작을 경우 앞에 0을 붙이는 함수
function addZero(temp){
	return temp < 10 ? "0" + temp : temp;;
}

// 메모지 안에 글자수 제한 카운트하기 
// memoContents는 제일 위에 이미 선언해줌.
const counters = document.querySelectorAll('.counter');

memoContents.forEach((memoContent, index) => {
  	
	memoContent.addEventListener('input', function() {
		
		const text = memoContent.innerText;
		const remainingChars = 150 - text.length;

		counters[index].textContent = text.length;

		if (remainingChars <= 0) {
			memoContent.innerText = text.substr(0, 150);
			counters[index].textContent = 150;
			memoContent.blur(); 
		}
    });
});

// 시간설정
function formatTimeAgo(timestamp) {
    const currentDate = new Date();
    //const alertDate = new Date(timestamp);
	const updateDate = new Date(Number(timestamp));
	const timeDifference = currentDate.getTime() - updateDate.getTime(); // 현재 시간과의 차이(ms) 계산

    const minutes = Math.floor(timeDifference / (1000 * 60)); // 분 단위로 변환
  
    if (minutes < 1) {
      return "방금 전";
    } else if (minutes < 60) {
      return `${minutes}분 전`;
    } else if (minutes < 1440) {
      const hours = Math.floor(minutes / 60);
      return `${hours}시간 전`;
    } else {
      const days = Math.floor(minutes / 1440);
      return `${days}일 전`;
    }
}