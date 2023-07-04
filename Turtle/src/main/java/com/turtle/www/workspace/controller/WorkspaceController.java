package com.turtle.www.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.board.model.vo.Board;
import com.turtle.www.calendar.model.vo.Calendar;
import com.turtle.www.loadmap.model.vo.Loadmap;
import com.turtle.www.memo.model.vo.Memo;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.workspace.model.service.WorkspaceService;

@Controller
@RequestMapping("/workspace")
@SessionAttributes({"loginMember"})
public class WorkspaceController {
	
	@Autowired
	private WorkspaceService service;
	
	@Autowired
	private Project project;

	@Autowired
	private Board board;

	@Autowired
	private Memo memo;
	
	@Autowired
	private Loadmap loadmap;
	
	@Autowired
	private Calendar calendar;
	
	
	public String createWorkspace() {
		
		return null;
		
	}
	
	
}
