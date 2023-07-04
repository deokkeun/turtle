package com.turtle.www.workspace.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.workspace.model.vo.Workspace;

@Repository
public class WorkspaceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int createWorkspace(Workspace workspace) {
		return sqlSession.insert("workspace-mapper.createWorkspace", workspace);
	}
	
	
	
}
