package com.turtle.www.projectMember.controller;

import java.util.ArrayList;
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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.project.controller.ProjectController;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.model.service.ProjectMemberService;
import com.turtle.www.projectMember.model.vo.ProjectMember;

@Controller
@RequestMapping("/project")
@SessionAttributes({"loginMember"})
public class ProjectMemberController {
	
	// 초대코드 이메일 전송
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	private ProjectMemberService service;
	
	private List<Member> mlist; // mList를 멤버 변수로 선언
	
	private Logger logger = LoggerFactory.getLogger(ProjectMemberController.class);
	
	
	
	
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
				
	
		mlist = service.searchmember(input);

		return new Gson().toJson(mlist);
		
	}
	
	
	@PostMapping("inviteMember")
	public String inviteMember(HttpSession session,
				@RequestParam("selectEmail") String input
								) {
		
		logger.info("프로젝트멤버 초대");
		
		Project project = (Project)session.getAttribute("project");
		
		mlist = service.searchmember(input);
		
		List<String> emailList = new ArrayList<>();
		String inviteCode = project.getInviteCode();
		
		for (int i = 0; i < mlist.size(); i++) {
			String memberEmail = mlist.get(i).getMemberEmail();
			
			System.out.println(memberEmail);
			
			emailList.add(memberEmail);
		}
		
		for(String toMail : emailList) {
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
	        		"<p>아래 초대 코드를 사용하여 프로젝트에 가입해주세요:</p>" +
	        		"<h3>초대 코드: <span style='color:red'>" + inviteCode + "</span></h3>" +
	        		"<p>프로젝트에 가입하려면 아래 링크를 클릭해주세요:</p>" +
	        		"<button>수락</button>" + "<button>거절</button>" +
	        		"<p><a href='[가입 링크]'>프로젝트 가입하기</a></p>" +
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
	            
	            Map<String, Object> map = new HashMap<>();
//	            map.put("memberEmail", memberEmail);
//	            map.put("inviteCode", inviteCode);
	            
	            // 인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간  -> DB 삽입
//	            result = service.insertCertification(map);

	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
			
		}

		
		return "redirect:/project/createWorkspace";
		
		
	}
}
