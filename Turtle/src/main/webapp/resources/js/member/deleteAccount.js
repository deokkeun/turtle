// 입력창 글씨 동적으로 보이게 하는 변수 / [0] 새 비밀번호, [1] 새 비밀번호 확인
const inputPw = document.getElementsByClassName("inputPw")[0];
const inputMessage = document.getElementsByClassName("inputPw-message")[0];

// 이메일 입력창
inputPw.addEventListener("focus", function() {
    inputPw.classList.add("confirm-border");
    inputMessage.classList.add("inputPw-message-move");
})
inputPw.addEventListener("focusout", function() {
    if(inputPw.value.trim().length == 0) {
        inputPw.classList.remove("confirm-border");
        inputMessage.classList.remove("inputPw-message-move");
        inputMessage.classList.remove("confirm");
    }
});


// -----------------------------------------------------------------------------


const memberPw = document.getElementById("memberPw");
const agree = document.getElementById("agree");
const modal = document.getElementById("modal");
const closeModal = document.getElementById("closeModal");

// 회원 탈퇴
const deleteAccount = document.getElementById("deleteAccount-btn");
deleteAccount.addEventListener("click", function() {

    // 비밀번호 미작성
    if (memberPw.value.trim().length == 0) {
        alert("비밀번호를 입력해주세요.");
        memberPw.focus();
        return false;
    }

    // 약관 동의 체크 여부
    // - 체크박스요소.checked  : 체크 시 true, 해제 시 false 반환
    if (!agree.checked) { // 체크를 안했을 때
        alert("약관 동의 후 탈퇴 버튼을 클릭해주세요.");
        agree.focus();
        return false;
    }

    modal.style.display = "block";
});

closeModal.addEventListener("click", function() {
    modal.style.display = "none";
});