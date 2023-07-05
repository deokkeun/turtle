
// var code = "";
// const accessToken = document.getElementsByName("access_token");



// if(confirm("날씨 조회 서비스를 이용하시려면 동의 해주세요.")) {
//     function success({ coords, timestamp }) {
//         const latitude = coords.latitude;   // 위도
//         const longitude = coords.longitude; // 경도
        
//         alert(`위도: ${latitude}, 경도: ${longitude}, 위치 반환 시간: ${timestamp}`);
//     }
    
//     function getUserLocation() {
//         if (!navigator.geolocation) {
//             throw "위치 정보가 지원되지 않습니다.";
//         }
//         navigator.geolocation.watchPosition(success);
//     }
    
//     getUserLocation();
// }




// 캘린더 메인페이지 내용 불러오기
window.onload = function() {

    // 메인페이지 들어오면 캘린더 남은 일정 불러오기
    $.ajax({
        url: contextPath + "/calendar/schedule",
        data: {
            "projectNo" : projectNo
        },
        type: "POST",
        dataType: "JSON",
        success: function(schedule) {   

            const scheduleBox = document.getElementById("schedule-box");

            console.log(schedule);

            // 남은 일정이 없을때
            if(schedule.length == 0) {
                return true;
            }

            scheduleBox.style.display = "block";

            // 남은 일정이 있을때
            schedule.forEach(element => {
                const schedule = document.getElementById("schedule");

                const div = document.createElement('div');
                div.style.padding = "10px";
                div.style.margin = "5px";
                div.style.backgroundColor = element.calColor;

                // var str = "";
                // if(element.calTitle.length > 5) {
                //     str = element.calTitle.substr(0, 10);
                //     str += "...";
                // }

                // element.calTitle(풀 제목), str(남은일정 제목 자르기)
                div.innerHTML = "<div class='jb-title'><div class='calTitle'>" + element.calTitle + "</div><div class='calDate'>" + element.startDate + "</div><div class='calDate'>" + element.endDate + "</div></div>"
                + "<div class='jb-text'>" + element.calContent + "</div>";
                schedule.append(div);
                
            });
        },
        error: function() {
            alert("실행 안됨");
        }










        

    })



    // google로그인 임시
    // http://localhost:8080/www/member/login?
    // state=security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2-login-demo.example.com%2FmyHome&
    // code=4%2F0AbUR2VMYbQJYD9U0zHWzuWs_W-4bOr927Bu-VvOsuBafqW6l7WZ6viWurRlDlMiGPZ1fvA&
    // scope=email+openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email&
    // authuser=0&
    // prompt=consent

    // console.log(window.location.search);

    // const searchParams = new URLSearchParams(window.location.search);

    // for(const param of searchParams) {
    //     if(param[0] == 'code') {
    //         console.log(param[0]);
    //         console.log(param[1]);
    //         code = param[1];
    //         console.log("정상 코드 : " + code);
    //     }
    // }

    // $.ajax({
    //     url: 'https://oauth2.googleapis.com/token',
    //     type: 'POST',
    //     contentType: 'application/x-www-form-urlencoded',
    //     data: {
    //         code: code,
    //         client_id: '713601013116-33sqneo96i1er8o2e6bs5a8o5522k2rq.apps.googleusercontent.com',
    //         client_secret: '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',
    //         redirect_uri: 'http://localhost:8080/www/member/login',
    //         grant_type: 'authorization_code'
    //     },
    //     success: function(response) {
    //         // 성공한 경우의 처리 로직
    //         console.log("로그인 성공");
    //         console.log(response);
    //         console.log(response.access_token);
    //         accessToken[0].value = response.access_token;
            
    //     },
    //     error: function(error) {
    //         // 에러 발생 시의 처리 로직
    //         console.error(error);
    //     }
    //   });
}





// 메인페이지 시간
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




// 채팅창 팝업 (프로젝트 넘버는 나중에 변수 넣어서 바꿔주기)
function join() {
    var url = "../chat/chatRoomList/1";		
    var title = "popup";
    var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400,location=no, height=400, top=1000,left=1500"; 
  
  window.open(url,title,status); 
};
