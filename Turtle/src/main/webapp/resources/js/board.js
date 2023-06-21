const boards = document.querySelectorAll(".board");

boards.forEach((board) => {
    const selectBoardDetail = board.querySelector('.select-board-detail');
    const addBoard = board.querySelector(".add-board");
    const editBoardTitle = board.querySelector(".edit-boardTitle");
    const editBoardTitleBtn = board.querySelector(".edit-boardTitle-btn");
    const boardTitle = board.querySelector(".boardTitle");
    const closeEditBoardTitleBtn = board.querySelector(".close-edit-boardTitle-btn");

    // 제목 수정에 필요한 pmNo, boardNo 변수에 담기
    const pmNo = boardTitle.dataset.pmno;
    const boardNo = boardTitle.dataset.boardno;

    // 딜레이 1초 설정
	let typingTimer;
    const delay = 1000; // 1초

    // 마우스가 올려진 게시글에 수정, 추가버튼 활성화
    board.addEventListener("mouseover", function() {

        addBoard.style.visibility = "visible";
        editBoardTitle.style.visibility = "visible";
    });

    // 마우스가 벗어나면 수정, 추가버튼 비활성화
    board.addEventListener("mouseout", function() {
        addBoard.style.visibility = "hidden";
        editBoardTitle.style.visibility = "hidden";
    });

    
    // 제목 수정 기능 활성화
    editBoardTitleBtn.addEventListener("click", function() {
        selectBoardDetail.removeAttribute("href");
        boardTitle.contentEditable = true;
        closeEditBoardTitleBtn.style.display = "block";
        editBoardTitleBtn.style.display = "none";
    });

    // 제목 수정 기능 비활성화
    closeEditBoardTitleBtn.addEventListener("click", function() {
        selectBoardDetail.setAttribute("href", "#");
        boardTitle.contentEditable = false;
        closeEditBoardTitleBtn.style.display = "none";
        editBoardTitleBtn.style.display = "block";
    });

    // 제목 수정 기능

    // 작성중일땐 시간 초기화
    board.addEventListener('input', function() {

        clearTimeout(typingTimer);	
    });

    board.addEventListener('keyup', function() {

        clearTimeout(typingTimer);

        typingTimer = setTimeout(function() {
            // 1초동안 아무런 동작이 없으면 로직 실행			
                updateBoardTitle();			
            }, delay);	
    });

    // 제목 변경 함수
    function updateBoardTitle() {
        let board = {
            "workspaceNo" : workspaceNo,
            "boardNo" : boardNo,
            "pmNo" : pmNo,
            "boardTitle" : boardTitle.innerHTML
        };

        // JSON.parse(문자열) : JSON -> JS Object
        // JSON.stringify(객체) :  JS Object -> JSON
        console.log(board);
        console.log(JSON.stringify(board));

        // boardSock(웹소켓 객체)을 이용하여 메세지 보내기
		// boardSock.send(값) : 웹소켓 핸들러로 값을 보냄
		boardListSock.send( JSON.stringify(board) );
    }

});

// 웹소켓 핸들러에서
// s.sendMessage( new TextMessage(message.getPayload()) );
// 구문이 수행되어 메세지가 전달된 경우

boardListSock.onmessage = function(e) {
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const changedBoard = JSON.parse(e.data);  // JSON -> JS Object


    boards.forEach((board) => {

        const changedBoardTitle = board.querySelector(".boardTitle");
        const changedProfileImage = board.querySelector(".profile-image > img");
        const changedBoardUpdateDate = board.querySelector(".updateDate")

        if(changedBoard.boardNo == changedBoardTitle.dataset.boardno) {
            changedBoardTitle.innerHTML = changedBoard.boardTitle;
            changedProfileImage.src = contextPath + profileImage;
            changedBoardUpdateDate.innerHTML = currentTime();
            
        }
    });
}

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