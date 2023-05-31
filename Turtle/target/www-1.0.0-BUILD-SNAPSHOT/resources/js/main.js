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
            client_id: '584967116999-s1skvhb03k99ueq3l69rhnbbrjc6c5bm.apps.googleusercontent.com',
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