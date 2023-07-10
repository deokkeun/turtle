package com.turtle.www.memo.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Memo {
	
	private int memoNo; // 메모장 번호
	private int workspaceNo; // 워크스페이스 번호
	private int pmNo; // 생성 or 수정한 프로젝트 멤버 번호
	private String memoContent; // 메모장 내용
	private Date memoRegDate; // 메모장 생성일
	private Date memoUpdateDate; // 메모장 수정일
	private String memoBgColor; // 메모장 색상
	private String memoSt; // 메모 삭제 여부
	private String memoType; // 메모타입
	private String memberName; // 멤버 이름
	private String profileImg; // 멤버 프로필
}
