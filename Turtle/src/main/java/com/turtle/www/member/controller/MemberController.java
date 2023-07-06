package com.turtle.www.member.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.turtle.www.member.model.service.MemberService;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.project.model.service.ProjectService;
import com.turtle.www.workspace.model.service.WorkspaceService;


// @RestController // @Controller + @ResponseBody

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember", "project", "projectNo"})
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 이메일 인증
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	private MemberService service;
	@Autowired
	private ProjectService pService;
	@Autowired
	private WorkspaceService wService;
	
	
	
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
			
			// 결제 기간(한달) 초과 시 Basic(기본제공)으로 변경
			int paymentDateCheck = service.paymentDateCheck(loginMember.getMemberNo());
			logger.debug("paymentDateCheck = " + paymentDateCheck);
			
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
	
	
//	@GetMapping("/callback")
//	public String callback(@RequestParam("code") String code, HttpSession session, Model model) {
//	    try {
//	        // 네이버 로그인 콜백 URL 처리를 위한 필요한 정보
//	        String clientId = "aQpBvST4iYdjSLDbWXWl";
//	        String clientSecret = "2DbK66epLO";
//	        String redirectUri = "http://localhost:8080/www/member/callback";
//
//	        // 네이버 API에 액세스 토큰 요청을 위한 URL 생성
//	        String tokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id="
//	                + clientId + "&client_secret=" + clientSecret + "&redirect_uri=" + redirectUri + "&code=" + code;
//
//	        // 액세스 토큰 요청을 위한 HTTP 요청 보내기
//	        RestTemplate restTemplate = new RestTemplate();
//	        HttpHeaders headers = new HttpHeaders();
//	        headers.setContentType(MediaType.APPLICATION_JSON);
//	        HttpEntity<String> entity = new HttpEntity<>(headers);
//	        ResponseEntity<String> response = restTemplate.exchange(tokenUrl, HttpMethod.GET, entity, String.class);
//
//	        if (response.getStatusCode() == HttpStatus.OK) {
//	            // 액세스 토큰 요청이 성공한 경우
//	            String responseBody = response.getBody();
//	            
//	            // 회원 정보 파싱하여 이름 추출
////	            JsonNode responseNode = new ObjectMapper().readTree(responseBody);
////	            JsonNode apiJsonNode = responseNode.get("response");
////	            String memberName = apiJsonNode.get("name").asText();
////	            logger.info("네이버 이름 : " + memberName);
//
//              
//                // 회원 정보 파싱하여 프로필 사진 URL 추출
////                JsonNode apiJsonNode1 = new ObjectMapper().readTree(responseBody);
////                String profileImage = apiJsonNode1.get("response").get("profile_image").asText();
////                logger.info("네이버 프로필 사진 : " + profileImage);
//                
//	            // 응답 데이터 파싱하여 액세스 토큰 추출
//	            JsonNode jsonNode = new ObjectMapper().readTree(responseBody);
//	            String accessToken = jsonNode.get("access_token").asText();
//	            logger.info("네이버 토큰 : " + accessToken);
//
//	            // 소셜 아이디 가져오기
//	            String socialEmail = "naver_" + jsonNode.get("id").asText(); // 네이버 소셜 아이디
//	            logger.info("네이버 아이디 : " + socialEmail);
//	            
//	            // DB에서 소셜 아이디 확인
//	            Member member = service.getMemberSocialEmail(socialEmail);
//
//	            if (member == null) {
//	                // DB에 소셜 아이디가 없는 경우
//	                member = new Member();
//	                member.setSocialEmail(jsonNode.get("email").asText());
//	                member.setAccessToken(accessToken);
////	                member.setMemberName(memberName);
////	                member.setProfileImage(profileImage);
//	                // 나머지 회원 정보 설정
//	                // MEMBER 테이블에 회원 정보를 저장
//	                service.insertSocialMember(member);
//	            } else {
//	                // DB에 소셜 아이디가 있는 경우
//	                member.setAccessToken(accessToken);
//	                // 나머지 회원 정보 업데이트
//	                // MEMBER 테이블의 회원 정보 업데이트
////	                service.updateMember(member);
//	            }
//
//	            // 세션에 로그인 정보 저장
//	            session.setAttribute("loginMember", member);
//	            model.addAttribute("loginMember", member);
//
//	            // 로그인 성공 후 무조건 쿠키 생성
//	            Cookie cookie = new Cookie("saveId", member.getSocialEmail());
//
//	            // 쿠키의 유지 시간 설정
//	            cookie.setMaxAge(60 * 60 * 24 * 365); // 초단위 지정(1년)
//
//	            // 쿠키가 적용될 범위(경로) 지정
//	            cookie.setPath("/");
//
//	            // 쿠키를 응답 시 클라이언트에게 전달
//	            ((HttpServletResponse) response).addCookie(cookie);
//
//	            return "redirect:/"; // 로그인 성공 후 리다이렉트할 경로
//	            
//	        } else {
//	            // 액세스 토큰 요청이 실패한 경우
//	        	logger.info("액세스 토큰 요청이 실패한 경우");
////	            model.addAttribute("errorMessage", "Failed to retrieve access token.");
////	            return "error"; // 에러 페이지로 이동하거나 적절한 처리를 수행
//	        }
//	    } catch (Exception e) {
//	        // 예외 처리로그직 작성
//	    	logger.info("예외 처리");
//	    	logger.info("예외메시지 : " + e.getMessage());
//	    	e.printStackTrace();
////	        model.addAttribute("errorMessage", "An error occurred during login.");
////	        return "error"; // 에러 페이지로 이동하거나 적절한 처리를 수행
//	    }
//		return "redirect:/";
//	}

	
	@RequestMapping(value="callback", method=RequestMethod.GET)
	public String callBack(){
		return "common/callback";
	}
	
	@GetMapping("/callback")
	public String callback(@RequestParam("code") String code, HttpSession session, Model model) {
		String socialEmail = "";
	    try {
	        // 네이버 로그인 콜백 URL 처리를 위한 필요한 정보
	        String clientId = "aQpBvST4iYdjSLDbWXWl";
	        String clientSecret = "2DbK66epLO";
	        String redirectUri = "http://localhost:8080/www/member/callback";

	        // 네이버 API에 액세스 토큰 요청을 위한 URL 생성
	        String tokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id="
	                + clientId + "&client_secret=" + clientSecret + "&redirect_uri=" + redirectUri + "&code=" + code;

	        // 액세스 토큰 요청을 위한 HTTP 요청 보내기
	        RestTemplate restTemplate = new RestTemplate();
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        HttpEntity<String> entity = new HttpEntity<>(headers);
	        ResponseEntity<String> response = restTemplate.exchange(tokenUrl, HttpMethod.GET, entity, String.class);

	        if (response.getStatusCode() == HttpStatus.OK) {
	            // 액세스 토큰 요청이 성공한 경우
	            String responseBody = response.getBody();
	            
	            JsonNode jsonNode = new ObjectMapper().readTree(responseBody);
	            String id = jsonNode.get("id").asText();
	            socialEmail = "naver_" + id;
	            logger.info("네이버 아이디 : " + socialEmail);
	            
	            // 응답 데이터 파싱하여 액세스 토큰 추출
	            String accessToken = jsonNode.get("access_token").asText();
	            logger.info("네이버 토큰 : " + accessToken);
	            
	        }
	    } catch (Exception e) {
	        logger.error("소셜 이메일을 가져오는데 예외가 발생하였습니다: " + e.getMessage());
	        // 예외 처리 로직을 추가하거나 적절한 오류 처리를 수행하세요.
	    }
		return "redirect:/";
	        
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
	
	/** 이메일 중복검사
	 * @param email
	 * @return
	 */
	@ResponseBody
	@GetMapping("/emailDupCheck")
	public int emailDupCheck(@RequestParam("memberEmail") String memberEmail) {
		return service.emailDupCheck(memberEmail);
	}
	
	// mailSending 코드
	@GetMapping("/sendEmail")
	@ResponseBody
	public String mailSending(String inputEmail) {

		//뷰에서 넘어왔는지 확인
		//System.out.println("이메일 전송");
		
//		//난수 생성(인증번호)
//		Random r = new Random();
//		int num = r.nextInt(888888) + 111111;  //111111 ~ 999999
//		System.out.println("인증번호:" + num);
		
        // 인증번호 6자리 생성코드(영어 대/소문 + 숫자)
        String cNumber = "";
        for(int i=0 ; i< 6 ; i++) {
           
           int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어
           
           if(sel1 == 0) {
              
              int num = (int)(Math.random() * 10); // 0~9
              cNumber += num;
              
           }else {
              
              char ch = (char)(Math.random() * 26 + 65); // A~Z
              
              int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자
              
              if(sel2 == 0) {
                 ch = (char)(ch + ('a' - 'A')); // 대문자로 변경
              }
              
              cNumber += ch;
           }
           
        }
		
		/* 이메일 보내기 */
        String setFrom = "admin@gmail.com"; //보내는 이메일
        String toMail = inputEmail; //받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
        		"<p>안녕하세요, Turtle을 방문해주셔서 감사합니다.<br>" +
                "아래 번호를 입력하여 인증 절차를 완료해 주세요.</p>" +
                "<br>" + 
                "<h3>인증 번호는  <span style='color:red'>" + cNumber + "</span> 입니다.</h3>" + 
                "<br>" + 
                "<p>해당 인증번호를 인증번호 확인란에 기입하여 주세요.</p>";
        
        int result = 0;
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom, "관리자"); // 보내는 사람 지정
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
            Map<String, Object> map = new HashMap<>();
            map.put("inputEmail", inputEmail);
            map.put("cNumber", cNumber);
            
            // 인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간  -> DB 삽입
            result = service.insertCertification(map);

            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
//        String rnum = Integer.toString(cNumber);  //view로 다시 반환할 때 String만 가능
        return new Gson().toJson(result);
	}


	// 이메일 인증번호 일치 확인 코드
	@GetMapping("/checkNumber")
	@ResponseBody
	public String checkNumber(String inputEmail , String cNumber) {
		
	
        Map<String, Object> map = new HashMap<>();
        map.put("inputEmail", inputEmail);
        map.put("cNumber", cNumber);
		
		int result = service.checkNumber(map);
		
		return new Gson().toJson(result);
		
	}
		
	
	/** 회원가입 기능
	 * @return
	 */
	@PostMapping("/signUp")
	public String signUp(@ModelAttribute() Member inputMember,
						HttpServletRequest req,
						RedirectAttributes ra) {
		
		logger.info("회원가입 기능 수행됨");
		
		int result = service.signUp(inputMember);
		
		String message = null;
		String path = null;
		
		if(result > 0) { // 회원가입 성공
			
			message = inputMember.getMemberName() + "님, 환영합니다!";
			path = "redirect:/"; // 메인 페이지
			
		}else {
			
			message = "회원가입에 실패하였습니다. 잠시 후 다시 시도해주세요.";
			path = "redirect:/member/signUp"; // 회원 가입 페이지
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
//  -------------------------------------------------------------------------------------
  
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

	
	/** 비밀번호 변경 (랜딩페이지 비회원 경우)
	 * @return
	 */
	@GetMapping("/changePw")
	public String changePw(@RequestParam("memNo") int memNo,
							Model model) {
		
		model.addAttribute("memNo", memNo);
		
		return "member/changePw";
	}
	
	/** [비밀번호]이메일 인증(회원인지 확인)
	 * @param inputEmail
	 * @return
	 */
	@ResponseBody
	@PostMapping("/memberConfirmation")
	public String memberConfirmation(@RequestParam("inputEmail") String inputEmail,
								RedirectAttributes ra,
								Model model) {
		
		String memberEmail = service.memberConfirmation(inputEmail);
		
		return new Gson().toJson(memberEmail);
	}
	
	/** [비밀번호]인증번호 전송
	 * @param toEmail
	 * @return
	 */
	@ResponseBody
	@GetMapping("/sendPasswordEmail")
	public String sendPasswordEmail(@RequestParam("sendEmail") String sendEmail,
							Model model) throws Exception{
		
		int result = 0;
		
		int select = service.passwordSelectCertification(sendEmail);
		logger.debug("인증 받은적이 있는지 유무 확인 select = " + select);
		
		if(select > 0) {
			result = service.passwordUpdateCertification(sendEmail);
			logger.debug("인증번호 수정(인증 받은적 있는경우) result = " + result);
			
			if(result > 0) {
				model.addAttribute("message", "이메일 발송완료");
			} else {
				model.addAttribute("message", "이메일 발송완료");
			}
			
		} else {
			result = service.passwordInsertCertification(sendEmail);
			logger.debug("인증번호 추가(인증 없는경우) result = " + result);
			
			if(result > 0) {
				model.addAttribute("message", "이메일 발송완료");
				
			} else {
				model.addAttribute("message", "이메일 발송 실패");			
			}
		}
		
		return new Gson().toJson(result);
	}

	/** [비밀번호]인증번호로 회원 번호 가져오기
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
	
	
	
	// projectNo 받아오는거여서 나중에 참고해야함
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
			
			// 로그인 멤버의 본인이 생성한 프로젝트넘버 얻어오기
			//int projectNo = pService.selectMyProjectNo(loginMember.getMemberNo());
			
			//model.addAttribute("projectNo", projectNo);
			
			
		} else {
			ra.addFlashAttribute("message", "테스트 로그인 실패");
			logger.info("로그인 실패");
		}
		
		return "redirect:/";
	}
//chat 테스트용
	
	
	
	
	
}
