package com.turtle.www.projectMember.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.model.service.ProjectMemberService;
import com.turtle.www.projectMember.model.vo.ProjectMember;

@Controller
@RequestMapping("/project")
@SessionAttributes({"loginMember"})
public class ProjectMemberController {
	
	private Logger logger = LoggerFactory.getLogger(ProjectMemberController.class);
	
	@Autowired
	private ProjectMemberService service;
	
	
	// 초대코드 이메일 전송
	@Autowired
    private JavaMailSender mailSender;
	
	
	
	@GetMapping("/createProject")
	public String createProject() {return "project/createProject";}
	
	
	@GetMapping("/createWorkspace")
	public String createWorkspace() {return "project/createWorkspace";}
	
	
	@GetMapping("/inviteMember")
	public String inviteMember() {return "project/inviteMember";}

	
	@ResponseBody
	@GetMapping(value="/searchmember", produces="text/plain;charset=UTF-8")
	public String searchmember(HttpServletRequest req, 
								HttpServletResponse resp, 
								@RequestParam("input") String input
								) throws Exception{
				
	
		List<Member> mlist = service.searchmember(input);

		return new Gson().toJson(mlist);
		
	}
	
	// , consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE}
	@PostMapping(value = "/inviteMember", produces="text/plain;charset=UTF-8" )
	public String inviteMember(HttpSession session,
//						@RequestParam(value="selectEmail") String[] selectEmail
						@RequestParam(value="selectEmail", required=false) List<String> selectEmail
								) {
		
		logger.info("프로젝트멤버 초대");
		
//		logger.info("두번쨰 메일:" + selectEmail[1].toString());
		
		Project project = (Project)session.getAttribute("project");
		
		String inviteCode = project.getInviteCode();
		
//		String[] selectEmail = request.getParameterValues("selectEmail");
		
//		List<String> emailList = Arrays.asList(selectEmail);
		
		if(selectEmail != null) {
			
			for(String toMail : selectEmail) {
				
				logger.info(toMail);
				
			    String acceptLink = "http://localhost:8080/project/inviteMember/" + toMail + "/" + inviteCode + "/accept";
			    String rejectLink = "http://localhost:8080/project/inviteMember/" + toMail + "/" + inviteCode + "/reject";
			    String acceptButton = "<a href=\"" + acceptLink + "\">수락</a>";
			    String rejectButton = "<a href=\"" + rejectLink + "\">거절</a>";
				
				/* 이메일 보내기 */
		        String setFrom = "admin@gmail.com"; //보내는 이메일
		        String title = project.getProjectName() + "에 함께하실 멤버로 초대합니다!";
		        String content = 
		        		"<p>안녕하세요!</p>" + 
		        		"<p>저희 팀의 " + project.getProjectName() + " 프로젝트에 함께하실 멤버로 초대합니다.</p>" +
		        		" <p>프로젝트에 참여하시면 다음과 같은 혜택을 누릴 수 있습니다:</p>" + 
		        		"<ul> " +
		        		    "<li>프로젝트 공유 및 협업 기능 활용</li>" + 
		        		    "<li>작업 일정 및 업무 할당 관리</li>" +
		        		    "<li>팀원과의 실시간 채팅</li>" +
		        		    "<li>파일 공유 및 버전 관리</li>" +
		        		"</ul>" +
		        		"<p>아래 수락 버튼을 클릭하여 프로젝트에 가입해주세요:</p>" +
		        		"<h3>초대 코드: <span style='color:red'>" + inviteCode + "</span></h3>" +
		        	    "<h2>" + acceptButton + " | " +  rejectButton + "</h2>" +
		        		"<p>프로젝트에 가입하시면 위의 혜택을 누리며, 우리 팀의 성공을 함께 이룰 수 있습니다.</p>" + 
		        		"<p>감사합니다!</p>";
				
		        int result = 0;
		        
		        try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom, "관리자"); // 보내는 사람 지정
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
	//	            Map<String, Object> map = new HashMap<>();
	//	            map.put("memberEmail", memberEmail);
	//	            map.put("inviteCode", inviteCode);
		            
		            // 인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간  -> DB 삽입
	//	            result = service.insertCertification(map);
	
		         
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
				
			}
		}
		return "redirect:/project/inviteMember";
		
	}

	
	@GetMapping("/inviteMember/{memberEmail}/{inviteCode}/accept")
	public String acceptInvitation(@PathVariable("inviteCode") String inviteCode,
	                               @PathVariable("memberEmail") String memberEmail,
	                               HttpSession session) {
	    logger.info("초대메일 수락");
	    
	    // 초대 수락 동작 처리
	    // invitationId를 사용하여 해당 초대를 수락 처리합니다.
	    
	    // 수락 처리 후 필요한 동작 수행
	    // 수락하면 projectmember에 추가
	    // shared project에 추가
	    
	    Project project = (Project) session.getAttribute("project");
	    
	    int memberNo = service.selectMemberNo(memberEmail);
	    
	    ProjectMember pm = new ProjectMember();
	    pm.setProjectNo(project.getProjectNo());
	    pm.setMemberNo(memberNo);
	    
	    int result = service.insertProjectMember(pm);
	    
	    if (result > 0) {
	        logger.info("pm 삽입 성공");
	    }
	    
	    return "redirect:/"; 
	}


	@GetMapping("/inviteMember/{memberEmail}/{inviteCode}/reject")
	public String rejectInvitation(@PathVariable("inviteCode") String inviteCode,
								@PathVariable("memberEmail") String memberEmail,
								HttpSession session) {
		
		logger.info("초대메일 거절");
	    // 초대 거절 동작 처리
	    // invitationId를 사용하여 해당 초대를 거절 처리합니다.
	    
	    // 거절 처리 후 필요한 동작 수행
		// 거절하면 project 관리자한테 메일
		
	    
	    return "redirect:/";
	}


//	@PostMapping("chatList")
//	public String chatList() {
//		
//		
//		
//		
//		return "/common/main";
//		
//	}

}
