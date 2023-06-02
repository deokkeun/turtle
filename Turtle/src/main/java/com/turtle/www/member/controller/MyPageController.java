package com.turtle.www.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.turtle.www.member.model.service.MyPageService;
import com.turtle.www.member.model.vo.Member;

@Controller
@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"})
public class MyPageController {

	private Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MyPageService service;
	
	/** 마이페이지 이동
	 * @return
	 */
	@GetMapping("/info")
	public String info() {
		return "member/myPage-info";
	}
	
	/** 프로필 수정
	 * @return
	 * @throws IOException 
	 */
	@PostMapping("/profile")
	public String updateProfile(@ModelAttribute("loginMember") Member loginMember,
								@RequestParam("uploadImage") MultipartFile uploadImage,
								@RequestParam Map<String, Object> map,
								HttpServletRequest req,
								RedirectAttributes ra) throws IOException {
		
		// 웹 접근 경로 (/www/resources/images/memberProfile)
		String webPath = "/resources/images/memberProfile/";
		
		// 서버 저장 폴더 경로
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		// 경로 2개, 이미지, delete, 회원번호 map 담기
		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("uploadImage", uploadImage);
		map.put("memberNo", loginMember.getMemberNo());
		
		int result = service.updateProfile(map);
		
		String message = null;
		
		if(result > 0) {
			message = "프로필 이미지가 변경되었습니다.";
			
			// DB - 세션 동기화(MyPageServletImpl에서 uploadImage파일명을 변경해서 profileImage에 담아줌)
			loginMember.setProfileImage((String)map.get("profileImage"));
		} else {
			message = "프로필 이미지 변경 실패...";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:/member/myPage/info";
	}
	
	/** 현재 비밀번호 확인(ajax) 완료 -> 비밀번호 변경 페이지로 이동
	 * @return
	 */
	@PostMapping("/changePw")
	public String currentPwCheck(@ModelAttribute("loginMember") Member loginMember,
								String currentPw,
								Model model) {
		
		int memberNo = loginMember.getMemberNo();
		
		int result = service.currentPwCheck(memberNo, currentPw);
		
		if(result > 0) {
			// 비밀번호 일치 -> 비밀번호 변경 페이지로 이동
			return "member/myPage-changePw";
			
		} else {
			model.addAttribute("message", "비밀번호가 일치하지 않아 마이페이지로 돌아옵니다.");
			// 비밀번호 불일치 시 마이페이지 이동
			return "member/myPage-info";
		}
	}
	
	/** 회원 탈퇴 이동
	 * @return
	 */
	@GetMapping("/deleteAccount")
	public String deleteAccount() {
		return "member/myPage-deleteAccount";
	}
	
	/** 회원 탈퇴
	 * @param model
	 * @return
	 */
	@PostMapping("/deleteAccount")
	public String deleteAccount(@ModelAttribute("loginMember") Member loginMember,
							Model model,
							RedirectAttributes ra,
							SessionStatus status,
							HttpServletRequest req,
							HttpServletResponse resp) {
	
	
		// 회원 탈퇴 서비스 호출
		int result = service.deleteAccount(loginMember);
		
		
		if(result == 1) {
			// 탈퇴 성공 -> 메인 페이지
			ra.addFlashAttribute("message", "회원탈퇴 성공!");
			// 세션 없애기
			status.setComplete();

			// 쿠키 없애기
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			cookie.setPath(req.getContextPath());
			resp.addCookie(cookie);
			
			return "redirect:/";
		} else {
			// 탈퇴 실패 -> main
			model.addAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
			return "member/myPage-deleteAccount";
		}
	}
	
	
	
	
	
	
}