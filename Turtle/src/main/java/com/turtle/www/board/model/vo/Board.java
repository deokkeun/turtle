package com.turtle.www.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Board {
	
	private int boardNo; //게시글 번호
	private int workspaceNo; // 워크스페이스 번호
	private String boardTitle; // 게시글 제목
	private int pmNo; // 작성 프로젝트멤버 번호
	private int updatePmNo; // 수정 프로젝트멤버 번호
	private Date boardRegDate; // 게시글 작성일
	private Date boardUpdateDate; // 게시글 수정일
	private Date eventStartDate; // 이벤트 시작일
	private Date eventEndDate; // 이벤트 종료일
	private int boardSort; // 게시글 정렬
	private String boardSt; // 게시글 삭제여부
	
	private String regMemberName; // 생성 멤버 이름
	private String regProfileImg; // 생성 멤버 프로필 이미지
	private String updateMemberName; // 수정 멤버 이름
	private String updateProfileImg; // 수정 멤버 프로필 이미지
	
}
