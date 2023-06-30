// 딜레이 1초 설정
let typingTimer;
const delay = 1000; // 1초

$(document).on("mouseover", ".edit-boardDetail-area", function(){mouseover($(this))});
$(document).on("mouseout", ".edit-boardDetail-area", function(){mouseout($(this))});
$(document).on("keydown", ".edit-boardDetail-area", function(){inputTyping()});
$(document).on("keyup", ".edit-boardDetail-area", function(){keyupTyping($(this))});

// 서머노트 활성화
$(document).ready(function() {
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

    let boardDetailNo = $(editBoardDetailArea).find(".boardDetail").data("boarddetailNo");
    let boardContent = $(editBoardDetailArea).find(".summernote");
    // 개행 제거
    const cleanedBoardContent = $(boardContent).html().replace(/\n|\t/g, "");

    board = {
        "boardNo" : boardNo,
        "pmNo" : pmNo,
        "updateMemberName" : memberName,
        "updateProfileImg" : profileImage
    };

    let boardDetail = {

        "boardNo" : boardNo,
        "boardDetailNo" : boardDetailNo,        
        "boardContent" : cleanedBoardContent
    };

    // JSON.parse(문자열) : JSON -> JS Object
    // JSON.stringify(객체) :  JS Object -> JSON
    console.log(board);
    console.log(JSON.stringify(board));
    console.log(boardDetail);
    console.log(JSON.stringify(boardDetail));

    // boardSock(웹소켓 객체)을 이용하여 메세지 보내기
    // boardSock.send(값) : 웹소켓 핸들러로 값을 보냄
    updateBoardDetailSock.send( JSON.stringify(board) );
    updateBoardDetailSock.send( JSON.stringify(boardDetail) );
}


