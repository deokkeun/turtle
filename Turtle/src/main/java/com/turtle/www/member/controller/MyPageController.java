package com.turtle.www.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
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
@SessionAttributes({"loginMember", "daysBetween"})
public class MyPageController {

	private Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MyPageService service;
	
	/** 마이페이지 이동
	 * @return
	 */
	@GetMapping("/info")
	public String info(@ModelAttribute("loginMember") Member loginMember, 
						Model model) {
		
		
		System.out.println("마이페이지 : " + loginMember);
		System.out.println("마이페이지 : " + loginMember.getEnrollDate());

	    LocalDate currentDate = LocalDate.now();

	    try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        Date enrollDate = dateFormat.parse(loginMember.getEnrollDate());

	        long daysBetween = ChronoUnit.DAYS.between(enrollDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate(), currentDate);
	        System.out.println("두 날짜 사이의 일수: " + daysBetween);
	        model.addAttribute("daysBetween", daysBetween);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
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
								@RequestParam(value="memNo", required=false, defaultValue="0") int memNo,
								String currentPw,
								Model model) {
		int memberNo = 0;
		
		if(loginMember != null) {
			memberNo = loginMember.getMemberNo();
			int result = service.currentPwCheck(memberNo, currentPw);
			
			if(result > 0) {
				// 비밀번호 일치 -> 비밀번호 변경 페이지로 이동
				return "member/myPage-changePw";
				
			} else {
				model.addAttribute("message", "비밀번호가 일치하지 않아 마이페이지로 돌아옵니다.");
				// 비밀번호 불일치 시 마이페이지 이동
				return "member/myPage-info";
			}
		} else {
			memberNo = memNo;
			int result = service.currentPwCheck(memberNo, currentPw);
			
			if(result > 0) {
				// 비밀번호 일치 -> 비밀번호 변경 페이지로 이동
				return "myPage-changePw";
				
			} else {
				model.addAttribute("message", "비밀번호가 일치하지 않아 마이페이지로 돌아옵니다.");
				// 비밀번호 불일치 시 마이페이지 이동
				return "myPage-info";
			}
		}
		
	}
	
	/** (로그인 상태)새로운 비밀번호로 변경
	 * @return
	 */
	@PostMapping("/newChangePw")
	public String newChangePw(@RequestParam Map<String, Object> paramMap,
								Model model,
								RedirectAttributes ra,
								SessionStatus status,
								@ModelAttribute("loginMember") Member loginMember) {
		
		paramMap.put("memberNo", loginMember.getMemberNo());
		
		int result = service.newChangePw(paramMap);
		
		if(result > 0) {
			// 세션 없애기
			status.setComplete();
			
			// 비밀번호 변경 성공 시
			ra.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("message", "비밀번호 변경 중 오류가 발생하였습니다. 고객센터에 문의해주세요.");
			// 비밀번호 변경 실패 시
			return "member/myPage-changePw";
		}
	}
	

	/** (비로그인 상태)새로운 비밀번호로 변경
	 * @return
	 */
	@PostMapping("/newChangePassword")
	public String newChangePw(@RequestParam Map<String, Object> paramMap,
								Model model,
								RedirectAttributes ra,
								SessionStatus status) {
		
		paramMap.put("memberNo", paramMap.get("memNo"));
		
		int result = service.newChangePw(paramMap);
		
		if(result > 0) {
			// 세션 없애기
			status.setComplete();
			
			// 비밀번호 변경 성공 시
			ra.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("message", "비밀번호 변경 중 오류가 발생하였습니다. 고객센터에 문의해주세요.");
			// 비밀번호 변경 실패 시
			return "member/myPage-changePw";
		}
	}
//        1. js에서 유효성 검사, 비밀번호 일치 확인 후 여기로
//        2. form 태그에 담아서 memberNo로 비밀번호 가져와 확인 후
//       	일치하면 암호화해서 db에 저장
//       	비밀번호 변경 성공 시 -> 로그아웃 세션 삭제, 랜딩페이지 이동
//       	비밀번호 변경 실패 시 -> 현재 페이지
		
		// 비밀번호 변경 성공 시
		//return "redirect:/";
		
		// 비밀번호 변경 실패 시
		//return "member/myPage-changePw";

	
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
			// 세션 없애기
			status.setComplete();

			// 쿠키 없애기
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			cookie.setPath(req.getContextPath());
			resp.addCookie(cookie);
			
			// 탈퇴 성공 -> 메인 페이지
			ra.addFlashAttribute("message", "회원탈퇴 성공!");
			
		} else {
			// 탈퇴 실패 -> main
			model.addAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
			return "member/myPage-deleteAccount";
		}
		
		return "redirect:/";
	}
	
	
	
	
	
	
}