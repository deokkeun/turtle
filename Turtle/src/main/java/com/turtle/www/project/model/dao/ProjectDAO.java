package com.turtle.www.project.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.member.model.vo.Member;
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


	/** 본인 생성 프로젝트넘버 조회 dao
	 * @param memberNo
	 * @return projectNo
	 */
	public int selectMyProjectNo(int memberNo) {
		
		// 내프로젝트 존재여부확인
		int count = sqlSession.selectOne("projectMapper.selectMyProject", memberNo);
		int projectNo = 0;
		
		if(count > 0) {
			projectNo = sqlSession.selectOne("projectMapper.selectMyProjectNo", memberNo);
		} else { 
			projectNo = 0;
		}
		
		
		return projectNo;
	}


	/** 프로젝트 리스트 조회 서비스 dao
	 * @param loginMember
	 * @return projectList
	 */
	public List<Project> selectProjectList(Member loginMember) {
		return sqlSession.selectList("projectMapper.selectProjectList", loginMember);
	}

}
