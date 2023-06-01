package com.turtle.www.workspace.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.workspace.model.dao.WorkspaceDAO;

@Service
public class WorkspaceServiceImpl implements WorkspaceService{
	
	@Autowired
	private WorkspaceDAO dao;
	
	
	
	
}
