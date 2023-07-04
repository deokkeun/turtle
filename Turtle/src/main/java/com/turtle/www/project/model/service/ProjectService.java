package com.turtle.www.project.model.service;

import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.model.vo.ProjectMember;


public interface ProjectService {

	/** 프로젝트 생성 서비스
	 * @param project
	 * @return
	 */
	int createProject(Project project);

	void insertPmManager(ProjectMember pm);

	
	/** 본인 생성 프로젝트넘버 조회 서비스
	 * @param memberNo
	 * @return projectNo
	 */
	int selectMyProjectNo(int memberNo);

}
