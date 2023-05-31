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