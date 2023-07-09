/****************** 네이버 로그인 *******************/
var naver_id_login = new naver_id_login("aQpBvST4iYdjSLDbWXWl", "http://127.0.0.1:8080/www/member/callback");
// 접근 토큰 값 출력

naver_id_login.get_naver_userprofile("naverSignInCallback()");

// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

function naverSignInCallback() {
  
  // 네이버 사용자 프로필 조회
  let token = naver_id_login.oauthParams.access_token;
  let email = naver_id_login.getProfileData('email');
  let name = naver_id_login.getProfileData('name');
  let profileImg = naver_id_login.getProfileData('profile_image');
  
  console.log("토근 : " + token);
  console.log("이메일 : " + email);
  console.log("이름 : " + name);
  console.log("프로필 : " + profileImg);




  $.ajax({
    url : "dupCheckNaver",
    type : "post",
    data : {"email" :email, "name" : name},
    success : function (data){

      dupCheck(data, email, name, token, profileImg);
    }
  });
  

};

// 중복 여부 체크
function dupCheck(datas, email, name , token, profileImg){

  if(datas == 1){
    swal.fire("이메일이 중복되었습니다. 확인해주세요");
  }else{
    naverCheck(email, name ,token,profileImg);
  }
};

// 네이버 DB가입처리
function naverSignUp(email, name, profile_image, token){
  
  $.ajax({
    url : "naverSignUp",
    type : "post",
    data: {"socialEmail" :email, "memberName" : name, "profileImage" : profile_image, "accessToken" : token},
    success : function(){
        opener.location.href= contextPath + '/www'; 
        window.close();
    }
});
  
}
//토큰 교체
function changeToken(email,token){
  
  $.ajax({
    url : "changeToken",
    type : "post",
    data: {"socialEmail" :email, "accessToken" : token},
    success : function(){
        opener.location.href= contextPath + '/www'; 
        window.close();
    }
  });
  
};

function naverCheck(email, name, token, profileImg){
  $.ajax({
    url : "checkNaverFl",
    type : "post",
    data: {"email" :email},
    success : function(data){
      if(data == 0) { // 만약 가입된 멤버가 없으면
        naverSignUp(email, name, profileImg, token);
      }else { // 가입된 멤버가 있으면 
        changeToken(email,token);
      }
    }
  });
}