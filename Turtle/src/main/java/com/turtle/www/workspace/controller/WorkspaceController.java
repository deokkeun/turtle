package com.turtle.www.workspace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/workspace")
@SessionAttributes({"loginMember"})
public class WorkspaceController {
	
//	@Autowired
//	private WorkspaceService service;
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
//	
	
	public String createWorkspace() {
		
		return null;
		
	}
	
	
}
