
// --------------------------------------------------------------

// 회원 프로필 이미지 변경(미리보기)
const inputImage = document.getElementById("input-image");

if(inputImage != null) {

    inputImage.addEventListener("change", function() {

        if(this.files[0] != undefined) {

            const reader = new FileReader();

            reader.readAsDataURL(this.files[0]);
            
            reader.onload = function(e) {
                const profileImage = document.getElementById("profile-image");

                profileImage.setAttribute("src", e.target.result);

                document.getElementById("delete").value = 0;
            }
        }

    });
}


// 이미지 선택 확인
function profileValidate() {
    const inputImage = document.getElementById("input-image");
    const del = document.getElementById("delete");

    if(inputImage.value == "" && del.value == 0) {
        return false;
    }

    return true;
}

// 프로필 이미지 삭제 버튼
document.getElementById("delete-image").addEventListener("click", function() {

    const del = document.getElementById("delete");

    if(del.value == 0) { // 눌리지 않았을 경우
        document.getElementById("profile-image").setAttribute("src", contextPath + "/resources/images/memberProfile/member.png");
    }

    document.getElementById("input-image").value = "";

    del.value = 1;
});

// --------------------------------------------------------------


// 비밀번호 입력창
const currentPw = document.getElementsByClassName("currentPw")[0];
const currentPwValue = document.getElementsByClassName("currentPw-value")[0];

currentPw.addEventListener("focus", function() {
    currentPw.classList.add("confirm-border");
    currentPwValue.classList.add("currentPw-value-move");
    currentPwValue.classList.remove("currentPw-value");
})
currentPw.addEventListener("focusout", function() {
    if(currentPw.value.trim().length == 0) {
        currentPw.classList.remove("confirm-border");
        currentPwValue.classList.add("currentPw-value");
        currentPwValue.classList.remove("currentPw-value-move");
    }
});


// 현재 비밀번호 제출 시 유효성 검사
function currentPwValidate() {
    // 영어(대,소)필수, (숫자or특수문자) 2개 조합으로 유효성 검사 -> 8~20자
    const regExp = /^(?=.*[a-zA-Z]).(?=.*[0-9\!\@\#\-\_]).{8,20}$/;
    const currentPwMessage = document.getElementById("currentPwMessage");
    
    if(currentPw.value.trim().length == 0) {
        currentPwMessage.innerHTML = "<span style='color: red;'><img src='" + contextPath + "/resources/images/member/exclamation.svg' alt='exclamation'>비밀번호 입력</span>";
        currentPw.classList.add("error-border");
        currentPwValue.classList.add("error");
        currentPwMessage.classList.add("error");
        return false;
    } else {

        if(regExp.test(currentPw.value)) {
            return true;

        }else {
            currentPwMessage.innerHTML = "<span style='color: red;'><img src='" + contextPath + "/resources/images/member/exclamation.svg' alt='exclamation'>잘못된 비밀번호입니다.<br>다시 시도하거나 비밀번호 찾기를 클릭하여 재설정 하세요.</span>";
            currentPw.classList.add("error-border");
            currentPwValue.classList.add("error");
            currentPwMessage.classList.add("error");
            return false;
        }
    }
}

// 비밀번호 보이게 / 안보이게
document.getElementById("showPw").addEventListener("click", function() {
    const currentPw = document.getElementsByClassName("currentPw")[0];
    const showPwValue = document.getElementById("showPw-value");
    // 비밀번호 안보이게
    if(showPwValue.value == 0) {
        currentPw.setAttribute('type', 'text');
        showPwValue.value = 1;
    } else {
        currentPw.setAttribute('type', 'password');
        showPwValue.value = 0;
    }

});

// --------------------------------------------------------------
