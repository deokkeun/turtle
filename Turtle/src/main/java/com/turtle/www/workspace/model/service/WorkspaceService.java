package com.turtle.www.workspace.model.service;


import java.util.List;
import com.turtle.www.workspace.model.vo.Workspace;

public interface WorkspaceService {


	int createWorkspace(Workspace workspace);

	/** 프로젝트 내 워크스페이스 조회 서비스
	 * @param projectNo
	 * @return workspaceList
	 */
	List<Workspace> selectWorkspaceList(int projectNo);

	/** 프로젝트 내의 세션에 담을 워크스페이스넘버 하나 얻어오기 서비스
	 * @param projectNo
	 * @return workspaceNo
	 */
	int selectWorkspaceNo(int projectNo);

	int deleteWorkspace(int workspacetNo);

	int renameWorkspace(Workspace workspace);



}
