package com.turtle.www.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.turtle.www.member.model.vo.Member;
import com.turtle.www.project.model.service.ProjectService;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.model.service.ProjectMemberService;
import com.turtle.www.projectMember.model.vo.ProjectMember;
import com.turtle.www.workspace.model.service.WorkspaceService;
import com.turtle.www.workspace.model.vo.Workspace;

@Controller
@RequestMapping("/project")
@SessionAttributes({"loginMember", "projectNo", "projectMember", "pmNo", "workspaceList", "projectList"})
public class ProjectController {
	
	private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	

	
	@Autowired
	private ProjectService service;
	@Autowired
	private ProjectMemberService pmService;
	@Autowired
	private WorkspaceService wService;
	
	
		
	/** 프로젝트 생성 기능
	 * @param project
	 * @param req
	 * @param ra
	 * @return
	 */
	@PostMapping("/createProject")
	public String createProject(@ModelAttribute("loginMember") Member loginMember,
								@ModelAttribute("project") Project project,
//								@RequestParam("emoji_value") String emojiValue,
								HttpSession session,
								HttpServletRequest req,
								RedirectAttributes ra) {
		
		logger.info("프로젝트 생성");
		
		// 생성자 멤버 번호 추가
		project.setCreateMemberNo(loginMember.getMemberNo());
//		project.setProjectEmoji(emojiValue);
//		logger.info(emojiValue);
		ProjectMember pm = new ProjectMember();
		pm.setMemberNo(loginMember.getMemberNo());
		
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
		
		pm.setProjectNo(project.getProjectNo());

		String message = null;
		String path = null;
		
		if(result > 0) { // 프로젝트 생성 성공
			path = "project/inviteMember";
			session.setAttribute("project", project);
			logger.info("pm manager 삽입 성공");
			service.insertPmManager(pm);
			
		}else {
			message = "프로젝트 생성에 실패하였습니다.";
			path = "redirect:/project/createProject";
		}
		
		ra.addFlashAttribute("message", message);
		
		
		return path;
		
	}
	
	
	// 프로젝트 이동
	@GetMapping("/{projectNo}")
	public String enterProject(@ModelAttribute("loginMember") Member loginMember,
							@PathVariable("projectNo") int projectNo,
								Model model) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("projectNo", projectNo);
		
		// 프로젝트 리스트 조회
		List<Project> projectList = service.selectProjectList(loginMember);
		// 프로젝트 내 로그인 회원의 프로젝트 멤버정보 조회
		ProjectMember projectMember = pmService.selectProjectMember(map);
		// 프로젝트 내 워크스페이스 조회
		List<Workspace> workspaceList = wService.selectWorkspaceList(projectNo);
		
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pmNo", projectMember.getPmNo());
		model.addAttribute("projectMember", projectMember);
		model.addAttribute("workspaceList", workspaceList);
		
		return "common/main";
	}
	

}
