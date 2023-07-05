package com.turtle.www.workspace.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.workspace.model.vo.Workspace;

@Repository
public class WorkspaceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int createWorkspace(Workspace workspace) {
		
		int result = sqlSession.insert("workspaceMapper.createWorkspace", workspace);
		
		if(result > 0) result = workspace.getWorkspaceNo();
		
		return result;
	}
	
	/** 프로젝트 내 워크스페이스 조회 dao
	 * @param projectNo
	 * @return workspaceList
	 */
	public List<Workspace> selectWorkspaceList(int projectNo) {
		return sqlSession.selectList("workspaceMapper.selectWorkspaceList", projectNo);
	}

	/** 프로젝트 내의 세션에 담을 워크스페이스넘버 하나 얻어오기 dao
	 * @param projectNo
	 * @return workspaceNo
	 */
	public int selectWorkspaceNo(int projectNo) {
		return sqlSession.selectOne("workspaceMapper.selectWorkspaceNo", projectNo);

	}
	
	
	
}
