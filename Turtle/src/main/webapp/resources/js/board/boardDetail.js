// 딜레이 1초 설정
let typingTimer;
const delay = 1000; // 1초

$(document).on("mouseover", ".edit-boardDetail-area", function(){mouseover($(this))});
$(document).on("mouseout", ".edit-boardDetail-area", function(){mouseout($(this))});


// 마우스 오버 함수
function mouseover(editBoardDetailArea) {
    $(editBoardDetailArea).find(".add-boardDetail").css("visibility", "visible");
    // 서머노트 쓰기 활성화
    $(editBoardDetailArea).find(".boardDetail").summernote({
        airMode: true,
        height: 21,                 // 에디터 높이
        minHeight: 21,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
    });
};


// 마우스 아웃 함수
function mouseout(editBoardDetailArea) {
    $(editBoardDetailArea).find(".add-boardDetail").css("visibility", "hidden");
    // 서머노트 쓰기 활성화
    $(editBoardDetailArea).find(".boardDetail").summernote({airMode: false});
};
