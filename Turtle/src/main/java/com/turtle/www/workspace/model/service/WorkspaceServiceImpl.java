package com.turtle.www.workspace.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.workspace.model.dao.WorkspaceDAO;
import com.turtle.www.workspace.model.vo.Workspace;

@Service
public class WorkspaceServiceImpl implements WorkspaceService{
	
	@Autowired
	private WorkspaceDAO dao;

	// 프로젝트 내 워크스페이스 조회 서비스 구현
	@Override
	public List<Workspace> selectWorkspaceList(int projectNo) {
		return dao.selectWorkspaceList(projectNo);
	}

	// 프로젝트 내의 세션에 담을 워크스페이스넘버 하나 얻어오기 서비스 구현
	@Override
	public int selectWorkspaceNo(int projectNo) {
		return dao.selectWorkspaceNo(projectNo);
	}
	
	
	
	
}
