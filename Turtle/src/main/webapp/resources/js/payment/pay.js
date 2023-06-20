function requestPay() {

    // const projectNo = document.getElementById("projectNo");

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
    alert(payNo);

    // const IMP = window.IMP; // 생략 가능
    // IMP.init(""); // 예: imp00000000a

    // IMP.request_pay({
    //     pg : 'html5_inicis.INIpayTest', //테스트 시 html5_inicis.INIpayTest 기재 
    //     pay_method : 'card',
    //     merchant_uid: payNo, //상점에서 생성한 고유 주문번호
    //     name : '주문명:Standard',
    //     amount : 8900,
    //     buyer_email : 'test@gmail.com',
    //     buyer_name : '구매자',
    //     buyer_tel : '010-1234-5678',   //필수 파라미터 입니다.
    //     buyer_addr : '서울특별시 강남구 삼성동',
    //     buyer_postcode : '123-456',
    //     m_redirect_url : 'http://localhost:8080/www/payment/payConfirm',
    //     escrow : true, //에스크로 결제인 경우 설정
    //     vbank_due : 'YYYYMMDD', // 결제 기간 미지정시 30일
    //     // bypass : {
    //     //     acceptmethod : "noeasypay", // 간편결제 버튼을 통합결제창에서 제외(PC)
    //     //     P_RESERVED: "noeasypay=Y",  // 간편결제 버튼을 통합결제창에서 제외(모바일)
    //     //     acceptmethod: 'cardpoint',  // 카드포인트 사용시 설정(PC)
    //     //     P_RESERVED : 'cp_yn=Y',     // 카드포인트 사용시 설정(모바일)
    //     // },
    //     period : {
    //     from : "20230618", //YYYYMMDD
    //     to : "20230720"   //YYYYMMDD
    //     }
    // }, function(rsp) { // callback 로직

    //     // location.href="";
    //     console.log(rsp);

    //     //* ...중략... *//
    // });

}