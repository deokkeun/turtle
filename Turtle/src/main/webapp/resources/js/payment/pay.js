
function kakaoPay() {

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
    console.log("payNo");
    console.log("결제 번호 날라갑니다" + payNo);



  	// 주문번호 생성 예시
	console.log(payNo); // 예시 출력: 230408112154951



    // 결제정보 모두 추가 후 카카오 결제 시도	

    // 백단에서 상품 데이터 긁어오기 선행 후 카카오페이 결제 요청
    const adminkey = "";
    $.ajax({
        url : "https://kapi.kakao.com/v1/payment/ready",
        type: "post",
        headers : {Authorization : "KakaoAK " + adminkey},
        dataType : "JSON",
        data: {
            cid: "TC0ONETIME",
            partner_order_id: '${payNo}',
            partner_user_id: 'Turtle',
            item_name: 'Standard',
            quantity: '12,900원',
            total_amount: '12,900원',
            tax_free_amount: 500,
            approval_url: "http://localhost:8080/www/payment/pay",
            cancel_url: "http://localhost:8080/www/payment/pay",
            fail_url: "http://localhost:8080/www/payment/pay"
        },
        success: function(result) {
            console.log("카카오페이 결제 성공");
            window.open(result.next_redirect_pc_url);
        },
        error: function() {
            alert("카카오페이 결제 실패");
        }
    });

}