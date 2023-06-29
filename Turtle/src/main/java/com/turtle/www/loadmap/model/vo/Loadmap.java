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

	private int loadmapNo;
	private int workspaceNo;
	private String gitRepo;
	private String gitTree;
	private String branch;
	private String ignore;
	private Date loadmapRegDate;
	
}
