package com.turtle.www.projectMember.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ProjectMember {
	
	private int pmNo;
	private int projectNo;
	private int memberNo;
	private String projectManager;
	private String profileColor;
	private String pmST;
	private String regDate;
	
	private String profileImg;
	
}
