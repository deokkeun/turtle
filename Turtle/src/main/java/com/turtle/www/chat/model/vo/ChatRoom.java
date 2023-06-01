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
	private String chatRoomName; // 채팅방 이름
	private String chatRoomStatus; // 채팅방 유무
	private String chatRoomRegDate; // 채팅방 개설일
	private int pmNo; // 프로젝트 멤버 번호
	private String pmNickname; // 프로젝트 멤버 닉네임
	private int workspaceNo; // 워크스페이스 번호
	
}
