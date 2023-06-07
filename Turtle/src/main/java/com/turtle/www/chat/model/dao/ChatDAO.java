package com.turtle.www.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.www.chat.model.vo.ChatMessage;
import com.turtle.www.chat.model.vo.ChatRoom;

@Repository
public class ChatDAO {
	
	private SqlSessionTemplate sqlSession;

	
	/** 채팅방 리스트 조회 DAO
	 * @param map
	 * @return chatRoomList
	 */
	public List<ChatRoom> selectChatRoomList(Map<String, Object> map) {
		return sqlSession.selectList("chatMapper.selectChatRoomList", map);
	}
	
	/** 채팅 메세지 삽입 DAO
	 * @param chatMessage
	 * @return result
	 */
	public int insertMessage(ChatMessage chatMessage) {
		
		return sqlSession.insert("chatMapper.insertMessage", chatMessage);
	}


	

}
