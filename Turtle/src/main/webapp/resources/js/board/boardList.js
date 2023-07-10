boardListTyping();
$(document).on("mouseover", ".board", function(){boardListmouseover($(this))});
$(document).on("mouseout", ".board", function(){boardListmouseout($(this))});
$(document).on("click", ".edit-boardTitle-btn", function(){
    const value = $('.boardListBoardTitle').val();
    editBoardTitleBtn($(this));
    $(this).parents('.edit-boardTitle').css('display', 'none');

});

$(document).on("click", ".emoji-area", function(){
    updateEmoji($(this))

});

$(document).on('keydown', '.boardListBoardTitle', function(key) {
    if(key.keyCode == 13) {
        console.log('2');
        closeEditBoardTitleBtn($(this).parents('.select-board-detail').siblings('.edit-boardTitle').children('.close-edit-boardTitle-btn'));
        $(this).parents('.select-board-detail').siblings('.edit-boardTitle').css('display','block');
    }
})
//$(document).on("click", ".close-edit-boardTitle-btn", function(){closeEditBoardTitleBtn($(this))});
//$(document).on("keydown", ".board", function(){inputTyping()});
//$(document).on("keyup", ".board", function(){keyupTyping($(this))});
$(document).on("click", ".add-board-btn", function(){
    addBoardBtn($(this))
    $(event.target).parents('.board').next().children('.edit-board-area').children('.select-board-detail').children('.boardTitle').attr('contenteditable','true');
    $(event.target).parents('.board').next().children('.edit-board-area').children('.select-board-detail').children('.boardTitle').focus();
});
// // $(document).on("click", ".add-board-btn", function(){
    
