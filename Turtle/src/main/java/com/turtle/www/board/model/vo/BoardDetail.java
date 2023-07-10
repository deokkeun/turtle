package com.turtle.www.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BoardDetail {
	
	private int boardDetailNo; // 게시글 내용 번호
	private int boardNo; // 게시글 번호
	private String boardContent; // 게시글 내용
	private int boardDetailSort; // 게시글 내용 정렬
	
	
	private int pmNo; // 게시글 수정
	private String memberName; // 수정 멤버 이름
	private String profileImage; // 수정 멤버 프로필 이미지
	private int workspaceNo; // 워크스페이스넘버	
}
