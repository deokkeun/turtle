let boards = document.querySelectorAll(".board");
let lastBoard = document.querySelector(".lastBoard");
boards.forEach((board) => {
    let selectBoardDetail = board.querySelector('.select-board-detail');
    let addBoard = board.querySelector(".add-board");
    let editBoardTitle = board.querySelector(".edit-boardTitle");
    let editBoardTitleBtn = board.querySelector(".edit-boardTitle-btn");
    let boardTitle = board.querySelector(".boardTitle");
    let closeEditBoardTitleBtn = board.querySelector(".close-edit-boardTitle-btn");
    let dropBoard = board.querySelector(".delete-board");
    let addBoardBtn = board.querySelector(".add-board-btn");
    let deleteBoardBtn = board.querySelector(".delete-board-btn");


    // 제목 수정에 필요한 pmNo, boardNo 변수에 담기
    const pmNo = board.dataset.pmno;
    const boardNo = board.dataset.boardno;
    
    // 게시글 추가, 삭제에 필요한 boardSort 변수에 담기
    const boardSort = board.dataset.boardsort;

    // 딜레이 1초 설정
	let typingTimer;
    const delay = 1000; // 1초

    // 마우스가 올려진 게시글에 수정, 추가버튼 활성화
    board.addEventListener("mouseover", function() {
        if(addBoard != null) {
            addBoard.style.visibility = "visible";
        }       
        editBoardTitle.style.visibility = "visible";
        dropBoard.style.visibility = "visible";
    });


    // 마우스가 벗어나면 수정, 추가버튼 비활성화
    board.addEventListener("mouseout", function() {
        if(addBoard != null) {
            addBoard.style.visibility = "hidden";
        }        
        editBoardTitle.style.visibility = "hidden";
        dropBoard.style.visibility = "hidden";
    });

    
    // 제목 수정 기능 활성화
    if(editBoardTitleBtn != null) {
        editBoardTitleBtn.addEventListener("click", function() {
            selectBoardDetail.removeAttribute("href");
            boardTitle.contentEditable = true;
            closeEditBoardTitleBtn.style.display = "block";
            editBoardTitleBtn.style.display = "none";
        });
    }
    

    // 제목 수정 기능 비활성화
    if(closeEditBoardTitleBtn != null) {
        closeEditBoardTitleBtn.addEventListener("click", function() {
            selectBoardDetail.setAttribute("href", "#");
            boardTitle.contentEditable = false;
            closeEditBoardTitleBtn.style.display = "none";
            editBoardTitleBtn.style.display = "block";
        });
    }
    

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

        // 개행 제거
        const cleanedBoardTitle = boardTitle.innerHTML.replace(/\n|\t/g, "");

        let board = {
            "workspaceNo" : workspaceNo,
            "boardNo" : boardNo,
            "pmNo" : pmNo,
            "boardTitle" : cleanedBoardTitle,
            "updateMemberName" : memberName,
            "updateProfileImg" : profileImage
        };

        // JSON.parse(문자열) : JSON -> JS Object
        // JSON.stringify(객체) :  JS Object -> JSON
        console.log(board);
        console.log(JSON.stringify(board));

        // boardSock(웹소켓 객체)을 이용하여 메세지 보내기
		// boardSock.send(값) : 웹소켓 핸들러로 값을 보냄
		boardListSock.send( JSON.stringify(board) );
    }

    
    // 게시글 추가 기능
    addBoardBtn.addEventListener("click", function() {
        insertBoard();
    });
    
    // 게시글 추가 함수
    function insertBoard() {

        let board = {
            "boardSort" : boardSort,
            "workspaceNo" : workspaceNo,
            "pmNo" : pmNo,
            "regProfileImg" : profileImage
        };

        // JSON.parse(문자열) : JSON -> JS Object
        // JSON.stringify(객체) :  JS Object -> JSON
        console.log(board);
        console.log(JSON.stringify(board));

        // insertBoardSock(웹소켓 객체)을 이용하여 메세지 보내기
		// insertBoardSock.send(값) : 웹소켓 핸들러로 값을 보냄
		insertBoardSock.send( JSON.stringify(board));

    };
    

    // 게시글 삭제 기능
    if(deleteBoardBtn != null) {
        deleteBoardBtn.addEventListener("click", function() {
            deleteBoard();
        });
    }
    

    // 게시글 삭제 함수
    function deleteBoard() {

        let board = {
            "boardSort" : boardSort,
            "workspaceNo" : workspaceNo,
            "boardNo" : boardNo
        };

        // JSON.parse(문자열) : JSON -> JS Object
        // JSON.stringify(객체) :  JS Object -> JSON
        console.log(board);
        console.log(JSON.stringify(board));

        // deleteBoardSock(웹소켓 객체)을 이용하여 메세지 보내기
		// deleteBoardSock.send(값) : 웹소켓 핸들러로 값을 보냄
		deleteBoardSock.send( JSON.stringify(board));

    };
});