// //     $(event.target).parents('.board').next().children('.edit-board-area').children('.select-board-detail').children('.boardTitle').attr('contenteditable','true');
// //     $(event.target).parents('.board').next().children('.edit-board-area').children('.select-board-detail').children('.boardTitle').focus();
// });
$(document).on("click", ".delete-board-btn", function(){deleteBoardBtn($(this))});
$(document).on("click", ".edit-boardTitle-btn", function() {
    var value = $('.boardListBoardTitle').text();
    $(this).parents('.edit-boardTitle').siblings('.select-board-detail').children('.boardListBoardTitle').focus().val('').val(value);
    
    
}) 
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

    // emoji div 추가 (수정중)
    const addedEmoji = document.createElement('div');
    addedEmoji.classList.add('emoji-btn');
    addedEmoji.innerHTML =  "<i class='emoji-area fa-regular fa-file'></i>";

    const addedScriptTag = document.createElement('script');
    addedScriptTag.src = 'https://cdn.jsdelivr.net/npm/@joeattardi/emoji-button@3.0.3/dist/index.min.js';

    const addedAddBoardBtn = document.createElement('button');
    addedAddBoardBtn.classList.add('add-board-btn');
    addedAddBoardBtn.innerHTML = '<i class="fa-solid fa-plus"></i>';

   

    addedAddBoard.appendChild(addedAddBoardBtn);
    addedEditBoardArea.appendChild(addedAddBoard);
    addedEditBoardArea.appendChild(addedEmoji);
    addedEditBoardArea.appendChild(addedScriptTag);
    
    
    const addedSelectBoardDetail = document.createElement('a');
    addedSelectBoardDetail.onclick="toggleSide()";
    // addedSelectBoardDetail.href = '../../boardDetail/' + projectNo + '/' + workspaceNo + '/' + newBoard.boardNo;
    addedSelectBoardDetail.classList.add('select-board-detail');

    const addedBoardTitle = document.createElement('div');
    addedBoardTitle.classList.add('boardListBoardTitle');
    addedBoardTitle.contentEditable = 'false';
    addedSelectBoardDetail.appendChild(addedBoardTitle);

    const addedEditBoardTitle = document.createElement('div');
    addedEditBoardTitle.classList.add('edit-boardTitle');
    addedEditBoardTitle.style.visibility = 'hidden';

    const addedEditBoardTitleBtn = document.createElement('button');
    addedEditBoardTitleBtn.classList.add('edit-boardTitle-btn');
    addedEditBoardTitleBtn.innerHTML = '<i class="fa-regular fa-pen-to-square">';

    const addedCloseEditBoardTitleBtn = document.createElement('button');
    addedCloseEditBoardTitleBtn.classList.add('close-edit-boardTitle-btn');
    addedCloseEditBoardTitleBtn.style.display = 'none';
    addedCloseEditBoardTitleBtn.innerHTML = '<i class="fa-regular fa-pen-to-square">';

    addedEditBoardTitle.appendChild(addedEditBoardTitleBtn);
    addedEditBoardTitle.appendChild(addedCloseEditBoardTitleBtn);
    addedEditBoardArea.appendChild(addedSelectBoardDetail);
    addedEditBoardArea.appendChild(addedEditBoardTitle);

    const addedBoardInfo = document.createElement('div');
    addedBoardInfo.classList.add('board-info');

    const addedUserProfile = document.createElement('div');
    addedUserProfile.classList.add('user-profile');

    const addedProfileImage = document.createElement('span');
    addedProfileImage.classList.add('profile-image');

    const addedProfileImg = document.createElement('img');
    addedProfileImg.src = contextPath + newBoard.regProfileImg;
    addedProfileImage.appendChild(addedProfileImg);

    const addedUserName = document.createElement('span');
    addedUserName.classList.add('user-name');
    addedUserName.textContent = newBoard.regMemberName;
    addedUserName.visibility = "hidden";

    addedUserProfile.appendChild(addedProfileImage);
    addedUserProfile.appendChild(addedUserName);

    const addedBoardListEventDate = document.createElement('div');
    addedBoardListEventDate.classList.add('boardListEventDate');

    const addedBoardListEventStartDate = document.createElement('div');
    addedBoardListEventStartDate.classList.add('boardListEventStartDate');
    addedBoardListEventStartDate.textContent = newBoard.eventStartDate;

    const addedBetweenEventDate = document.createElement('div');
    addedBetweenEventDate.textContent = ' - ';

    const addedBoardListEventEndDate = document.createElement('div');
    addedBoardListEventEndDate.classList.add('boardListEventEndDate');
    addedBoardListEventEndDate.textContent = newBoard.eventEndDate;

    const addedDropBoard = document.createElement('div');
    addedDropBoard.classList.add('delete-board');
    addedDropBoard.style.visibility = 'hidden';

    const addedDeleteBoardBtn = document.createElement('button');
    addedDeleteBoardBtn.classList.add('delete-board-btn');
    addedDeleteBoardBtn.innerHTML = '<i class="fa-solid fa-xmark"></i>';


    addedBoardListEventDate.appendChild(addedBoardListEventStartDate);
    addedBoardListEventDate.appendChild(addedBetweenEventDate);
    addedBoardListEventDate.appendChild(addedBoardListEventEndDate);

    addedBoardInfo.appendChild(addedUserProfile);
    addedBoardInfo.appendChild(addedDropBoard);
    addedBoardInfo.appendChild(addedBoardListEventDate);

   
    addedDropBoard.appendChild(addedDeleteBoardBtn);

    addedBoard.appendChild(addedEditBoardArea);
    addedBoard.appendChild(addedBoardInfo);
   

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
    boardListTyping();
};

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

// 이모지 변경 웹소켓
updateEmojiSock.onmessage = function(e) {

    const changedBoardInfo = JSON.parse(e.data);

    boards = document.querySelectorAll(".board");

    boards.forEach((board) => {
        if(board.dataset.boardno == changedBoardInfo.boardNo) {
            let button4 = board.querySelector(".emoji-btn > i");

            if(button4.classList.contains('fa-regular')) {
                button4.classList.remove('fa-regular');
                button4.classList.remove('fa-file');
                button4.classList.add('emo');
               
                button4.innerHTML = changedBoardInfo.boardEmoji;
            } else if(button4.classList.contains('emo')) {
                button4.innerHTML = changedBoardInfo.boardEmoji;
            }

        }
    })   
}

