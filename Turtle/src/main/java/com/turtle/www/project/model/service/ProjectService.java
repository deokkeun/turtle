package com.turtle.www.project.model.service;

import java.util.Map;

import com.turtle.www.project.model.vo.Project;


public interface ProjectService {

	/** 프로젝트 생성 서비스
	 * @param project
	 * @return
	 */
	int createProject(Project project);

}
