// 딜레이 1초 설정
let typingTimer;
const delay = 1000; // 1초

$(document).on("mouseover", ".edit-boardDetail-area", function(){mouseover($(this))});
$(document).on("mouseout", ".edit-boardDetail-area", function(){mouseout($(this))});
$(document).on("keydown", ".edit-boardDetail-area", function(){inputTyping()});
$(document).on("keyup", ".edit-boardDetail-area", function(){keyupTyping($(this))});
$(document).on("click", ".add-boardDetail-btn", function(){addBoardDetailBtn($(this))});
$(document).on("keydown", ".edit-boardDetail-area", function(e) {
    if (e.key === "Backspace" && $(this).find(".note-editable").html() === "") {
        deleteBoardDetail($(this));
    }
});

// 서머노트 활성화
$(document).on("mouseover", ".summernote", function() {
	//여기 아래 부분
	$('.summernote').summernote({
        airMode: true,
        popover: { 
            air: [
                ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['help']]
              ] },
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],        
        height: 30,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR"					// 한글 설정          
	});

    
});

// 게시글 내용 변경 웹소켓
updateBoardDetailSock.onmessage = function(e) {
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const changedBoardDetail = JSON.parse(e.data);  // JSON -> JS Object

    // 수정된 게시글 정보 변경
    $(".updateMemberImage").attr("src", contextPath + changedBoardDetail.profileImage);
    $(".updateMemberName").html(changedBoardDetail.memberName);
    $(".updateDate").html(currentTime());

    boardDetails = document.querySelectorAll(".edit-boardDetail-area");
    boardDetails.forEach((boardDetail) => {
        // 수정된 게시글 내용 변경
        const changedBoardContent = boardDetail.querySelector(".summernote");
        
        if(changedBoardDetail.boardDetailNo == boardDetail.dataset.boarddetailno) {
            changedBoardContent.innerHTML = changedBoardDetail.boardContent;
        }
    });
}

// 게시글 내용 추가 웹소켓
insertBoardDetailSock.onmessage = function(e) {
    const newBoardDetail = JSON.parse(e.data);

    const addedEditBoardDetailArea = document.createElement('div');
    addedEditBoardDetailArea.classList.add('edit-boardDetail-area');
    addedEditBoardDetailArea.dataset.boarddetailno = newBoardDetail.boardDetailNo;
    addedEditBoardDetailArea.dataset.boarddetailsort = newBoardDetail.boardDetailSort;

    const addedAddBoardDetail = document.createElement('div');
    addedAddBoardDetail.classList.add('add-boardDetail');
    addedAddBoardDetail.style.visibility = 'hidden';

    const addedAddBoardDetailBtn = document.createElement('button');
    addedAddBoardDetailBtn.classList.add('add-boardDetail-btn');
    addedAddBoardDetailBtn.textContent = '+';

    addedAddBoardDetail.appendChild(addedAddBoardDetailBtn);

    const addedBoardDetail = document.createElement('div');
    addedBoardDetail.classList.add('boardDetail');

    const addedSummernote = document.createElement('div');
    addedSummernote.classList.add('summernote');
    addedSummernote.contentEditable = 'true';

    addedBoardDetail.appendChild(addedSummernote);

    addedEditBoardDetailArea.appendChild(addedAddBoardDetail);
    addedEditBoardDetailArea.appendChild(addedBoardDetail);

    let boardDetails = document.querySelectorAll(".edit-boardDetail-area");

    boardDetails.forEach((boardDetail) => {
        let boardDetailSort = boardDetail.dataset.boarddetailsort;
        let currentBoardDetailSort = parseInt(boardDetailSort, 10);

        if(currentBoardDetailSort >= newBoardDetail.boardDetailSort) {
            boardDetail.dataset.boarddetailsort = currentBoardDetailSort + 1;
        }

        if(boardDetailSort == addedEditBoardDetailArea.dataset.boarddetailsort - 1) {
            $(boardDetail).after(addedEditBoardDetailArea);
        }
    });

    // 수정된 게시글 정보 변경
    $(".updateMemberImage").attr("src", contextPath + newBoardDetail.profileImage);
    $(".updateMemberName").html(newBoardDetail.memberName);
    $(".updateDate").html(currentTime());
}