// 마우스 오버 함수
function boardListmouseover(board) {
    $(board).find(".add-board").css("visibility", "visible");          
    $(board).find(".edit-boardTitle").css("visibility", "visible");
    $(board).find(".delete-board").css("visibility", "visible");
};

// 마우스 아웃 함수
function boardListmouseout(board) {
    $(board).find(".add-board").css("visibility", "hidden");          
    $(board).find(".edit-boardTitle").css("visibility", "hidden");
    $(board).find(".delete-board").css("visibility", "hidden");
};

// 제목수정버튼 클릭 함수
function editBoardTitleBtn(editBoardTitleBtn) {
    // $(editBoardTitleBtn).parent().siblings(".select-board-detail").removeAttr('href');
    $(editBoardTitleBtn).parent().siblings(".select-board-detail").removeAttr('href');
    $(editBoardTitleBtn).parent().siblings().find(".boardListBoardTitle").attr('contenteditable', 'true');
    $(editBoardTitleBtn).siblings(".close-edit-boardTitle-btn").css("display", "block"); 
    $(editBoardTitleBtn).css("display", "none"); 
};

// 제목수정취소버튼 클릭 함수
function closeEditBoardTitleBtn(closeEditBoardTitleBtn) {
    //let boardNo = $(closeEditBoardTitleBtn).parents(".board").data('boardno');   

    // $(closeEditBoardTitleBtn).parent().siblings(".select-board-detail").attr("href", "../../boardDetail/" + projectNo + '/' + workspaceNo + '/' + boardNo);
    $(closeEditBoardTitleBtn).parent().siblings(".select-board-detail").attr("onclick", "toggleSide()");
    $(closeEditBoardTitleBtn).parent().siblings().find(".boardListBoardTitle").attr('contenteditable', 'false');
    $(closeEditBoardTitleBtn).css("display", "none");
    $(closeEditBoardTitleBtn).siblings(".edit-boardTitle-btn").css("display", "block");
   
};

// 게시글 제목 수정 타이핑 함수
function boardListTyping() {
    let boards = document.querySelectorAll(".board");
    boards.forEach((board) => {
        // 딜레이 1초 설정
        let typingTimer;
        const delay = 1000; // 1초

        board.addEventListener('input', function() {
            clearTimeout(typingTimer);
        });
        board.addEventListener('keyup', function() {
            clearTimeout(typingTimer);

            typingTimer = setTimeout(function() {
                // 1초동안 아무런 동작이 없으면 로직 실행			
                updateBoardListBoardTitle(board);			
            }, delay);
        });
    });
}

// 게시글 추가버튼 함수
function addBoardBtn(addBoardBtn) {
    let board = $(addBoardBtn).parent().parent().parent(".board");    
    //clickedBoard = $(board).data("boardsort");

    insertBoard(board);
    console.log(event.target);
}

// 게시글 삭제버튼 함수
function deleteBoardBtn(deleteBoardBtn) {
    let board = $(deleteBoardBtn).parent().parent().parent(".board");
    deleteBoard(board);
}

// 제목 변경 함수
function updateBoardListBoardTitle(board) {
    let boardNo = $(board).data('boardno');
    let boardTitle = $(board).find(".boardListBoardTitle");
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

    // 알림 웹소켓으로 보냄
    let alert = {
        "projectNo" : projectNo,
        "memberNo" : memberNo,
        "alertContent" : "님이 게시글을 수정하였습니다.",
        "link" : contextPath + "/project/" + projectNo + "/" + workspaceNo,
        "memberName" : memberName
    }

    console.log(alert);
    console.log(JSON.stringify(alert));

    alertSock.send( JSON.stringify(alert) );
}

