// 로그인 클릭 시 이메일 포커스
onload = function() {
   document.getElementById("login-modal-btn").addEventListener("click", function() {
        const memberEmail = document.getElementsByName("memberEmail");
        memberEmail[0].focus();
   });
};


// 아이디 저장 체크박스가 체크 되었을 때 이벤트 처리

// radio, checkbox 체크 시 change 이벤트 발생
document.getElementById("saveId").addEventListener("change", function(){

    // 체크 여부 확인
    console.log(this.checked)
    // this : change 이벤트가 발생한 요소(체크박스)
    // 체크박스요소.checked   :  체크 여부 반환(true/false)

    // 체크박스요소.checked = true;  : 체크박스 체크
    // 체크박스요소.checked = false; : 체크박스 체크 해제


    if( this.checked ){ // 체크박스가 체크된 경우

        const str = "개인 정보 보호를 위해 개인 PC에서의 사용을 권장합니다. 개인 PC가 아닌 경우 취소를 눌러주세요.";

        //confirm(str) // 확인(true) / 취소(false) 대화상자

        if( !confirm(str)  ){ // 취소를 눌렀을 때
            this.checked = false; // 체크 해제
        }
    }
});



//-----------------------------------------------------------

// 로그인 모달 테스트
function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);


    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.login-modal-close').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });
    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};



//-------------------------------------------------------


document.querySelector("#login-modal-btn").addEventListener("click", function() {
    // 모달창 띄우기
    modal("login-modal");
});


//-------------------------------------------------------


// 로그인 시 이메일(아이디)/비밀번호 입력 확인

// -> 미작성 시 alert() 이용해서 메세지를 출력하고
//    로그인 form 태그의 제출을 막는 기본 이벤트 제거 진행

function loginValidate(){ // 로그인 유효성 검사
    // validate : 유효하다    
    // invalidate : 무효하다    

    // 이메일 입력 input 요소 
    const memberEmail = document.getElementsByName("memberEmail")[0];

    // 비밀번호 입력 input 요소
    const memberPw = document.getElementsByName("memberPw")[0];


    // 이메일이 입력되지 않은 경우 false를 반환
    if( memberEmail.value.trim().length == 0 ){
        // 문자열.trim() : 문자열 양쪽 공백을 제거
        // 문자열.length : 문자열 길이(몇 글자?)

        alert("이메일을 입력해주세요.");
        memberEmail.value = ""; // 이메일 input에 입력된 내용을 모두 삭제
        memberEmail.focus(); // 이메일 input에 포커스를 맞춰줌
        return false; // 기본 이벤트 제거를 위해 false 반환
    }

    // 비밀번호를 입력하지 않은 경우 false 반환
    if(memberPw.value.trim() == ""){
        alert("비밀번호를 입력해주세요.");
        memberPw.value = "";
        memberPw.focus();
        return false;
    }


    return true; // form 태그 기본 이벤트 정상 수행
}
