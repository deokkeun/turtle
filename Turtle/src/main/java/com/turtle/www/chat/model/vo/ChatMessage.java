package com.turtle.www.chat.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChatMessage {
	
	private int cmNo; // 채팅메세지 번호
	private String chatMessage; // 채팅메세지 내용
	private Date cmRegDate; // 채팅 메세지 생성일
	private int chatRoomNo; // 채팅방 번호
	private int pmNo; // 프로젝트 멤버 번호
	private String pmProfile; // 프로젝트 멤버 프로필사진
	private String memberName; // 멤버 이름
	
}
