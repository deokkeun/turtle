// 슬라이드 박스
const findPasswordBox = document.getElementById("findPassword-box");
// 다음버튼 / [0] 이메일 인증번호 전송, [1] 인증번호 확인 -> 비밀번호 변경
const findNext = document.getElementsByClassName("find-next");
// [0] 이메일 입력, [1] 인증번호 입력
const inputType = document.getElementsByClassName("input-type");
// 입력창 글씨 동적으로 보이게 하는 변수 / [0] 이메일, [1] 인증번호
const inputMessage = document.getElementsByClassName("input-message");


let checkInterval;
let min = 4;
let sec = 59;
const cMessage = document.getElementById("cMessage");

// 이메일 인증번호 전송
findNext[0].addEventListener("click", function() {
	if(inputType[0].value.length == 0) {
		alert("이메일을 작성해주세요.");
	}
    // 이메일 확인
    const regExp = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    if(regExp.test(inputType[0].value)) {
        $.ajax({
            url: "memberConfirmation",
            data: {"inputEmail" : inputType[0].value},
            type: "POST",
            dataType: "JSON",
            success: function(memberEmail) {
                alert("ajax 통신 성공" + memberEmail);
    
                if(memberEmail != null) {

                    // 이메일 전송
                    $.ajax({
                        url : "sendPasswordEmail",
                        data : {"sendEmail" : inputType[0].value},
                        type : "GET",
                        success : function(result) {

                            if(result > 0) {
                                alert("email 전송성공 ajax result : " + result);
                            } else {
                                alert("email 전송성공 ajax result : " + result);
                            }
                                
                        },
                        error : function() {
                            alert('전송 실패!');
                        }
                    })

                    // 가입한 이메일인 경우 인증페이지로 이동
                    findPasswordBox.style.translate = -50 + "%";

                    // 이메일 인증 시간
                    cMessage.innerText = "5:00";
                    min = 4;
                    sec = 59;

                    cMessage.classList.remove("confirm");
                    cMessage.classList.remove("error");

                    
                    cMessage.classList.add("confirm");

                    checkInterval = setInterval(function() {
                        if(sec < 10) {
                            sec = "0" + sec;
                        }
                        cMessage.innerText = min + ":" + sec;
                        if(Number(sec) === 0) {
                            min--;
                            sec = 59;
                        } else {
                            sec--;
                        }

                        if(min === -1) {
                            cMessage.classList.add("error");
                            cMessage.innerText = "인증번호가 만료되었습니다.";

                            clearInterval(checkInterval);
                        }

                    }, 1000);

                    alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");


                } else {
                    alert("이메일을 다시 확인해주세요." + memberEmail);
                }
            },
            error: function(error) {
                alert("ajax 통신 실패 이메일 정규표현식 확인하기 로그인 멤버 아이디 일치 확인하기");
            }
        });

    } else {
        alert("이메일 정규표현식에 맞지 않음");
    }

});



let memberNo = 0;

// 인증번호 확인
findNext[1].addEventListener("click", function() {
    // 회원번호 초기화
    memberNo = 0;

    if(inputType[1].value.length == 0) {
		alert("인증번호를 입력해주세요.");
	}
    // 인증번호 확인
    const regExp = /^[\w]{6}$/;

    if(regExp.test(inputType[1].value)) {
        $.ajax({
            url: "cNumberValidate",
            data: {"certificationNumber" : inputType[1].value},
            type: "POST",
            dataType: "JSON",
            success: function(result) {
                if(result > 0) {
                    alert("ajax 통신 성공 인증 확인 성공 memberNo = " + result);
                    return location.href = contextPath + "/member/changePw?memNo=" + result;
                    
                } else {
                    alert("ajax 통신 성공 인증 확인 실패 memberNo = " + result);
                    return location.href = contextPath + "/member/changePw?memNo=" + result;
                }
            },
            error: function(error) {
                alert("ajax 통신 실패 인증 실패");
                // 에러페이지

                return location.href = contextPath + "/member/changePw?memNo=" + result;
            }
        });

    }

});




// 이메일 입력창
inputType[0].addEventListener("focus", function() {
    inputType[0].classList.add("confirm-border");
    inputMessage[0].classList.add("input-message-move");
})
inputType[0].addEventListener("focusout", function() {
    if(inputType[0].value.trim().length == 0) {
        inputType[0].classList.remove("confirm-border");
        inputMessage[0].classList.remove("input-message-move");
    }
});

// 인증번호 입력창
inputType[1].addEventListener("focus", function() {
    inputType[1].classList.add("confirm-border");
    inputMessage[1].classList.add("input-message-move");
})
inputType[1].addEventListener("focusout", function() {
    if(inputType[1].value.trim().length == 0) {
        inputType[1].classList.remove("confirm-border");
        inputMessage[1].classList.remove("input-message-move");
    }
});