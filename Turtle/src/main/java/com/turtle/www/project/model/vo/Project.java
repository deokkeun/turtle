package com.turtle.www.project.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Project {

	private int projectNo; // 프로젝트넘버
	private String projectName; // 프로젝트 이름
	private String projectDescription; // 프로젝트 설명
	private String inviteCode; // 프로젝트 초대코드
	private String projectDeleteFG; // 프로젝트 삭제여부
	private String regDate; // 프로젝트 생성일
	private int createMemberNo; // 프로젝트 생성자
	
}
