package com.turtle.www.project.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.project.model.vo.Project;

@Repository
public class ProjectDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int createProject(Project project) {
		
		return sqlSession.insert("projectMapper.createProject", project);
	}

}
