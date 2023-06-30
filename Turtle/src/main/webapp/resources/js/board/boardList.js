// 딜레이 1초 설정
let typingTimer;
const delay = 1000; // 1초

$(document).on("mouseover", ".board", function(){mouseover($(this))});
$(document).on("mouseout", ".board", function(){mouseout($(this))});
$(document).on("click", ".edit-boardTitle-btn", function(){editBoardTitleBtn($(this))});
$(document).on("click", ".close-edit-boardTitle-btn", function(){closeEditBoardTitleBtn($(this))});
$(document).on("keydown", ".board", function(){inputTyping()});
$(document).on("keyup", ".board", function(){keyupTyping($(this))});
$(document).on("click", ".add-board-btn", function(){addBoardBtn($(this))});
$(document).on("click", ".delete-board-btn", function(){deleteBoardBtn($(this))});

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
    addedSelectBoardDetail.href = '../../boardDetail/' + projectNo + '/' + workspaceNo + '/' + newBoard.boardNo;
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
    console.log(addedBoard);
    
    // 기존에 있던 요소들의 정렬 및 boardSort 변경   
    boards.forEach((board) => {                
        let boardSort = board.dataset.boardsort;
        currentBoardSort = parseInt(boardSort, 10); // 정수로 변환

        if(currentBoardSort >= newBoard.boardSort){
            board.dataset.boardsort = currentBoardSort + 1;
        }

        if(boardSort == addedBoard.dataset.boardsort - 1) {
            $(board).after(addedBoard);
        }
    });
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
    let boards = document.querySelectorAll(".board");
    boards.forEach((board) => {
        if(deletedBoard.boardNo == board.dataset.boardno) {
            if(!board.previousSibling && !board.nextElementSibling) {
                location.reload();
            } else {
                board.remove();
            }            
        }        
    });
};

// 게시글 내용 수정시 수정 멤버 정보 바꾸는 웹소켓 작업
updateBoardDetailSock.onmessage = function(e) {
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const changedBoardDetail = JSON.parse(e.data);  // JSON -> JS Object

    // 수정된 게시글 정보 변경
    boards = document.querySelectorAll(".board");

    boards.forEach((board) => {
        if(board.dataset.boardno == changedBoardDetail.boardNo) {
            $(board).find(".profile-image").find("img").attr("src", contextPath + changedBoardDetail.profileImage);
            $(board).find(".user-name").html(changedBoardDetail.memberName);
            $(board).find(".updateDate").html(currentTime());
        }
    });

    
}

// 게시글 내용 추가시 수정 멤버 정보 바꾸는 웹소켓 작업
insertBoardDetailSock.onmessage = function(e) {
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const changedBoardDetail = JSON.parse(e.data);  // JSON -> JS Object

    // 수정된 게시글 정보 변경
    boards = document.querySelectorAll(".board");

    boards.forEach((board) => {
        if(board.dataset.boardno == changedBoardDetail.boardNo) {
            $(board).find(".profile-image").find("img").attr("src", contextPath + changedBoardDetail.profileImage);
            $(board).find(".user-name").html(changedBoardDetail.memberName);
            $(board).find(".updateDate").html(currentTime());
        }
    });    
}

// 게시글 내용 삭제시 수정 멤버 정보 바꾸는 웹소켓 작업
deleteBoardDetailSock.onmessage = function(e) {
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const changedBoardDetail = JSON.parse(e.data);  // JSON -> JS Object

    // 수정된 게시글 정보 변경
    boards = document.querySelectorAll(".board");

    boards.forEach((board) => {
        if(board.dataset.boardno == changedBoardDetail.boardNo) {
            $(board).find(".profile-image").find("img").attr("src", contextPath + changedBoardDetail.profileImage);
            $(board).find(".user-name").html(changedBoardDetail.memberName);
            $(board).find(".updateDate").html(currentTime());
        }
    });    
};

// 마우스 오버 함수
function mouseover(board) {
    $(board).find(".add-board").css("visibility", "visible");          
    $(board).find(".edit-boardTitle").css("visibility", "visible");
    $(board).find(".delete-board").css("visibility", "visible");
};

// 마우스 아웃 함수
function mouseout(board) {
    $(board).find(".add-board").css("visibility", "hidden");          
    $(board).find(".edit-boardTitle").css("visibility", "hidden");
    $(board).find(".delete-board").css("visibility", "hidden");
};

// 제목수정버튼 클릭 함수
function editBoardTitleBtn(editBoardTitleBtn) {
    $(editBoardTitleBtn).parent().siblings(".select-board-detail").removeAttr('href');
    $(editBoardTitleBtn).parent().siblings().find(".boardTitle").attr('contenteditable', 'true');
    $(editBoardTitleBtn).siblings(".close-edit-boardTitle-btn").css("display", "block"); 
    $(editBoardTitleBtn).css("display", "none"); 
};

// 제목수정취소버튼 클릭 함수
function closeEditBoardTitleBtn(closeEditBoardTitleBtn) {
    let boardNo = $(closeEditBoardTitleBtn).parents(".board").data('boardno');   

    $(closeEditBoardTitleBtn).parent().siblings(".select-board-detail").attr("href", "../../boardDetail/" + projectNo + '/' + workspaceNo + '/' + boardNo);
    $(closeEditBoardTitleBtn).parent().siblings().find(".boardTitle").attr('contenteditable', 'false');
    $(closeEditBoardTitleBtn).css("display", "none");
    $(closeEditBoardTitleBtn).siblings(".edit-boardTitle-btn").css("display", "block");
};

// 타이핑중 딜레이 초기화 함수
function inputTyping() {    
    clearTimeout(typingTimer);	
}

// 키업후 1초뒤 제목수정함수로 이동되는 함수
function keyupTyping(board) {    
    clearTimeout(typingTimer);

    typingTimer = setTimeout(function() {
        // 1초동안 아무런 동작이 없으면 로직 실행			
            updateBoardTitle(board);			
        }, delay);	
}

// 게시글 추가버튼 함수
function addBoardBtn(addBoardBtn) {
    let board = $(addBoardBtn).parent().parent().parent(".board");    
    //clickedBoard = $(board).data("boardsort");

    insertBoard(board);
}

// 게시글 삭제버튼 함수
function deleteBoardBtn(deleteBoardBtn) {
    let board = $(deleteBoardBtn).parent().parent(".board");
    deleteBoard(board);
}

// 제목 변경 함수
function updateBoardTitle(board) {
    let boardNo = $(board).data('boardno');
    let boardTitle = $(board).find(".boardTitle");
    // 개행 제거
    const cleanedBoardTitle = $(boardTitle).html().replace(/\n|\t/g, "");

    board = {
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

// 게시글 추가 함수
function insertBoard(board) {
    let boardSort = $(board).data("boardsort");

    board = {
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

// 게시글 삭제 함수
function deleteBoard(board) {
    let boardSort = $(board).data("boardsort");
    let boardNo = $(board).data("boardno");

    board = {
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
