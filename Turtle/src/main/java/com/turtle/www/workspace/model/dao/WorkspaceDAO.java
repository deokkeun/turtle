package com.turtle.www.workspace.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int deleteWorkspace(int workspacetNo) {
		
		return sqlSession.update("workspaceMapper.deleteWorkspace", workspacetNo);
	}

	public int renameWorkspace(Workspace workspace) {
		
		int result = 0;
		
		// 워크스페이스 이름 변경 전 채팅방 이름도 같이 변경
		// 1. 워크스페이스의 기존 이름 확인
		int workspaceNo = workspace.getWorkspaceNo();
		String currentWorkspaceName = sqlSession.selectOne("workspaceMapper.selectCurrentWorkspaceName", workspaceNo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("currentWorkspaceName", currentWorkspaceName);
		map.put("projectNo", sqlSession.selectOne("chatMapper.selectProjectNo", workspaceNo));
		map.put("newWorkspaceName", workspace.getWorkspaceName());
		
		result = sqlSession.update("chatMapper.updateChatRoomTitle", map);
			
		if(result > 0) {
			result = sqlSession.update("workspaceMapper.renameWorkspace", workspace);
		}
		
		return result;
	}
	
	
	
}
