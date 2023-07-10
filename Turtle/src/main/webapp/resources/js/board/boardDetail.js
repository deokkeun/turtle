$(document).on("click", ".select-board-detail", function(){
    boardNo = $(this).parent().parent(".board").data("boardno");
    $.ajax({
        url : contextPath + "/board/boardDetail/" + projectNo + "/" + workspaceNo + "/" + boardNo,
        type : "get",
        dataType : "JSON",
        success : function(map) {
            //boardNo = map.board.boardNo;
            console.log(boardNo);
            // 게시글 정보 변경
            document.querySelector(".boardDetailBoard-area").dataset.boardno = map.board.boardNo;
            $(".boardTitle").html(map.board.boardTitle);
            $(".regMemberImage").attr("src", contextPath + map.board.regProfileImg);
            $(".regMemberName").html(map.board.regMemberName);
            //$(".regDate").html(map.board.boardRegDate);
            $(".regDate").html(formatDate(map.board.boardRegDate));

            if (map.board.updateProfileImg != null) {
                $(".updateMemberImage").attr("src", contextPath + map.board.updateProfileImg);
                $(".updateMemberName").html(map.board.updateMemberName);
            }
            if (map.board.boardUpdateDate != null) {
            //    $(".updateDate").html(map.board.boardUpdateDate);
            $(".updateDate").html(formatDate(map.board.boardUpdateDate));

            }

            $(".eventStartDate").val(map.board.eventStartDate);
            $(".eventEndDate").val(map.board.eventEndDate);

            $(".boardDetail-area").html("");

            // 요소 생성
            var editBoardDetailArea = $("<div>", {
                class: "edit-boardDetail-area",
                "data-boardDetailNo": "0",
                "data-boardDetailSort": "0"
            });

            var addBoardDetail = $("<div>", {class: "add-boardDetail", style: "visibility:hidden;"
            }).append(
                $("<button>", {class: "add-boardDetail-btn", html: "<i class='fa-solid fa-plus'></i>"})
            );

            var boardDetail = $("<div>", {class: "boardDetail"
            }).append(
                $("<div>", {class: "summernote", contenteditable: "true", html: boardContent})
            );
            // 요소 추가
            editBoardDetailArea.append(addBoardDetail, boardDetail);
            $(".boardDetail-area").append(editBoardDetailArea, $("<hr>"));

            // boardDetailList의 각 항목에 대해 반복
            for (let item of map.boardDetailList) {
                var boardDetailNo = item.boardDetailNo;
                var boardDetailSort = item.boardDetailSort;
                var boardContent = item.boardContent;
                var profileImage = item.profileImage;

                // 요소 생성
                var editBoardDetailArea = $("<div>", {
                    class: "edit-boardDetail-area",
                    "data-boardDetailNo": boardDetailNo,
                    "data-boardDetailSort": boardDetailSort
                });

                var addBoardDetail = $("<div>", {class: "add-boardDetail", style: "visibility:hidden;"
                }).append(
                    $("<button>", {class: "add-boardDetail-btn", html: "<i class='fa-solid fa-plus'></i>"})
                );

                var boardDetail = $("<div>", {class: "boardDetail"
                }).append(
                    $("<div>", {class: "summernote", contenteditable: "true", html: boardContent})
                );

                var updateDetailMember = $("<div>", {class: "updateDetailMember", style: "visibility:hidden;"
                }).append($("<img>", {class: "boardDetailProfileImage", src: contextPath + profileImage})
                );

                // 요소 추가
                editBoardDetailArea.append(addBoardDetail, boardDetail, updateDetailMember);
                $(".boardDetail-area").append(editBoardDetailArea, $("<hr>"));
            }
            typing();
            titleTyping();
        },
        error : function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    });
});


// 게시판 내 최초작성일, 수정일을 yyyy-mm-dd hh:ss 형식으로 변환
function formatDate(dateString) {
            
    const date = new Date(dateString);   
    const year = date.getFullYear();
            const month = ("0" + (date.getMonth() + 1)).slice(-2);
            const day = ("0" + date.getDate()).slice(-2);
            const hours = ("0" + date.getHours()).slice(-2);
            
    const minutes = ("0" + date.getMinutes()).slice(-2);
            
           
    return year + "-" + month + "-" + day + " " + hours + ":" + minutes;
}






