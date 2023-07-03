package com.turtle.www.alert.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Alert {

	private int alertNo;
	private int workspaceNo;
	private int pmNo;
	private String alertSection;
	private String alertType;
	private Date alertRegDate;
	private String alertCheckFg;
	private String link;
	
	private String projectName;
	private int projectNo;
	private String workspaceName;
	private String memberName;
	
}
