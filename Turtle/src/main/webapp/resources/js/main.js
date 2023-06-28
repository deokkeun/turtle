
var code = "";
const accessToken = document.getElementsByName("access_token");

window.onload = function() {

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
            redirect_uri: 'http://localhost:8080/www/member/login',
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




//섬머노트
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});





function currentTime() {
    const now = new Date(); // 현재 시간 정보를 저장하고 있는 객체 생성

    let hour = now.getHours();
    let min = now.getMinutes();
    let sec = now.getSeconds();

    // 얻어온 시간값이 10미만일 경우 앞에 0추가
    if(hour < 10) hour = "0" + hour;
    if(min < 10) min = "0" + min;
    if(sec < 10) sec = "0" + sec;

    return hour + " : " + min + " : " + sec;
}

// 페이지가 로딩되자마자 #clock에 현재 시간 출력
const clock = document.getElementById("clock");
clock.innerText = currentTime();

// #clock에 1초마다 현재 시간을 출력하도록 하는 코드를 작성
const interbal = window.setInterval(function() {
    clock.innerText = currentTime();
}, 1000);


// fullcalendar
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar-main');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
    });
    calendar.render();


    calendarEl.addEventListener("click", function() {
        location.href = contextPath + "/calendar/calendar/1/9";
    })
});