$(document).on("mouseover", ".edit-boardDetail-area", function(){mouseover($(this))});
$(document).on("mouseout", ".edit-boardDetail-area", function(){mouseout($(this))});
$(document).on("click", ".add-boardDetail-btn", function(){addBoardDetailBtn($(this))});
$(document).on("keydown", ".edit-boardDetail-area", function(e) {
    if (e.key === "Backspace" && $(this).find(".note-editable").html() === "") {
        deleteBoardDetail($(this));
    }
});
$(document).on("change", ".eventDate", function(){updateEventDate($(this))});
// 서머노트 활성화
$(document).on("click", ".summernote", function() {
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
			    ['insert',['link','video']],
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
    boardDetailBoardAreas = document.querySelectorAll(".boardDetailBoard-area");
    boardDetailBoardAreas.forEach((boardDetailBoardArea) => {
        if(changedBoardDetail.boardNo == boardDetailBoardArea.dataset.boardno) {
            console.log("같음");
            // 수정된 게시글 정보 변경
            $(".updateMemberImage").attr("src", contextPath + changedBoardDetail.profileImage);
            $(".updateMemberName").html(changedBoardDetail.memberName);
            $(".updateDate").html(currentTime());
    
            boardDetails = boardDetailBoardArea.querySelectorAll(".edit-boardDetail-area");
            boardDetails.forEach((boardDetail) => {
                // 수정된 게시글 내용 변경
                const changedBoardContent = boardDetail.querySelector(".summernote");
                const changedSummernoteContent =boardDetail.querySelector(".note-editable")
                const changedProfileImage = boardDetail.querySelector(".boardDetailProfileImage");
    
                if(changedBoardDetail.boardDetailNo == boardDetail.dataset.boarddetailno) {
                    changedBoardContent.innerHTML = changedBoardDetail.boardContent;
                    $(changedSummernoteContent).html(changedBoardDetail.boardContent);
                    changedProfileImage.src = contextPath + changedBoardDetail.profileImage;
                }        
            });
        }    
    });
    
    // 게시글리스트에서도 수정한 회원의 정보 변경
    boards = document.querySelectorAll(".board");
    boards.forEach((board) => {
        if(board.dataset.boardno == changedBoardDetail.boardNo) {
            $(board).find(".profile-image").find("img").attr("src", contextPath + changedBoardDetail.profileImage);
            $(board).find(".user-name").html(changedBoardDetail.memberName);
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
        addedAddBoardDetailBtn.innerHTML = '<i class="fa-solid fa-plus"></i>';

        addedAddBoardDetail.appendChild(addedAddBoardDetailBtn);

        const addedBoardDetail = document.createElement('div');
        addedBoardDetail.classList.add('boardDetail');

        const addedSummernote = document.createElement('div');
        addedSummernote.classList.add('summernote');
        addedSummernote.contentEditable = 'true';

        addedBoardDetail.appendChild(addedSummernote);
        
        const addedUpdateDetailMember = document.createElement('div');
        addedUpdateDetailMember.classList.add('updateDetailMember');
        addedUpdateDetailMember.style.visibility = 'hidden';

        const addedBoardDetailProfileImage = document.createElement('img');
        addedBoardDetailProfileImage.classList.add('boardDetailProfileImage');
        addedBoardDetailProfileImage.src = contextPath + newBoardDetail.profileImage;

        addedUpdateDetailMember.appendChild(addedBoardDetailProfileImage);

        addedEditBoardDetailArea.appendChild(addedAddBoardDetail);
        addedEditBoardDetailArea.appendChild(addedBoardDetail);
        addedEditBoardDetailArea.appendChild(addedUpdateDetailMember);

        const addedHr = document.createElement('hr');

        boardDetailBoardArea = document.querySelector(".boardDetailBoard-area");
        if(newBoardDetail.boardNo == boardDetailBoardArea.dataset.boardno) {
            let boardDetails = boardDetailBoardArea.querySelectorAll(".edit-boardDetail-area");

            boardDetails.forEach((boardDetail) => {
                let boardDetailSort = boardDetail.dataset.boarddetailsort;
                let currentBoardDetailSort = parseInt(boardDetailSort, 10);

                if(currentBoardDetailSort >= newBoardDetail.boardDetailSort) {
                    boardDetail.dataset.boarddetailsort = currentBoardDetailSort + 1;
                }

                if(boardDetailSort == addedEditBoardDetailArea.dataset.boarddetailsort - 1) {
                    $(boardDetail).after(addedEditBoardDetailArea);
                    $(boardDetail).after(addedHr);
                }
            });
    }
    // 수정된 게시글 정보 변경
    $(".updateMemberImage").attr("src", contextPath + newBoardDetail.profileImage);
    $(".updateMemberName").html(newBoardDetail.memberName);
    $(".updateDate").html(currentTime());
    // 추가된 게시글에도 타이핑 함수 실행
    typing();

    // 게시글리스트에서도 수정한 회원의 정보 변경
    boards = document.querySelectorAll(".board");
    boards.forEach((board) => {
        if(board.dataset.boardno == newBoardDetail.boardNo) {
            console.log(board);
            $(board).find(".profile-image").find("img").attr("src", contextPath + newBoardDetail.profileImage);
            $(board).find(".user-name").html(newBoardDetail.memberName);
        }
    });
}

// 게시글 내용 삭제 웹소켓
deleteBoardDetailSock.onmessage = function(e) {
    const deletedBoardDetail = JSON.parse(e.data);

    boardDetailBoardArea = document.querySelector(".boardDetailBoard-area");
    if(deletedBoardDetail.boardNo == boardDetailBoardArea.dataset.boardno) {
        // 수정된 게시글 정보 변경
        $(".updateMemberImage").attr("src", contextPath + deletedBoardDetail.profileImage);
        $(".updateMemberName").html(deletedBoardDetail.memberName);
        $(".updateDate").html(currentTime());

        let boardDetails = boardDetailBoardArea.querySelectorAll(".edit-boardDetail-area");
        boardDetails.forEach((boardDetail) => {
            if(deletedBoardDetail.boardDetailNo == boardDetail.dataset.boarddetailno) {
                boardDetail.nextElementSibling.remove();
                boardDetail.remove();            
            }
        });
    }
    // 게시글리스트에서도 수정한 회원의 정보 변경
    boards = document.querySelectorAll(".board");
    boards.forEach((board) => {
        if(board.dataset.boardno == deletedBoardDetail.boardNo) {
            $(board).find(".profile-image").find("img").attr("src", contextPath + deletedBoardDetail.profileImage);
            $(board).find(".user-name").html(deletedBoardDetail.memberName);
        }
    });
};


// 이벤트 날짜 변경 웹소켓
updateEventDateSock.onmessage = function(e) {
    const changedBoardInfo = JSON.parse(e.data);
    // 수정된 게시글 정보 변경
    $(".updateMemberImage").attr("src", contextPath + changedBoardInfo.updateProfileImg);
    $(".updateMemberName").html(changedBoardInfo.updateMemberName);
    $(".updateDate").html(currentTime());
    $(".eventStartDate").val(changedBoardInfo.eventStartDate);
    $(".eventEndDate").val(changedBoardInfo.eventEndDate);

    // 게시글리스트에서도 수정한 회원의 정보 변경
    boards = document.querySelectorAll(".board");
    boards.forEach((board) => {
        if(board.dataset.boardno == changedBoardInfo.boardNo) {
            $(board).find(".profile-image").find("img").attr("src", contextPath + changedBoardInfo.updateProfileImg);
            $(board).find(".user-name").html(changedBoardInfo.updateMemberName);
            $(board).find(".boardListEventStartDate").html(changedBoardInfo.eventStartDate);
            $(board).find(".boardListEventEndDate").html(changedBoardInfo.eventEndDate);
        }
    });
};

// 게시글 제목 수정 웹소켓
boardListSock.onmessage = function(e) {
    const changedBoardInfo = JSON.parse(e.data);
    boardDetailBoardArea = document.querySelector(".boardDetailBoard-area");
    if(changedBoardInfo.boardNo == boardDetailBoardArea.dataset.boardno) {
        // 수정된 게시글 정보 변경
        $(".boardTitle").html(changedBoardInfo.boardTitle);
        $(".updateMemberImage").attr("src", contextPath + changedBoardInfo.updateProfileImg);
        $(".updateMemberName").html(changedBoardInfo.updateMemberName);
        $(".updateDate").html(currentTime());        
    }
    boards = document.querySelectorAll(".board");
    boards.forEach((board) => {
        const changedBoardTitle = board.querySelector(".boardListBoardTitle");

        if(changedBoardInfo.boardNo == board.dataset.boardno) {

            // 수정한 멤버 정보 반영
            $(board).find(".profile-image").find("img").attr("src", contextPath + changedBoardInfo.updateProfileImg);
            $(board).find(".user-name").html(changedBoardInfo.updateMemberName);
            board.dataset.pmno = changedBoardInfo.pmNo;
            // 수정된 제목 변경
            changedBoardTitle.innerHTML = changedBoardInfo.boardTitle;            
        }
    });
}

// 마우스 오버 함수
function mouseover(editBoardDetailArea) {
    $(editBoardDetailArea).find(".add-boardDetail").css("visibility", "visible");
    $(editBoardDetailArea).find(".updateDetailMember").css("visibility", "visible");
};

// 마우스 아웃 함수
function mouseout(editBoardDetailArea) {
    $(editBoardDetailArea).find(".add-boardDetail").css("visibility", "hidden");
    $(editBoardDetailArea).find(".updateDetailMember").css("visibility", "hidden");
};

// 게시글 내용 타이핑 함수
function typing() {    
    let boardDetails = document.querySelectorAll(".edit-boardDetail-area");
    boardDetails.forEach((boardDetail) => {        
        // 딜레이 1초 설정
        let typingTimer;
        const delay = 1000; // 1초

        boardDetail.addEventListener('input', function() {
            clearTimeout(typingTimer);
        });
        boardDetail.addEventListener('keyup', function() {
            console.log("타이핑");
            clearTimeout(typingTimer);
            
            typingTimer = setTimeout(function() {
                // 1초동안 아무런 동작이 없으면 로직 실행			
                updateBoardContent(boardDetail);			
            }, delay);		
        });
    })
}

// 게시물 제목 타이핑 함수
function titleTyping() {
    boardInfo = document.querySelector(".boardTitle");
    // 딜레이 1초 설정
    let typingTimer;
    const delay = 1000; // 1초

    boardInfo.addEventListener('input', function() {
        clearTimeout(typingTimer);
    });
    boardInfo.addEventListener('keyup', function() {
        clearTimeout(typingTimer);
        
        typingTimer = setTimeout(function() {
            // 1초동안 아무런 동작이 없으면 로직 실행			
            updateBoardTitle(boardInfo);			
        }, delay);		
    });
}

// 게시글 내용 변경 함수
function updateBoardContent(editBoardDetailArea) {

    console.log(boardNo);
    let boardDetailNo = $(editBoardDetailArea).data("boarddetailno");
    let boardContent = $(editBoardDetailArea).find(".note-editable").html().replace(/\n|\t/g, "");
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
};

// 게시글 제목 변경 함수
function updateBoardTitle(boardTitle) {
    console.log(boardNo);
    let changedBoardTitle = $(boardTitle).html().replace(/\n|\t/g, "");
    let board = {
        "boardNo" : boardNo,
        "workspaceNo" : workspaceNo,
        "boardTitle" : changedBoardTitle,
        "pmNo" : pmNo,
        "updateMemberName" : memberName,
        "updateProfileImg" : profileImage
    }
    console.log(board);
    console.log(JSON.stringify(board));

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

// 게시글 내용 추가버튼 함수
function addBoardDetailBtn(addBoardDetailBtn) {
    let boardDetail = $(addBoardDetailBtn).parent().parent(".edit-boardDetail-area");

    insertBoardDetail(boardDetail);
}

// 게시글 내용 추가 함수
function insertBoardDetail(boardDetail) {
    console.log(boardNo);
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

// 게시글 내용 삭제 함수
function deleteBoardDetail(editBoardDetailArea) {  
    console.log(boardNo);   
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

// 이벤트 시간 설정 함수
function updateEventDate(eventDate) {
    let eventStartDate = $(eventDate).find(".eventStartDate").val();
    let eventEndDate = $(eventDate).find(".eventEndDate").val();

    let board = {
        "boardNo" : boardNo,
        "workspaceNo" : workspaceNo,
        "pmNo" : pmNo,
        "updateMemberName" : memberName,
        "updateProfileImg" : profileImage,
        "eventStartDate" : eventStartDate,
        "eventEndDate" : eventEndDate
    }
    console.log(board);
    console.log(JSON.stringify(board));

    updateEventDateSock.send( JSON.stringify(board));

    
    let addEvent = {
        "pmNo" : projectNo,// 프로젝트 멤버 번호
        "calTitle" : $(".boardTitle").html(),// 캘린더 제목
        "calContent" : "", // 캘린더 내용
        "calColor" : '#1A73E8',// 배경 색상
        "startDate" : eventStartDate, // 일정 시작일
        "endDate" : eventEndDate,// 일정 종료일
        "calSt" : "N", // 일정 삭제 여부
        "boardNo" : boardNo
    }      
    console.log(addEvent);
    console.log(JSON.stringify(addEvent));
    calendarSock.send( JSON.stringify(addEvent));
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