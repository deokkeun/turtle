package com.turtle.www.workspace.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkspaceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
}
