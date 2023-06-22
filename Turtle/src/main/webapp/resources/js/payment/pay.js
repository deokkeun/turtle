const memberNo = document.getElementById("memberNo");
const projectNo = document.getElementById("projectNo");

console.log(memberNo.value);
console.log(projectNo.value);

//-----------------------------------------------------------

// 결제 모달
function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setAttribute("id", "bg");
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.pay-modal-close').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });

    // 배경 레이어 클릭 시 모달 닫기
    bg.addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });


    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};



//-------------------------------------------------------


// document.querySelector("#login-modal-btn").addEventListener("click", function() {
//     // 모달창 띄우기
//     modal("pay-modal");
// });


//-------------------------------------------------------


// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "memberEmail"   : false,
    "memberName"    : false,
    "memberTel"     : false,
};


// 결제 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function payValidate() {

    // checkObj에 있는 모든 속성을 반복 접근하여
    // false가 하나라도 있는 경우에는 form태그 기본 이벤트 제거

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "memberEmail":     str="이메일이"; break;
            case "memberName":      str="이름이"; break;    
            case "memberTel":       str="전화번호가"; break;
            }

            str += " 유효하지 않습니다.";

            alert(str);

            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}



//-------------------------------------------------------


var payType;

const memberEmail = document.getElementById("memberEmail"); // 이메일 작성
const emailMessage = document.querySelector("#emailMessage"); // 이메일 유효성 검사

const memberName = document.getElementById("memberName"); // 이름 작성
const nameMessage = document.getElementById("nameMessage"); // 이름 유효성 검사

const memberTel = document.getElementById("memberTel"); // 전화번호 작성
const telMessage = document.getElementById("telMessage"); // 전화번호 유효성 검사

function reset() {
    memberEmail.value = "";
    memberName.value = "";
    telMessage.value = "";
}


function requestPay(Type) {

    // 초기화
    reset();

    // 모달창 띄우기
    modal("pay-modal");

    // 결제 타입
    payType = Type;

    const payModalType = document.getElementById("pay-modal-type");
    payModalType.innerText = Type;


    const payModalPrice = document.getElementById("pay-modal-price");
    const payModalIntro = document.getElementById("pay-modal-intro");
    const payModalWorkspace = document.getElementById("pay-modal-workspace");
    const payModalMember = document.getElementById("pay-modal-member");

    if(Type == 'Standard') {
        payModalPrice.innerText = " 8,900";
        payModalIntro.innerHTML = "<p>프로젝트를 여러팀과 진행하는</p><p><b>중간 규모팀에 추천</b>합니다</p>";
        payModalWorkspace.innerText = " 워크스페이스 최대 5개";
        payModalMember.innerText = " 멤버 초대 최대 10명";
    } else if(Type == 'Pro') {
        payModalPrice.innerText = " 12,900";
        payModalIntro.innerHTML = "<p>조직을 운영하는</p><p><b>대규모팀에 추천</b>합니다</p>";
        payModalWorkspace.innerText = " 워크스페이스 무제한";
        payModalMember.innerText = " 멤버 초대 제한 없음";
    }


    
    // 이메일 유효성 검사
    memberEmail.addEventListener("input", function(){

        // 입력이 되지 않은 경우
        if( memberEmail.value.length == 0 ){
            emailMessage.innerText = "이메일을 입력해주세요.";
            memberEmail.classList.remove("confirm", "error");

            checkObj.memberEmail = false; // 유효 X 기록
            return;
        }

        // 입력된 경우
        const regExp = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;

        if( regExp.test(memberEmail.value) ){ // 유효한 경우

            emailMessage.innerText = "사용 가능한 이메일 입니다.";
            memberEmail.classList.add("confirm");
            memberEmail.classList.remove("error");
            checkObj.memberEmail = true; // 유효 O 기록
            
        }else{
            emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
            memberEmail.classList.add("error");
            memberEmail.classList.remove("confirm");

            checkObj.memberEmail = false; // 유효 X 기록
        }

    });


    
    // 이름 유효성 검사
    memberName.addEventListener("input", function(){

        // 입력되지 않은 경우
        if(memberName.value.length == 0){
            nameMessage.innerText = "이름을 입력해주세요.";
            memberName.classList.remove("confirm", "error");

            checkObj.memberName = false; // 유효 X 기록
            return;
        }

        const regExp = /^[a-zA-Z0-9가-힣]{2,10}$/;

        if( regExp.test(memberName.value) ){ // 유효한 경우
            
            nameMessage.innerText = "사용 가능한 이름 입니다.";
            memberName.classList.add("confirm");
            memberName.classList.remove("error");
            checkObj.memberName = true; // 유효 O 기록


        }else{
            nameMessage.innerText = "이름 형식이 유효하지 않습니다.";
            memberName.classList.add("error");
            memberName.classList.remove("confirm");

            checkObj.memberName = false; // 유효 X 기록
        }

    });


    // 전화번호 유효성 검사
    // ** input 이벤트 **
    // -> 입력과 관련된 모든 동작(key관련, mouse관련, 붙여넣기)
    memberTel.addEventListener("input", function(){

        // 입력이 되지 않은 경우
        if(memberTel.value.length == 0){
            telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";

            //telMessage.classList.remove("confirm");
            //telMessage.classList.remove("error");
            memberTel.classList.remove("confirm", "error");

            checkObj.memberTel = false; // 유효하지 않은 상태임을 기록

            return;
        }

        // 전화번호 정규식
        const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

        if(regExp.test(memberTel.value)){ // 유효한 경우
            telMessage.innerText = "유효한 전화번호 형식입니다.";
            memberTel.classList.add("confirm");
            memberTel.classList.remove("error");

            checkObj.memberTel = true; // 유효한 상태임을 기록
            
        } else{ // 유효하지 않은 경우
            telMessage.innerText = "전화번호 형식이 올바르지 않습니다.";
            memberTel.classList.add("error");
            memberTel.classList.remove("confirm");

            checkObj.memberTel = false; // 유효하지 않은 상태임을 기록
        }
    });


}



