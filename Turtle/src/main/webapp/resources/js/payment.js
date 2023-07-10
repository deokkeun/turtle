document.getElementById('payment-form').addEventListener('submit', handlePayment);

function handlePayment(event) {
  event.preventDefault();

  // 결제 정보 가져오기
  const paymentInfo = document.getElementById('payment-info').value;
  const paymentMethod = document.getElementById('payment-method').value;
  const paymentAmount = document.getElementById('payment-amount').value;

  // 결제 정보를 이용한 로직 구현

  console.log("결제 정보:", paymentInfo);
  console.log("결제 수단:", paymentMethod);
  console.log("결제 금액:", paymentAmount);
}


