package com.turtle.www.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.turtle.www.workspace.model.service.WorkspaceService;

@Controller
@RequestMapping("/workspace")
public class WorkspaceController {
	
	@Autowired
	private WorkspaceService service;


	
	
	
	
}
