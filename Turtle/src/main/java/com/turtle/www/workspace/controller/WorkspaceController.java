package com.turtle.www.workspace.controller;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.board.model.vo.Board;
import com.turtle.www.calendar.model.vo.Calendar;
import com.turtle.www.loadmap.model.vo.Loadmap;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.memo.model.vo.Memo;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.controller.ProjectMemberController;
import com.turtle.www.workspace.model.service.WorkspaceService;
import com.turtle.www.workspace.model.vo.Workspace;

@Controller
@RequestMapping("/project")
@SessionAttributes({"loginMember", "project", "workspaceNo"})
public class WorkspaceController {
	
	private Logger logger = LoggerFactory.getLogger(WorkspaceController.class);
	
	@Autowired
	private WorkspaceService service;
//	
//	@Autowired
//	private Project project;
//
//	@Autowired
//	private Board board;
//
//	@Autowired
//	private Memo memo;
//	
//	@Autowired
//	private Loadmap loadmap;
//	
//	@Autowired
//	private Calendar calendar;
	
	
	// 워크스페이스 생성
	@PostMapping("/createWorkspace")
	public String createWorkspace(@ModelAttribute("project") Project project,
							@ModelAttribute("loginMember") Member loginMember,
							@ModelAttribute("workspace") Workspace workspace,
                            @RequestParam("workspaceName") String workspaceName,
//                            @RequestParam(value="selected", required=false) List<String> selected,
                            Model model
					) {
		
		logger.info("워크스페이스 생성");
		logger.info(workspaceName);
		
		workspace.setProjectNo(project.getProjectNo());
		
		// 워크스페이스 이모지, 워크스페이스 이름
		int workspaceNo = service.createWorkspace(workspace);
		
		model.addAttribute(workspaceNo);
		
		
		
		return "redirect:/common/main";
		
	}
	
	// 선택한 템플릿 내용 받아오기
	@PostMapping("/createTemplate")
	public void createTemplate(@ModelAttribute("project") Project project,
						@ModelAttribute("loginMember") Member loginMember,
//						@RequestParam(value="selected", required=false) List<String> selectEmail
						@RequestParam(value="workspace", required=false) String[] template,
			            @RequestParam(value="wokrspaceName", required=false) String[] templateName) {
		
		logger.info("템플릿 생성");
		
		// 선택한 템플릿
		System.out.print("template" + Arrays.asList(template)); // ex) [게시판, 캘린더, 스티커, 깃]
		System.out.print("templateName" + Arrays.asList(templateName)); // 설정한 이름 ex) [공지사항, 일정표, 스티커 메모장, 깃 로드맵]
		
		// 선택한 템플릿 생성 구문
		for(int i = 0; i < template.length; i++) {
			
			logger.info("template : " + template[i]);
			logger.info("templateName : " + templateName[i]);
			
			if(template[i].equals("게시판")) {
				
				// 게시판 이름
				String boardName = templateName[i];
				
				// 게시판 생성
				
			}
			
			if(template[i].equals("스티커")) {
				
				// 메모 이름
				String memoName = templateName[i];
				
				// 메모 생성
				
			}
			
			if(template[i].equals("캘린더")) {
				
				// 캘린더 이름
				String calendarName = templateName[i];
				
				// 캘린더 생성
				
			}
			
			if(template[i].equals("깃")) {
				
				// 깃 이름
				String loadmapName = templateName[i];
				
				// 깃 생성
				
			}
			
			
			
			
			
			
			
		}
		
		
		
	}
	
	public void createBoard(@RequestParam(value="wokrspaceName", required=false) String[] templateName,
							int workspaceNo
			) {
		
		
	}
	
	public void createCalendar(@RequestParam(value="wokrspaceName", required=false) String[] templateName,
							int workspaceNo
						) {
		
	}
	
	public void createMemo(@RequestParam(value="wokrspaceName", required=false) String[] templateName,
							int workspaceNo) {
		
	}
	public void createLoadmap(@RequestParam(value="wokrspaceName", required=false) String[] templateName,
							int workspaceNo) {
		
	}
	
}
