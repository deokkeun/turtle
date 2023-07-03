package com.turtle.www.project.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.model.vo.ProjectMember;

@Repository
public class ProjectDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int createProject(Project project) {
		
		return sqlSession.insert("projectMapper.createProject", project);
	}


	public void insertPmManager(ProjectMember pm) {
		sqlSession.insert("projectMapper.insertPmManager", pm);
		
	}

}