// 게시글 내용 삭제 웹소켓
deleteBoardDetailSock.onmessage = function(e) {
    const deletedBoardDetail = JSON.parse(e.data);

    let boardDetails = document.querySelectorAll(".edit-boardDetail-area");
    boardDetails.forEach((boardDetail) => {
        if(deletedBoardDetail.boardDetailNo == boardDetail.dataset.boarddetailno) {
            boardDetail.remove();
        }
    });
    // 수정된 게시글 정보 변경
    $(".updateMemberImage").attr("src", contextPath + deletedBoardDetail.profileImage);
    $(".updateMemberName").html(deletedBoardDetail.memberName);
    $(".updateDate").html(currentTime());
};

// 마우스 오버 함수
function mouseover(editBoardDetailArea) {
    $(editBoardDetailArea).find(".add-boardDetail").css("visibility", "visible");
    
};

// 마우스 아웃 함수
function mouseout(editBoardDetailArea) {
    $(editBoardDetailArea).find(".add-boardDetail").css("visibility", "hidden");
    // 서머노트 쓰기 활성화
    //$(editBoardDetailArea).find(".boardDetail").summernote({airMode: false});
};

// 타이핑중 딜레이 초기화 함수
function inputTyping() {    
    clearTimeout(typingTimer);
}

// 키업후 1초뒤 내용 수정 함수로 이동되는 함수
function keyupTyping(editBoardDetailArea) {    
    clearTimeout(typingTimer);

    typingTimer = setTimeout(function() {
        // 1초동안 아무런 동작이 없으면 로직 실행	
            updateBoardContent(editBoardDetailArea);			
        }, delay);	
}


// 게시글 내용 변경 함수
function updateBoardContent(editBoardDetailArea) {

    let boardDetailNo = $(editBoardDetailArea).data("boarddetailno");
    let boardContent = $(editBoardDetailArea).find(".note-editable").html();

    let boardDetail = {

        "workspaceNo" : workspaceNo,
        "boardNo" : boardNo,
        "boardDetailNo" : boardDetailNo,        
        "boardContent" : boardContent,
        "pmNo" : pmNo,
        "memberName" : memberName,
        "profileImage" : profileImage
    };

    // JSON.parse(문자열) : JSON -> JS Object
    // JSON.stringify(객체) :  JS Object -> JSON
    console.log(boardDetail);
    console.log(JSON.stringify(boardDetail));

    // updateBoardDetailSock(웹소켓 객체)을 이용하여 메세지 보내기
    // updateBoardDetailSock.send(값) : 웹소켓 핸들러로 값을 보냄
    updateBoardDetailSock.send( JSON.stringify(boardDetail) );
    
}

// 게시글 내용 추가버튼 함수
function addBoardDetailBtn(addBoardDetailBtn) {
    let boardDetail = $(addBoardDetailBtn).parent().parent(".edit-boardDetail-area");

    insertBoardDetail(boardDetail);
}

// 게시글 내용 추가 함수
function insertBoardDetail(boardDetail) {
    let boardDetailSort = $(boardDetail).data("boarddetailsort");

    boardDetail = {
        "boardDetailSort" : boardDetailSort,
        "workspaceNo" : workspaceNo,
        "boardNo" : boardNo,
        "pmNo" : pmNo,
        "memberName" : memberName,
        "profileImage" : profileImage
    }
    console.log(boardDetail);
    console.log(JSON.stringify(boardDetail));

    insertBoardDetailSock.send( JSON.stringify(boardDetail));
}

// 게시글 내용 삭제 함수
function deleteBoardDetail(editBoardDetailArea) {        
    let boardDetailSort = $(editBoardDetailArea).data("boarddetailsort");
    let boardDetailNo = $(editBoardDetailArea).data("boarddetailno");

    let boardDetail = {
        "boardDetailSort" : boardDetailSort,
        "boardDetailNo" : boardDetailNo,
        "workspaceNo" : workspaceNo,
        "boardNo" : boardNo,
        "pmNo" : pmNo,
        "memberName" : memberName,
        "profileImage" : profileImage
    };
    console.log(boardDetail);
    console.log(JSON.stringify(boardDetail));

    deleteBoardDetailSock.send( JSON.stringify(boardDetail));

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