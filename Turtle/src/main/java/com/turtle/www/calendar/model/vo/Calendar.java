package com.turtle.www.calendar.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Calendar {
	private int calNo;  // 캘린더 번호
	private int workspaceNo; // 워크스페이스 번
	private int pmNo; // 프로젝트 멤버 번호
	private int updatePmNo; // 수정 프로젝트 멤버 번호
	private String calTitle;  // 캘린더 제목
	private String calContent;  // 캘린더 내용
	private String calColor;  // 캘린더 색상
	private Date calRegDate;  // 캘린더 생성일
	private Date startDate;  // 캘린더 일정 시작일
	private Date endDate;  // 캘린더 일정 종료일
	private String calSt; // 삭제 상태
}
