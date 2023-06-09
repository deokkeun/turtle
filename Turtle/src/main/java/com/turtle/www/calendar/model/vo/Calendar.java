package com.turtle.www.calendar.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Calendar {
	private int calNo;
	private int workspaceNo;
	private int PMNo;
	private String calTitle;
	private String calContent;
	private String calColor;
	private Date calRegDate;
	private Date startDate;
	private Date endDate;
}
