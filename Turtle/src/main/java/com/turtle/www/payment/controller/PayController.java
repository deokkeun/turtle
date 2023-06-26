package com.turtle.www.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.turtle.www.calendar.controller.CalendarController;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.payment.model.service.PayService;
import com.turtle.www.payment.model.vo.Pay;

@Controller
@RequestMapping("/payment")
@SessionAttributes({"loginMember", "workspaceCount", "projectMemberCount", "paymentType", "projectNo", "payInfo", "payList"})
public class PayController {
	
	@Autowired
	private PayService service;
	
	// Iamport
	private IamportClient client = new IamportClient("impKey", "impSecret");
	
	Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	
	  @GetMapping("/payment")
	  public String showPaymentPage() {
		  return "payment/payment";
	  }
	
	/** 결제 페이지로 이동
	 * @return
	 */
	@GetMapping("/pay/{projectNo}")
	public String pay(@ModelAttribute("loginMember") Member loginMember,
						Model model,
						HttpServletResponse resp,
						@PathVariable("projectNo") int projectNo) {
		
		System.out.println("결제 페이지 이동");
//		-------------------------- 테스트 필요 없으면 삭제 예정 ------------------------------------
		// 프로젝트 번호로 
		// 워크스페이스 개수, 프로젝트 참여자 수 조회 
		int workspaceCount = service.workspaceCount(projectNo);
		int projectMemberCount = service.projectMemberCount(projectNo);
		// 워크스페이스 개수
		logger.debug("workspaceCount" + workspaceCount);
		// 프로젝트 참여자 수 조회 
		logger.debug("projectMemberCount" + projectMemberCount);
		model.addAttribute("workspaceCount", workspaceCount);
		model.addAttribute("projectMemberCount", projectMemberCount);
//		-------------------------- 테스트 필요 없으면 삭제 예정 ------------------------------------
		
		
		
		model.addAttribute("projectNo", projectNo);
		
		// 결제 정보(전체) 불러오기(결제 타입)
		Pay paymentType = service.paymentType(projectNo);
		model.addAttribute("paymentType", paymentType);
		// 결제 유형 상태 확인
		logger.debug("paymentType" + paymentType);
		
		return "payment/pay";
	}
	
	/** 아임포트 결제
	 * @param imp_uid
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/veryfyIamport/{imp_uid}")
	public IamportResponse<Payment> verifyIamportPOST(@PathVariable("imp_uid") String imp_uid) throws Exception {
		return client.paymentByImpUid(imp_uid);
	}
	
	/** 결제 성공 시
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@PostMapping("/complete")
	public int paymentComplete(@RequestBody Pay pay) throws Exception {
		
		// 토큰값 가져오기
		String token = service.getToken();
		
		logger.debug(token);
		

//		-------------------------- 정보 확인용 삭제 예정 ------------------------------------
		logger.debug("결제 정보" + pay);
		logger.debug("주문번호" + pay.getPayNo());
		logger.debug("프로젝트번호" + pay.getProjectNo());		
		logger.debug("결제타입" + pay.getPayType());
		logger.debug("결제자" + pay.getPayName());
		logger.debug("회원번호" + pay.getMemberNo());
		logger.debug("가격" + pay.getPrice());
		logger.debug("거래 고유번호" + pay.getImpUid());
//		-------------------------- 정보 확인용 삭제 예정 ------------------------------------

		// 가져온 토큰값으로 결제된 정보 조회
		String amount = service.paymentInfo(pay.getImpUid(), token);
		logger.debug("토큰값으로 결제 금액 확인 : " + amount);
		int result = 0;
		
		// 결제금제금액 저장 전(서버로 저장 전 가격 != REST API 통신 후 가져온 실제 결제 금액)
		if(pay.getPrice() != Long.parseLong(amount)) {
			result = 0;
			// 결제 취소
			service.paymentCancle(token, pay.getImpUid(), amount, "결제 금액 오류");
			return result;
		}
		
		// 결제정보 저장
		result = service.insertPay(pay);
		
		return result;
	}
	

	/** 결제 페이지로 이동
	 * @return
	 */
	@GetMapping("/payConfirm/{projectNo}")
	public String payConfirm(@PathVariable("projectNo") int projectNo, 
							Model model) {
		
		Pay payInfo = service.paymentType(projectNo);
		model.addAttribute("payInfo", payInfo);
		
		return "payment/payConfirm";
	}
	
	
	/** 결제 내역
	 * @return
	 */
	@GetMapping("/payList/{projectNo}")
	public String payList(@PathVariable("projectNo") int projectNo, 
							@ModelAttribute("loginMember") Member loginMember,
							Model model) {
		
		Map<String, Object> map = new HashMap<>();
		int memberNo = loginMember.getMemberNo();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		
		
		List<Pay> payList = service.payList(map);
		model.addAttribute("payList", payList);
		
		return "payment/payList";
	}
					
		
	// 결제취소
//	public int orderCancle(Pay payList) throws Exception {
	
		// imp_uid 값 조회 후(3일 이내 쿼리 문)
//		if(!orderList.getImp_uid().equals("")) {
			// 토큰값 가져오기
//			String token = service.getToken(); 
			
//			Long price = payList.getPrice();
//			Long refundPrice = price;
	
//			service.paymentCancle(token, payList.getImp_uid(), refundPrice+"", "환불");
//		}
//		결제 취소
//		return adminDAO.orderCancle((orderList.getOrderNum()));
//}
	
	


}