//-------------------------------------------------------



function fromDate() {
    var today = new Date();
    var currentDate = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    var year = currentDate.getFullYear();
    var month = String(currentDate.getMonth() + 1).padStart(2, '0');
    var day = String(currentDate.getDate()).padStart(2, '0');
    var fromDate = year + month + day;
    return fromDate;
};
function toDate() {
    var today = new Date();
    var futureDate = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    var year = futureDate.getFullYear();
    var month = String(futureDate.getMonth() + 1).padStart(2, '0');
    var day = String(futureDate.getDate()).padStart(2, '0');
    var toDate = year + month + day;
    return toDate;
};


// 결제 부분 일정
const fDate = document.getElementById("from-date");
const tDate = document.getElementById("to-date");

fDate.innerHTML = fromDate() + " ~ ";
tDate.innerHTML = toDate();



//-------------------------------------------------------


var payInfo;

function pay() {

    if(payValidate()) {
            
        // 현재 시간을 기반으로 주문번호를 생성합니다.
        const now = new Date();
        const year = now.getFullYear().toString().slice(2);
        const month = (now.getMonth() + 1).toString().padStart(2, '0');
        const date = now.getDate().toString().padStart(2, '0');
        const hours = now.getHours().toString().padStart(2, '0');
        const minutes = now.getMinutes().toString().padStart(2, '0');
        const seconds = now.getSeconds().toString().padStart(2, '0');
        const milliseconds = now.getMilliseconds().toString().padStart(3, '0');
        
        // 주문번호를 문자열 형태로 생성합니다.
        const payNumberString = `${year}${month}${date}${hours}${minutes}${seconds}${milliseconds}`;
        
        // 주문번호를 숫자형으로 변환합니다.
        const payNo = Number(payNumberString);
        // 주문번호 생성 예시
        console.log(payNo); // 예시 출력: 230408112154951
        // alert(payNo);



        if(payType == 'Standard') {
            payInfo = {
                merchant_uid: payNo, //상점에서 생성한 고유 주문번호
                name : 'Standard',
                amount : 890,
                buyer_email : memberEmail.value,
                buyer_name : memberName.value,
                buyer_tel : memberTel.value,   //필수 파라미터 입니다.
                // buyer_addr : '서울특별시 강남구 삼성동',
                // buyer_postcode : '123-456',
                from : fromDate(), //YYYYMMDD
                to : toDate()   //YYYYMMDD
            }
        } else if(payType == 'Pro') {
            payInfo = {
                merchant_uid: payNo, //상점에서 생성한 고유 주문번호
                name : 'Pro',
                amount : 1290,
                buyer_email : memberEmail.value,
                buyer_name : memberName.value,
                buyer_tel : memberTel.value,   //필수 파라미터 입니다.
                // buyer_addr : '서울특별시 강남구 삼성동',
                // buyer_postcode : '123-456',
                from : fromDate(), //YYYYMMDD
                to : toDate()   //YYYYMMDD
            }
        }


        const IMP = window.IMP; // 생략 가능
        IMP.init("imp50444256"); // 예: imp00000000a

        IMP.request_pay({
            pg : 'html5_inicis.INIpayTest', //테스트 시 html5_inicis.INIpayTest 기재 
            pay_method : 'card',
            merchant_uid: payInfo.merchant_uid, //상점에서 생성한 고유 주문번호
            name : payInfo.name, // 상품명
            amount : payInfo.amount, // 가격
            buyer_email : payInfo.buyer_email, // 구매자 메일
            buyer_name : payInfo.buyer_name, // 구매자 이름
            buyer_tel : payInfo.buyer_tel,   // 구매자 전화번호 (필수 파라미터 입니다.)
            // buyer_addr : payInfo.buyer_addr, // 구매자 주소
            // buyer_postcode : payInfo.buyer_postcode, // 구매자 우편번호
            // m_redirect_url : 'http://localhost:8080/www/payment/payConfirm', 
            escrow : true, //에스크로 결제인 경우 설정
            vbank_due : 'YYYYMMDD', // 결제 기간 미지정시 30일
            // bypass : {
            //     acceptmethod : "noeasypay", // 간편결제 버튼을 통합결제창에서 제외(PC)
            //     P_RESERVED: "noeasypay=Y",  // 간편결제 버튼을 통합결제창에서 제외(모바일)
            //     acceptmethod: 'cardpoint',  // 카드포인트 사용시 설정(PC)
            //     P_RESERVED : 'cp_yn=Y',     // 카드포인트 사용시 설정(모바일)
            // },
            period : {
            from : payInfo.fromDate, //YYYYMMDD
            to : payInfo.toDate   //YYYYMMDD
            }
        }, function(rsp) { // callback 로직
            if(rsp.success) {
                uid = rsp.imp_uid;

                console.log(rsp);

                $.ajax({
                    url: contextPath + '/payment/veryfyIamport/' + rsp.imp_uid,
                    type: 'POST',
                    success: function(data) {
                        alert("정상결제 완료" + data);
                        console.log("결제 완료");
                        console.log(data);

                        if(payInfo.amount == data.response.amount) {
                            alert("금액 일치 ");


                            data = JSON.stringify({
                                "payNo" : rsp.merchant_uid, //주문번호
                                "projectNo" : projectNo.value, //프로젝트 번호(상품 번호)
                                "payType" : rsp.name, // 결제 타입
                                "payName" : rsp.buyer_name, //결제자
                                "memberNo" : memberNo.value, //회원번호
                                "price" : rsp.paid_amount, // 가격
                                "impUid" : rsp.imp_uid // 거래 고유번호(취소, 환불)
                            });

                            
                            $.ajax({
                                url: contextPath + '/payment/complete',
                                data: data,
                                type: 'POST',
                                dataType: 'JSON',
                                contentType: 'application/json',
                                success: function(result) {

                                    if(result > 0) {


                                    alert("주문정보 저장 성공");


                                    // 모달창 제거
                                    var modal = document.getElementById("pay-modal");
                                    let removeBg = document.getElementById("bg");
                                    // 모달 div 뒤에 희끄무레한 레이어
                                    modal.style.display = 'none';
                                    removeBg.remove();






                                        // 로딩 구현


                                        location.href = contextPath + '/payment/payConfirm/' + projectNo.value;// 결제 완료 페이지로 이동
                                        








                                    } else {
                                        alert("주문정보 저장 실패");
                                    }

                                },error: function(error) {
                                    alert("에러 발생! 관리자 문의 : 02-1234-1234");
                                }
                            });

                        } else {
                            alert("결제 도중 장애가 발생했습니다. 관리자에게 문의해주세요.");
                        }

                    }, error: function(error) {
                        alert("결제가 실패 되었습니다." + error);
                    }
                });

            } else {
                alert("결제가 취소되었습니다.");
            }

        });

    }

}
