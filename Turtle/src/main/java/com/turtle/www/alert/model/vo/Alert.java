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
	private String alertContent;
	private int projectNo;
	private int memberNo;
	private Date alertRegDate;
	private String alertCheckFg;
	private String link;
	private int pmNo;
	
	private String projectName;	
	private String memberName;
	
}
