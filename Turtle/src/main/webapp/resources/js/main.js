var code = "";
const accessToken = document.getElementsByName("access_token");

onload = function() {

    // http://localhost:8080/www/member/login?
    // state=security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2-login-demo.example.com%2FmyHome&
    // code=4%2F0AbUR2VMYbQJYD9U0zHWzuWs_W-4bOr927Bu-VvOsuBafqW6l7WZ6viWurRlDlMiGPZ1fvA&
    // scope=email+openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email&
    // authuser=0&
    // prompt=consent

    console.log(window.location.search);

    const searchParams = new URLSearchParams(window.location.search);

    for(const param of searchParams) {
        if(param[0] == 'code') {
            console.log(param[0]);
            console.log(param[1]);
            code = param[1];
            console.log("정상 코드 : " + code);
        }
    }

    $.ajax({
        url: 'https://oauth2.googleapis.com/token',
        type: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        data: {
            code: code,
            client_id: '713601013116-33sqneo96i1er8o2e6bs5a8o5522k2rq.apps.googleusercontent.com',
            client_secret: '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',
            redirect_uri: 'http://localhost:8080/login/oauth2/google',
            grant_type: 'authorization_code'
        },
        success: function(response) {
            // 성공한 경우의 처리 로직
            console.log("로그인 성공");
            console.log(response);
            console.log(response.access_token);
            accessToken[0].value = response.access_token;
            
        },
        error: function(error) {
            // 에러 발생 시의 처리 로직
            console.error(error);
        }
      });
}


// 회원 탈퇴
function deleteAccountValidate() {
    const memberPw = document.getElementById("memberPw");
    const agree = document.getElementById("agree");

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

    // 모달창 열기
    openModal();

    return false; 
}

function openModal() {
    const memberPw = document.getElementById("memberPw");
    const agree = document.getElementById("agree");

    // 비밀번호 미작성 또는 동의 체크를 하지 않은 경우 모달 창 열기를 막음
    if (memberPw.value.trim().length == 0 || !agree.checked) {
        return;
    }

    var modal = document.getElementById("modal");
    modal.style.display = "block";
}

function closeModal() {
    var modal = document.getElementById("modal");
    modal.style.display = "none";
}

function confirmDelete() {
   

    // 모달창 닫기
    closeModal();
}