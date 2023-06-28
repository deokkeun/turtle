package com.turtle.www.project.controller;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.turtle.www.member.model.vo.Member;
import com.turtle.www.project.model.service.ProjectService;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.controller.ProjectMemberController;

@Controller
@RequestMapping("/project")
@SessionAttributes({"loginMember"})
public class ProjectController {
	
	private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	

	
	@Autowired
	private ProjectService service;
	
	
		
	/** 프로젝트 생성 기능
	 * @param project
	 * @param req
	 * @param ra
	 * @return
	 */
	@PostMapping("/createProject")
	public String createProject(@ModelAttribute("loginMember") Member loginMember,
								@ModelAttribute("project") Project project,
								HttpSession session,
								HttpServletRequest req,
								RedirectAttributes ra) {
		
		logger.info("프로젝트 생성");
		
		// 생성자 멤버 번호 추가
		project.setCreateMemberNo(loginMember.getMemberNo());
		
		// 초대코드 생성
        // 인증번호 6자리 생성코드(영어 대/소문 + 숫자)
        String inviteCode = "";
        
        for(int i=0 ; i< 6 ; i++) {
           
           int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어
           
           if(sel1 == 0) {
              
              int num = (int)(Math.random() * 10); // 0~9
              inviteCode += num;
              
           }else {
              
              char ch = (char)(Math.random() * 26 + 65); // A~Z
              
              int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자
              
              if(sel2 == 0) {
                 ch = (char)(ch + ('a' - 'A')); // 대문자로 변경
              }
              
              inviteCode += ch;
           }
           
        }
        project.setInviteCode(inviteCode);
		
        // 프로젝트 생성
		int result = service.createProject(project);
		
		String message = null;
		String path = null;
		
		if(result > 0) { // 프로젝트 생성 성공
			path = "project/createProject";
			session.setAttribute("project", project);
			
		}else {
			message = "프로젝트 생성에 실패하였습니다.";
			path = "redirect:/project/createProject";
		}
		
		ra.addFlashAttribute("message", message);
		
		
		return path;
		
	}
	
	

	

}
