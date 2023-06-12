package com.turtle.www.member.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.turtle.www.member.model.service.MemberService;
import com.turtle.www.member.model.vo.Member;


// @RestController // @Controller + @ResponseBody

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
    JavaMailSender mailSender;
	
	@Autowired
	private MemberService service;
	
	
	
	/** 로그인 세션이 있는 경우 바로 main페이지로 이동
	 * @return
	 */
	@GetMapping("/login")
	public String mainForward() {
		return "common/main";
	}
	
	/** 로그인(회원정보 가져오기 -> 세션)
	 * @return
	 */
	@PostMapping("/login")
	public String main(Member inputMember,
						Model model,
						RedirectAttributes ra,
						HttpServletResponse resp,
						HttpServletRequest req,
						@RequestParam(value="saveId", required=false) String saveId) {
		
		logger.info("로그인 기능 수행됨");
		Member loginMember = service.login(inputMember);
		
		if(loginMember != null) { // 로그인 성공 시
			logger.debug(loginMember + "로그인 성공시 로그인 멤버 정보");
			model.addAttribute("loginMember", loginMember); // == req.setAttribute("loginMember", loginMember);
		
			// 로그인 성공 시 무조건 쿠키 생성
			// 단, 아이디 저장 체크 여부에 따라서 쿠키의 유지시간을 조정
			
			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
		
			if(saveId != null) { // 아이디 저장 체크 되었을 때
				
				cookie.setMaxAge(60 * 60* 24 * 365); // 초단위 지정(1년)
			} else { // 체크되지 않았을 때
				cookie.setMaxAge(0); // 0초 -> 생성되자마자 사라짐 == 쿠키삭제
			}
			
			// 쿠키가 적용될 범위(경로) 지정
			cookie.setPath(req.getContextPath());
			
			// 쿠키를 응답 시 클라이언트에게 전달
			resp.addCookie(cookie);
		
			return "redirect:/";

		} else {
			// model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			// redirect 시에도 request scope로 세팅된 데이터가 유지될 수 있도록 하는 방법을 
			// Spring에서 제공해줌
			// -> RedirectAttributes 객체(컨트롤러 매개변수에 작성하면 사용 가능)
			return "redirect:/";
		}
		
	}
	
	
	/** 로그아웃
	 * @param status
	 * @return
	 */
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		logger.info("로그아웃 수행됨");
		status.setComplete(); // 세션이 할일이 완료됨 -> 없앰
		return "redirect:/";
	}
	
	
	
	
	/** 회원가입 페이지 이동
	 * @return
	 */
	@GetMapping("/signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	/** 아이디 찾기
	 * @return
	 */
	@GetMapping("/findAccount")
	public String findAccount() {
		return "member/findAccount";
	}
	
	/** 비밀번호 찾기 (마이페이지 회원 경우)
	 * @return
	 */
	@GetMapping("/findPassword")
	public String findPassword() {
		return "member/findPassword";
	}
	
	/** 비밀번호 찾기 (랜딩페이지 비회원 경우)
	 * @return
	 */
	@GetMapping("/changePw")
	public String changePw(@RequestParam("memNo") int memNo,
							Model model) {
		
		model.addAttribute("memNo", memNo);
		
		return "member/changePw";
	}
	
	/** 이메일 인증(회원인지 확인)
	 * @param inputEmail
	 * @return
	 */
	@ResponseBody
	@PostMapping("/findPassword")
	public String emailDupCheck(@RequestParam("inputEmail") String inputEmail,
								RedirectAttributes ra,
								Model model) {
		
		String memberEmail = service.emailDupCheck(inputEmail);
		
		return new Gson().toJson(memberEmail);
	}
	
	/** 인증번호 전송
	 * @param toEmail
	 * @return
	 */
	@ResponseBody
	@GetMapping("/sendEmail")
	public String sendEmail(@RequestParam("sendEmail") String sendEmail,
							Model model) throws Exception{
		
		int result = 0;
		
		int select = service.selectCertification(sendEmail);
		logger.debug("인증 받은적이 있는지 유무 확인 select = " + select);
		
		if(select > 0) {
			result = service.updateCertification(sendEmail);
			logger.debug("인증번호 수정(인증 받은적 있는경우) result = " + result);
			
			if(result > 0) {
				model.addAttribute("message", "이메일 발송완료");
			} else {
				model.addAttribute("message", "이메일 발송완료");
			}
			
		} else {
			result = service.insertCertification(sendEmail);
			logger.debug("인증번호 추가(인증 없는경우) result = " + result);
			
			if(result > 0) {
				model.addAttribute("message", "이메일 발송완료");
				
			} else {
				model.addAttribute("message", "이메일 발송 실패");			
			}
		}
		
		return new Gson().toJson(result);
	}

	/** 인증번호 확인
	 * @param certificationNumber
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/cNumberValidate")
	public String certificationNumber(@RequestParam("certificationNumber") String certificationNumber,
									Model model) throws Exception{
		int memNo = 0;
		
		memNo = service.certificationNumber(certificationNumber);
		
		if(memNo > 0) {
			model.addAttribute("memNo", memNo);
			
			logger.debug("인증번호 확인 후 회원 번호 조회 memberNo = " + memNo);
		} else {
			
			logger.debug("인증번호 확인 후 회원 번호 조회 memberNo = " + memNo);
		}
		
		return new Gson().toJson(memNo);
	}
	
	
	
	
	// 테스트용 로그인(나중에 반드시 삭제!!!!!!)
	@PostMapping("/testLogin")
	public String testLogin(Member inputMember,
									Model model,
									RedirectAttributes ra) {
		Member loginMember = service.login(inputMember);
		if(loginMember != null) {
			model.addAttribute("loginMember", loginMember);
			ra.addFlashAttribute("message", loginMember.getMemberName() + "테스트 로그인 성공");
			logger.info(loginMember.getMemberName() +" 로그인 성공");
			System.out.println(loginMember.getMemberName() +" 로그인 성공");
		} else {
			ra.addFlashAttribute("message", "테스트 로그인 실패");
			logger.info("로그인 실패");
			System.out.println("로그인 실패");
		}
		
		return "redirect:/";
	}
	
	
	
	
	
}
