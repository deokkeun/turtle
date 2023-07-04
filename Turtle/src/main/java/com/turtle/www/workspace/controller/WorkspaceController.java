package com.turtle.www.workspace.controller;

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
import com.turtle.www.workspace.model.service.WorkspaceService;
import com.turtle.www.workspace.model.vo.Workspace;

@Controller
@RequestMapping("/workspace")
@SessionAttributes({"loginMember", "project"})
public class WorkspaceController {
	
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
							@RequestParam("emoji_value") String emojiValue,
                            @RequestParam("workspace_name") String workspaceName,
                            Workspace workspace) {
		
		
		workspace.setProjectNo(project.getProjectNo());
		workspace.setWorkspaceName(workspaceName);
		workspace.setWorkspaceEmoji(emojiValue);
		
		// 워크스페이스 이모지, 워크스페이스 이름
		int workspaceNo = service.createWorkspace(workspace);
		
		
		// 선택한 템플릿
		
		
		return null;
		
	}
	
	
}
