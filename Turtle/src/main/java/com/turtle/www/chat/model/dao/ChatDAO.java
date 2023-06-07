package com.turtle.www.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.chat.model.vo.ChatMessage;
import com.turtle.www.chat.model.vo.ChatRoom;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 채팅방 리스트 조회 DAO
	 * @param map
	 * @return chatRoomList
	 */
	public List<ChatRoom> selectChatRoomList(Map<String, Object> map) {
		
		// 채팅방 리스트 조회
		List<ChatRoom> chatRoomList = sqlSession.selectList("chatMapper.selectChatRoomList", map);
		
		// 개인채팅방 이름 변경
		for(ChatRoom chatRoom : chatRoomList) {
			if(chatRoom.getChatRoomType() == 3) {
				int chatRoomNo = chatRoom.getChatRoomNo();
				map.put("chatRoomNo", chatRoomNo);
				chatRoom.setChatRoomTitle(sqlSession.selectOne("chatMapper.selectChatRoomJoinMember", map));
								
			}
		}
		
		return chatRoomList;
	}
	
	
	/** 채팅 메세지 목록 조회 DAO
	 * @param chatRoomNo
	 * @return chatMessageList
	 */
	public List<ChatMessage> selectChatMessageList(int chatRoomNo) {
		return sqlSession.selectList("chatMapper.selectChatMessageList", chatRoomNo);
	}
	
	
	/** 채팅 메세지 삽입 DAO
	 * @param chatMessage
	 * @return result
	 */
	public int insertMessage(ChatMessage chatMessage) {
		
		return sqlSession.insert("chatMapper.insertMessage", chatMessage);
	}

	


	

}
