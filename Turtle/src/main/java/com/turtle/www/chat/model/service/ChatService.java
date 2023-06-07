package com.turtle.www.chat.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.chat.model.vo.ChatMessage;
import com.turtle.www.chat.model.vo.ChatRoom;

public interface ChatService {

	
	/** 채팅방 리스트 조회 서비스
	 * @param map
	 * @return chatRoomList
	 */
	List<ChatRoom> selectChatRoomList(Map<String, Object> map);
	
	/** 채팅 메세지 목록 조회 서비스
	 * @param chatRoomNo
	 * @return chatMessageList
	 */
	List<ChatMessage> selectChatMessageList(int chatRoomNo);
	
	/** 채팅 메세지 삽입 서비스
	 * @param chatMessage
	 * @return result
	 */
	int insertMessage(ChatMessage chatMessage);

	


}
