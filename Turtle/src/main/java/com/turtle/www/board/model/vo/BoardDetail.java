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
	private int BoardNo; // 게시글 번호
	private String boardContent; // 게시글 내용
	private int boardDetailSort; // 게시글 내용 정렬
	
}
