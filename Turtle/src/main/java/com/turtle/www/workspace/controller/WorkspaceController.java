package com.turtle.www.workspace.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@SessionAttributes({"loginMember", "project"})
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
	
	
	@PostMapping("/createWorkspace")
	public String createWorkspace(@ModelAttribute("project") Project project,
							@ModelAttribute("loginMember") Member loginMember,
							@ModelAttribute("workspace") Workspace workspace,
//							@RequestParam("emoji_value") String emojiValue,
                            @RequestParam("workspaceName") String workspaceName
//                            @RequestParam(value="selected", required=false) List<String> selectEmail
					) {
		
		logger.info("워크스페이스 생성");
		logger.info(workspaceName);
		
		workspace.setProjectNo(project.getProjectNo());
		
		// 워크스페이스 이모지, 워크스페이스 이름
		int workspaceNo = service.createWorkspace(workspace);
		

		
		
		return "redirect:/project/createWorkspace";
		
	}
	
	
	@PostMapping("/createTemplate")
	public String createTemplate(@ModelAttribute("project") Project project,
						@ModelAttribute("loginMember") Member loginMember,
						@RequestParam(value="workspace", required=false) List<String> template,
			            @RequestParam(value="wokrspaceName", required=false) List<String> templateName) {
		
		logger.info("템플릿 생성");
		
		// 선택한 템플릿
		System.out.print(template);
		System.out.print(templateName);
		
		for(int i = 0; i <= template.size(); i++) {
			
		}
		
		if(template.contains("게시판")) {
			
			
		}
		
		if(template.contains("캘린더")) {
			
		}
		
		if(template.contains("스티커")) {
			
		}
		
		if(template.contains("깃")) {
			
		}
		
		
		return "redirect:/project/createWorkspace";
		
	}
	
	
	
}
