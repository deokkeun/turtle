package com.turtle.www.project.model.service;

import java.util.List;

import com.turtle.www.member.model.vo.Member;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.model.vo.ProjectMember;


public interface ProjectService {

	/** 프로젝트 생성 서비스
	 * @param project
	 * @return
	 */
	int createProject(Project project);

	int insertPmManager(ProjectMember pm);

	
	/** 본인 생성 프로젝트넘버 조회 서비스
	 * @param memberNo
	 * @return projectNo
	 */
	int selectMyProjectNo(int memberNo);

	/** 프로젝트 리스트 조회 서비스
	 * @param loginMember
	 * @return projectList
	 */
	List<Project> selectProjectList(Member loginMember);

	int deleteProject(int projectNo);

	int renameProject(Project project);


	Project selectProject(int projectNo);

}
