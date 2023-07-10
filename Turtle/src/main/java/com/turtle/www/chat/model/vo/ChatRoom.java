package com.turtle.www.chat.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChatRoom {
	
	private int chatRoomNo; // 채팅방 번호
	private String chatRoomTitle; // 채팅방 이름
	private String chatRoomST; // 채팅방 유무
	private int projectNo; // 프로젝트 번호
	private int chatRoomType; // 채팅방 타입
	
}