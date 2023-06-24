let boards = document.querySelectorAll(".board");
let lastBoard = document.querySelector(".lastBoard");

// 딜레이 1초 설정
let typingTimer;
const delay = 1000; // 1초

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

    boards = document.querySelectorAll(".board");
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
    // newBoard의 데이터를 div내에 담기
    const addedBoard = document.createElement('div');
    addedBoard.classList.add('board');
    addedBoard.dataset.boardno = newBoard.boardNo;
    console.log(newBoard.boardNo);
    addedBoard.dataset.pmno = newBoard.pmNo;
    addedBoard.dataset.boardsort = newBoard.boardSort;

    const addedEditBoardArea = document.createElement('div');
    addedEditBoardArea.classList.add('edit-board-area');

    const addedAddBoard = document.createElement('div');
    addedAddBoard.classList.add('add-board');
    addedAddBoard.style.visibility = 'hidden';

    const addedAddBoardBtn = document.createElement('button');
    addedAddBoardBtn.classList.add('add-board-btn');
    addedAddBoardBtn.textContent = '+';

    addedAddBoard.appendChild(addedAddBoardBtn);
    addedEditBoardArea.appendChild(addedAddBoard);

    const addedSelectBoardDetail = document.createElement('a');
    addedSelectBoardDetail.href = '#';
    addedSelectBoardDetail.classList.add('select-board-detail');

    const addedBoardTitle = document.createElement('div');
    addedBoardTitle.classList.add('boardTitle');
    addedBoardTitle.contentEditable = 'false';
    addedSelectBoardDetail.appendChild(addedBoardTitle);

    const addedEditBoardTitle = document.createElement('div');
    addedEditBoardTitle.classList.add('edit-boardTitle');
    addedEditBoardTitle.style.visibility = 'hidden';

    const addedEditBoardTitleBtn = document.createElement('button');
    addedEditBoardTitleBtn.classList.add('edit-boardTitle-btn');
    addedEditBoardTitleBtn.textContent = 'edit';

    const addedCloseEditBoardTitleBtn = document.createElement('button');
    addedCloseEditBoardTitleBtn.classList.add('close-edit-boardTitle-btn');
    addedCloseEditBoardTitleBtn.style.display = 'none';
    addedCloseEditBoardTitleBtn.textContent = 'done';

    addedEditBoardTitle.appendChild(addedEditBoardTitleBtn);
    addedEditBoardTitle.appendChild(addedCloseEditBoardTitleBtn);
    addedEditBoardArea.appendChild(addedSelectBoardDetail);
    addedEditBoardArea.appendChild(addedEditBoardTitle);

    const addedBoardInfo = document.createElement('div');
    addedBoardInfo.classList.add('board-info');

    const addedProfileImage = document.createElement('span');
    addedProfileImage.classList.add('profile-image');

    const addedProfileImg = document.createElement('img');
    addedProfileImg.src = contextPath + newBoard.regProfileImg;
    addedProfileImage.appendChild(addedProfileImg);

    const addedUpdateDate = document.createElement('span');
    addedUpdateDate.classList.add('updateDate');
    addedUpdateDate.textContent = currentTime();

    addedBoardInfo.appendChild(addedProfileImage);
    addedBoardInfo.appendChild(addedUpdateDate);

    const addedDropBoard = document.createElement('div');
    addedDropBoard.classList.add('delete-board');
    addedDropBoard.style.visibility = 'hidden';

    const addedDeleteBoardBtn = document.createElement('button');
    addedDeleteBoardBtn.classList.add('delete-board-btn');
    addedDeleteBoardBtn.textContent = '-';

    addedDropBoard.appendChild(addedDeleteBoardBtn);

    addedBoard.appendChild(addedEditBoardArea);
    addedBoard.appendChild(addedBoardInfo);
    addedBoard.appendChild(addedDropBoard);

    boards = document.querySelectorAll(".board");   

    // 기존에 있던 요소들의 정렬 및 boardSort 변경
    // 마지막에 있던 boardSort 변경

    if(lastBoard) {
        currentlastBoardsort = parseInt(lastBoard.dataset.boardsort, 10);
        lastBoard.dataset.boardsort = currentlastBoardsort + 1;
    }
    
    boards.forEach((board) => {                

        // 브라우저 내 게시글들의 sort 재정렬
        currentBoardsort = parseInt(board.dataset.boardsort, 10); // 정수로 변환
        
        if(currentBoardsort >= newBoard.boardSort && board.dataset.boardsort != lastBoard.dataset.boardsort) {    
              
            board.dataset.boardsort = currentBoardsort + 1;
            
        }

        // 사이위치한 글일때 글 사이에 게시글 삽입
        if(board.dataset.boardsort == newBoard.boardSort - 1 && board.nextElementSibling != null) {
            $(board).after(addedBoard);            
        }
        if(board.dataset.boardsort == 0) {
            location.reload();
        }       

    });

    // 마우스가 올려진 게시글에 수정, 추가버튼 활성화
    addedBoard.addEventListener("mouseover", function() {
        if(addedAddBoard != null) {
            addedAddBoard.style.visibility = "visible";
        }       
        addedEditBoardTitle.style.visibility = "visible";
        addedDropBoard.style.visibility = "visible";
    });

    // 마우스가 벗어나면 수정, 추가버튼 비활성화
    addedBoard.addEventListener("mouseout", function() {
        if(addedAddBoard != null) {
            addedAddBoard.style.visibility = "hidden";
        }        
        addedEditBoardTitle.style.visibility = "hidden";
        addedDropBoard.style.visibility = "hidden";
    });
    
    // 제목 수정 기능 활성화
    if(addedEditBoardTitleBtn != null) {
        addedEditBoardTitleBtn.addEventListener("click", function() {
            addedSelectBoardDetail.removeAttribute("href");
            addedBoardTitle.contentEditable = true;
            addedCloseEditBoardTitleBtn.style.display = "block";
            addedEditBoardTitleBtn.style.display = "none";
        });
    }
    
    // 제목 수정 기능 비활성화
    if(addedCloseEditBoardTitleBtn != null) {
        addedCloseEditBoardTitleBtn.addEventListener("click", function() {
            addedSelectBoardDetail.setAttribute("href", "#");
            addedBoardTitle.contentEditable = false;
            addedCloseEditBoardTitleBtn.style.display = "none";
            addedEditBoardTitleBtn.style.display = "block";
        });
    }

    // 제목 수정 기능
    // 작성중일땐 시간 초기화
    addedBoard.addEventListener('input', function() {
        clearTimeout(typingTimer);	
    });

    addedBoard.addEventListener('keyup', function() {
        clearTimeout(typingTimer);

        typingTimer = setTimeout(function() {
            // 1초동안 아무런 동작이 없으면 로직 실행			
                updateBoardTitle();			
            }, delay);	
    });

    // 제목 변경 함수
    function updateBoardTitle() {
        // 개행 제거
        const cleanedBoardTitle = addedBoardTitle.innerHTML.replace(/\n|\t/g, "");

        let board = {
            "workspaceNo" : workspaceNo,
            "boardNo" : newBoard.boardNo,
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
    addedAddBoardBtn.addEventListener("click", function() {
        insertBoard();
    });
    
    // 게시글 추가 함수
    function insertBoard() {

        let board = {
            "boardSort" : newBoard.boardSort,
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
    if(addedDeleteBoardBtn != null) {
        addedDeleteBoardBtn.addEventListener("click", function() {
            deleteBoard();
        });
    }
    
    // 게시글 삭제 함수
    function deleteBoard() {

        let board = {
            "boardSort" : newBoard.boardSort,
            "workspaceNo" : workspaceNo,
            "boardNo" : newBoard.boardNo
        };

        // JSON.parse(문자열) : JSON -> JS Object
        // JSON.stringify(객체) :  JS Object -> JSON
        console.log(board);
        console.log(JSON.stringify(board));

        // deleteBoardSock(웹소켓 객체)을 이용하여 메세지 보내기
		// deleteBoardSock.send(값) : 웹소켓 핸들러로 값을 보냄
		deleteBoardSock.send( JSON.stringify(board));

    };
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
    boards = document.querySelectorAll(".board");
    boards.forEach((board) => {
        if(deletedBoard.boardNo == board.dataset.boardno) {
            if(!board.nextElementSibling.nextElementSibling) {
                location.reload();
            } else {
                board.remove();
            }            
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