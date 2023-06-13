package com.turtle.www.workspace.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Workspace {
	
	private int workspaceNo; // 워크스페이스번호
	private int projectNo; // 프로젝트번호
	private String workspaceName; //워크스페이스이름
	private String workspaceImage; //워크스페이스이미지
	private int sort; // 워크스페이스 내 위치조정
	private String workspaceRegDate; // 워크스페이스 생성일
	
}
