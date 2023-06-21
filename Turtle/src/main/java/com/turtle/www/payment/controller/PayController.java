package com.turtle.www.payment.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.calendar.controller.CalendarController;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.payment.model.service.PayService;
import com.turtle.www.payment.model.vo.Pay;

@Controller
@RequestMapping("/payment")
@SessionAttributes({"loginMember", "workspaceCount", "projectMemberCount", "paymentType"})
public class PayController {
	
	  @GetMapping("/payment")
	  public String showPaymentPage() {
	    return "payment/payment";
	  }
	
	@Autowired
	private PayService service;
	
	Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	/** 결제 페이지로 이동
	 * @return
	 */
	@GetMapping("/pay/{projectNo}")
	public String pay(@ModelAttribute("loginMember") Member loginMember,
						Model model,
						HttpServletResponse resp,
						@PathVariable("projectNo") int projectNo) {
		
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
		
		// 결제 유형 상태 확인
		Pay paymentType = service.paymentType(projectNo);
		model.addAttribute("paymentType", paymentType);
		// 결제 유형 상태 확인
		logger.debug("paymentType" + paymentType);
		
		return "payment/pay";
	}
	
	/** 결제 성공 시
	 * @return
	 */
	@GetMapping("/payConfirm")
	public String payConfirm() {
		return "payment/payConfirm";
	}
	
	
	
	
	

}