// 게시글 추가 함수
function insertBoard(board) {
    let boardSort = $(board).data("boardsort");

    board = {
        "boardSort" : boardSort,
        "workspaceNo" : workspaceNo,
        "pmNo" : pmNo,
        "regProfileImg" : profileImage,
        "regMemberName" : memberName
    };

    // JSON.parse(문자열) : JSON -> JS Object
    // JSON.stringify(객체) :  JS Object -> JSON
    console.log(board);
    console.log(JSON.stringify(board));

    // insertBoardSock(웹소켓 객체)을 이용하여 메세지 보내기
    // insertBoardSock.send(값) : 웹소켓 핸들러로 값을 보냄
    insertBoardSock.send( JSON.stringify(board));

    // 알림 웹소켓으로 보냄
    let alert = {
        "projectNo" : projectNo,
        "memberNo" : memberNo,
        "alertContent" : "님이 게시글을 추가하였습니다.",
        "link" : contextPath + "/project/" + projectNo + "/" + workspaceNo,
        "memberName" : memberName
    }

    console.log(alert);
    console.log(JSON.stringify(alert));

    alertSock.send( JSON.stringify(alert) );

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
//엔터키 입력시 바로 수정
// $(document).on('keydown', '.boardTitle', function(key) {
//     if(key.keyCode == 13) {
//         console.log('2');
//         closeEditBoardTitleBtn($('.close-edit-boardTitle-btn'));

//     }
// })

//수정버튼 클릭시 focus 맨뒤에 하는거
// var len = $('.boardTitle').val().length;
// $('.boardTitle').focus();
// $('.boardTitle')[0].setSelectionRange(len, len);

/*
//이모티콘
let button4 = document.querySelectorAll(".emoji-btn > i");
const picker3 = new EmojiButton({
position: 'bottom-start'
});
*/
// $('.emoji-btn').click(function() {
//     picker3.togglePicker($(this));
//     picker3.on('emoji', emoji => {
//         $(this).html(emoji);
//     })

// })
/*
for(let i=0; i<button4.length; i++) {
    button4[i].addEventListener('click', (e)=> {
        picker3.togglePicker(button4[i]);
        let boardNo = $(button4[i]).parent().parent().parent(".board").data("boardno");
        console.log(boardNo);
        console.log($(this).parent().parent().parent(".board"));
        picker3.on('emoji', emoji => {

            let board = {
                "boardNo" : boardNo,
                "workspaceNo" : workspaceNo,
                "pmNo" : pmNo,
                "updateMemberName" : memberName,
                "updateProfileImg" : profileImage,
                "boardEmoji" : emoji
            };

            console.log(board);
            console.log(JSON.stringify(board));

            updateEmojiSock.send( JSON.stringify(board));        
        })
    })
}
*/

function updateEmoji(emojiBtn) {

    let picker3 = new EmojiButton({
        position: 'bottom-start'
    });
    picker3.togglePicker(emojiBtn);
        let boardNo = $(emojiBtn).parent().parent().parent(".board").data("boardno");
        console.log(boardNo);
        console.log($(emojiBtn).parent().parent().parent(".board"));
        picker3.on('emoji', emoji => {

            let board = {
                "boardNo" : boardNo,
                "workspaceNo" : workspaceNo,
                "pmNo" : pmNo,
                "updateMemberName" : memberName,
                "updateProfileImg" : profileImage,
                "boardEmoji" : emoji
            };

            console.log(board);
            console.log(JSON.stringify(board));

            updateEmojiSock.send( JSON.stringify(board));        
        })
};

// button4.forEach((button4)=> {
//     button4.addEventListener('click', (e) => {
//     picker3.togglePicker(button4);
//         picker3.on('emoji', emoji => {
      
//            e.target.innerHTML = emoji;
//         })
//     });
   
    
// });

// picker3.on('emoji', emoji => {
// const text_box3 = document.querySelectorAll('.emoji-btn');
// text_box3.innerHTML = emoji;
// });
//     var len = $('.boardTitle').val().length;
// $('.boardTitle').focus();
// $('.boardTitle')[0].setSelectionRange(len, len);
var input = document.querySelector(".boardListBoardTitle"); 

// input[name='txt'] 요소에 focus 이벤트 리스너를 지정합니다.