// 게시글 제목 수정용 웹소켓 작업
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

        if(changedBoard.boardNo == board.dataset.boardno) {

            // 수정한 멤버 정보 반영
            board.dataset.pmno = changedBoard.pmNo;
            changedProfileImage.src = contextPath + changedBoard.updateProfileImg;
            changedBoardUpdateDate.innerHTML = currentTime();

            // 수정된 제목 변경
            changedBoardTitle.innerHTML = changedBoard.boardTitle;

            
            
        }
    });
}

// 게시글 추가용 웹소켓 작업

// 웹소켓 핸들러에서
// s.sendMessage( new TextMessage(message.getPayload()) );
// 구문이 수행되어 메세지가 전달된 경우

insertBoardSock.onmessage = function(e) {
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const newBoard = JSON.parse(e.data);  // JSON -> JS Object
    // newBoard의 데이터를 div내에 담기
    addedBoard = '<div class="board" data-boardNo="' + newBoard.boardNo +'" data-pmNo="' + newBoard.pmNo + '" data-boardSort="' + newBoard.boardSort + '">' +
                    '<div class="edit-board-area">' +
                        '<div class="add-board" style="visibility:hidden;">' +
                            '<button class="add-board-btn">+</button>' +
                        '</div>' +
                        '<a href="#" class="select-board-detail">' +
                            '<div class="boardTitle" contenteditable="false">' +
                            '</div>' +
                        '</a>' +
                        '<div class="edit-boardTitle" style="visibility:hidden;">' +
                            '<button class="edit-boardTitle-btn">edit</button>' +
                            '<button class="close-edit-boardTitle-btn" style="display:none;">done</button>' +
                        '</div>' +
                    '</div>' +
                        '<div class="board-info">' +                        
                            '<span class="profile-image"><img src="' + contextPath + newBoard.regProfileImg + '"></span>' +
                            '<span class="updateDate"> ' + currentTime() + '</span>' +
                        '</div>' +
                    '<div class="delete-board" style="visibility:hidden;">' +
                        '<button class="delete-board-btn">-</button>' +
                    '</div>' +
                '</div>';

    boards = document.querySelectorAll(".board");   

    currentlastBoardsort = lastBoard.dataset.boardsort;
    currentlastBoardsort = parseInt(currentlastBoardsort, 10);
    lastBoard.dataset.boardSort = currentlastBoardsort + 1;
    

    boards.forEach((board) => {                

        // 브라우저 내 게시글들의 sort 재정렬
        currentBoardsort = board.dataset.boardsort;
        currentBoardsort = parseInt(currentBoardsort, 10); // 정수로 변환
        

        if(currentBoardsort >= newBoard.boardSort) {                        
            board.dataset.boardsort = currentBoardsort + 1;
            
        }

        

        // 사이위치한 글일때 글 사이에 게시글 삽입
        if(board.dataset.boardsort == newBoard.boardSort - 1 && board.nextElementSibling != null) {
            $(board).after(addedBoard);            
        }
        if(board.dataset.boardsort == 0) {
            location.reload();
        }
    })

};

// 게시글 삭제용 웹소켓 작업

// 웹소켓 핸들러에서
// s.sendMessage( new TextMessage(message.getPayload()) );
// 구문이 수행되어 메세지가 전달된 경우

deleteBoardSock.onmessage = function(e) {
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const deletedBoard = JSON.parse(e.data);  // JSON -> JS Object
    
    boards.forEach((board) => {

        if(!board.nextElementSibling.nextElementSibling) {
            location.reload();
        }

        if(deletedBoard.boardNo == board.dataset.boardno) {
            board.remove();
            
        }
        
    });
    

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