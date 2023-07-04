package com.turtle.www.workspace.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.workspace.model.dao.WorkspaceDAO;
import com.turtle.www.workspace.model.vo.Workspace;

@Service
public class WorkspaceServiceImpl implements WorkspaceService{
	
	@Autowired
	private WorkspaceDAO dao;

	@Override
	public int createWorkspace(Workspace workspace) {
		return dao.createWorkspace(workspace);
	}
	
	
	
	
}
