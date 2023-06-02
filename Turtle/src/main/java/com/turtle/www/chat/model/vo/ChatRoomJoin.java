package com.turtle.www.chat.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChatRoomJoin {
		
	private int pmNo; // 프로젝트 멤버 번호
	private int chatRoomNo; // 채팅방 번호
}
