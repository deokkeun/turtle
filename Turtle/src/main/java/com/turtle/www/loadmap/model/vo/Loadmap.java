package com.turtle.www.loadmap.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Loadmap {

	private int loadmapNo; // 로드맵 번호
	private int workspaceNo; // 워크스페이스 번호
	private String gitRepo; // 깃허브 주소(이름)
	private String gitTree; // 깃 트리
	private String branch; // 브랜치
	private String ignore; // ignore 파일
	private Date loadmapRegDate; // 생성일
	
}
