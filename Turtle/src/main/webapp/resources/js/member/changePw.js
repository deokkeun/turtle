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


