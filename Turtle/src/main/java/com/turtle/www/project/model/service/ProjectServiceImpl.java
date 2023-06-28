package com.turtle.www.project.model.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.project.model.dao.ProjectDAO;
import com.turtle.www.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);

	/** 프로젝트 생성 서비스 구현
	 *
	 */
	@Override
	public int createProject(Project project) {
		
		int result = dao.createProject(project);
		
		return result;
	}
	
	

}
