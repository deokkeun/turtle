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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.turtle.www.chat.model.service.ChatService;
import com.turtle.www.chat.model.vo.ChatRoom;
import com.turtle.www.chat.model.vo.ChatRoomJoin;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.payment.model.service.PayService;
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
	private PayService pService;
	@Autowired
	private ProjectService service;
	@Autowired
	private ProjectMemberService pmService;
	@Autowired
	private WorkspaceService wService;
	@Autowired
	private ChatService cService;
	
	
		
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
								Model model,
								HttpSession session,
								HttpServletRequest req,
								RedirectAttributes ra) {
		
		logger.info("프로젝트 생성");
		
		// 생성자 멤버 번호 추가
		//Project project = new Project();
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
			
			path = "project/createWorkspace";
			
			session.setAttribute("project", project);
			model.addAttribute("project", project);
			model.addAttribute("projectNo", project.getProjectNo());
			logger.info("pm manager 삽입 성공");
			int pmResult = service.insertPmManager(pm);
			
			// 민수
			// 프로젝트 생성 성공시 채팅방 생성
			
			if(pmResult > 0) {
				ChatRoom chatRoom = new ChatRoom();
				chatRoom.setChatRoomTitle(project.getProjectName());
				chatRoom.setProjectNo(project.getProjectNo());
				chatRoom.setChatRoomType(1);
				
				int chatResult = cService.insertChatRoom(chatRoom);
				
				// 채팅방 생성 성공시 프로젝트 생성자 채팅방 조인
				if(chatResult != 0) {
					ChatRoomJoin chatRoomJoin = new ChatRoomJoin();
					
					chatRoomJoin.setChatRoomNo(chatResult);
					chatRoomJoin.setPmNo(pmResult);
					
					int joinResult = cService.insertChatRoomJoin(chatRoomJoin);
					if(joinResult > 0) {
						logger.info(pmResult+ "번 pm넘버 : " + chatResult + "번 프로젝트 채팅방 초대 성공");
					}					
				}				
			}
			
			// 프로젝트 생성후 로드맵, 캘린더 워크스페이스 생성
			Workspace workspace1 = new Workspace();
			workspace1.setProjectNo(project.getProjectNo());
			workspace1.setWorkspaceName("loadmap");
			int workspaceNo1 = wService.createWorkspace(workspace1);
			if(workspaceNo1 > 0) {
				logger.info("loadmap 워크스페이스 생성");
			}
			Workspace workspace2 = new Workspace();
			workspace2.setProjectNo(project.getProjectNo());
			workspace2.setWorkspaceName("calendar");
			int workspaceNo2 = wService.createWorkspace(workspace2);
			if(workspaceNo2 > 0) {
				logger.info("calendar 워크스페이스 생성");
			}
			
			
			
			// 워크스페이스 워크스페이스 이름
			
			
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
		
		Project project = service.selectProject(projectNo);
		
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pmNo", projectMember.getPmNo());
		model.addAttribute("projectMember", projectMember);
		model.addAttribute("workspaceList", workspaceList);
		model.addAttribute("project", project);
		
		
		return "common/main";
	}
	
	@ResponseBody
	@PostMapping("/deleteProject")
	public String deleteProject(Model model, @RequestParam("projectNo") int projectNo, ProjectMember projectMember) {
		logger.info("============================");
		logger.info("프로젝트 삭제");
		System.out.println(projectNo);
		logger.info(projectMember.getProjectManager());
		int result = 0;
	
		
		if(projectMember.getProjectManager().equals("Y")) {
			
			result = service.deleteProject(projectNo);
			System.out.println(result);
			
		}else {
			result = 2;
		}
		
		return new Gson().toJson(result);
	}
	
	
	@ResponseBody
	@PostMapping("/renameProject")
	public String renameProject(@RequestParam("projectNo") int projectNo, @RequestParam("projectName") String projectName, ProjectMember projectMember) {
		logger.info("============================");
		logger.info("프로젝트 이름 변경");
		System.out.println(projectNo);
		logger.info(projectName);
		logger.info(projectMember.getProjectManager());
		int result = 0;
		
		Project project = new Project();
		project.setProjectNo(projectNo);
		project.setProjectName(projectName);
	
		if(projectMember.getProjectManager().equals("Y")) {
			
			result = service.renameProject(project);
			System.out.println(result);
			
		}else {
			result = 2;
		}
		
		return new Gson().toJson(result);
	}

}
