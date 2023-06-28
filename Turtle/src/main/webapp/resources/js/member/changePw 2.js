// 입력창 글씨 동적으로 보이게 하는 변수 / [0] 새 비밀번호, [1] 새 비밀번호 확인
const input = document.getElementsByClassName("input");
const inputMessage = document.getElementsByClassName("input-message");

// 이메일 입력창
input[0].addEventListener("focus", function() {
    input[0].classList.add("confirm-border");
    inputMessage[0].classList.add("input-message-move");
})
input[0].addEventListener("focusout", function() {
    if(input[0].value.trim().length == 0) {
        input[0].classList.remove("confirm-border");
        inputMessage[0].classList.remove("input-message-move");
        inputMessage[0].classList.remove("confirm");
    }
});

// 인증번호 입력창
input[1].addEventListener("focus", function() {
    input[1].classList.add("confirm-border");
    inputMessage[1].classList.add("input-message-move");
})
input[1].addEventListener("focusout", function() {
    if(input[1].value.trim().length == 0) {
        input[1].classList.remove("confirm-border");
        inputMessage[1].classList.remove("input-message-move");
        inputMessage[1].classList.remove("confirm");
    }
});

// -----------------------------------------------------------------------------------



// 비밀번호 보이게 / 안보이게
$(".showPw").click(function() {
    console.log($(this).siblings());
    var newPw = $(this).siblings()[1];
    var showPwValue = $(this).siblings()[2];
    var imgTag = $(this).find("img")[0];

    if(showPwValue.getAttribute("value") == 0) {
        newPw.setAttribute("type", "text");
        showPwValue.setAttribute("value", "1");
        imgTag.setAttribute("src", contextPath + "/resources/images/member/eye.svg");
    } else {
        newPw.setAttribute("type", "password");
        showPwValue.setAttribute("value", "0");
        imgTag.setAttribute("src", contextPath + "/resources/images/member/eye-off.svg");
    }
});


// -----------------------------------------------------------------------------------



$(".input").keyup(function() {
    const input = document.getElementsByClassName("input");
    const inputMessage = document.getElementsByClassName("input-message");
    const confirmMessage = document.getElementById("confirm-message");
    const inputMessgaeRed = document.getElementById("input-message-red");

    const regExp = /^(?=.*[a-zA-Z]).(?=.*[0-9\!\@\#\-\_]).{8,20}$/;
    if($(this).val().length < 8) {
        confirmMessage.innerText = "너무 짧음";
        inputMessgaeRed.innerText = "";
        input[0].classList.add("confirm-border");
        inputMessage[0].classList.add("confirm");
        input[0].classList.remove("error-border");
        inputMessage[0].classList.remove("error");
    } else if($(this).val().length >= 8 && !regExp.test($(this).val())) {
        confirmMessage.innerText = "안전하지 않음";
        inputMessgaeRed.innerText = "더 안전한 비밀번호를 선택하세요. 문자, 숫자, 기호를 조합해 보세요.";
        input[0].classList.add("error-border");
        inputMessage[0].classList.add("error");
        input[0].classList.remove("confirm-border");
        inputMessage[0].classList.remove("confirm");
    } else {
        confirmMessage.innerText = "적합함";
        inputMessgaeRed.innerText = "";
        input[0].classList.add("confirm-border");
        inputMessage[0].classList.add("confirm");
        input[0].classList.remove("error-border");
        inputMessage[0].classList.remove("error");
    }
});








// -----------------------------------------------------------------------------------


// 경고 출력 + 포커스 + false반환 함수
function printAlert(el, message) {
    alert(message);
    el.focus();
    return false;
}

// 비밀번호 변경 제출 시 유효성 검사, 
function newChangePwValidate() {
    const newPw = document.getElementsByClassName("newPw")[0];
    const newPwConfirm = document.getElementsByClassName("newPwConfirm")[0];
    const regExp = /^(?=.*[a-zA-Z]).(?=.*[0-9\!\@\#\-\_]).{8,20}$/;

    // 새 비밀번호 미작성
    if(newPw.value.trim().length == 0) {
        return printAlert(newPw, "새 비밀번호를 입력해주세요.");
    }

    // 새 비밀번호 정규표현식이 맞지 않은 경우
    if(!regExp.test(newPw.value)) {
        return printAlert(newPw, "영어(필수), 숫자, 특수문자(!, @, #, -, _) 중 2개 이상을 조합하여 비밀번호를 작성해주세요. 8~20자");
    }

    // 새 비밀번호 확인 미작성
    if(newPwConfirm.value.trim().length == 0) {
        return printAlert(newPwConfirm, "새 비밀번호 확인을 입력해주세요.");
    }

    // 새 비밀번호 확인 정규표현식이 맞지 않은 경우
    if(!regExp.test(newPwConfirm.value)) {
        return printAlert(newPwConfirm, "영어(필수), 숫자, 특수문자(!, @, #, -, _) 중 2개 이상을 조합하여 비밀번호를 작성해주세요. 8~20자");
    }

    // 새 비밀번호 != 새 비밀번호 확인
    if(newPw.value != newPwConfirm.value) {
        return printAlert(newPwConfirm, "새 비밀번호가 일치하지 않습니다.");
    }
    return true;
}


