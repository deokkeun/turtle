package com.turtle.www.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.chat.model.vo.ChatMessage;
import com.turtle.www.chat.model.vo.ChatRoom;
import com.turtle.www.chat.model.vo.ChatRoomJoin;

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
		
		// pmNo 받아와서 chatMessage에 담기
		// 1. projectNo 받아오기
		// 2. memberNo 받아오기
		// 3. pmNo받아오기
		
		return sqlSession.insert("chatMapper.insertMessage", chatMessage);
	}


	/** 채팅방 생성 dao
	 * @param chatRoom
	 * @return result
	 */
	public int insertChatRoom(ChatRoom chatRoom) {
		
		int result = sqlSession.insert("chatMapper.insertChatRoom", chatRoom);
		
		if(result > 0) {
			result = chatRoom.getChatRoomNo();
		}
		
		return result;
	}


	/** 채팅방 조인 dao
	 * @param chatRoomJoin
	 * @return result
	 */
	public int insertChatRoomJoin(ChatRoomJoin chatRoomJoin) {

		return sqlSession.insert("chatMapper.insertChatRoomJoin", chatRoomJoin);
	}

	/** 공용 채팅방 번호 리스트 조회 dao
	 * @param projectNo
	 * @return publicChatRoomNoList
	 */
	public List<Integer> selectPublicChatRoomNoList(int projectNo) {

		return sqlSession.selectList("chatMapper.selectPublicChatRoomNoList", projectNo);
	}

	
	/** 워크스페이스 삭제시 채팅방 삭제 dao
	 * @param workspaceNo
	 * @return result
	 */
	public int deleteChatRoom(int workspaceNo) {
		// 삭제할 채팅룸의 채팅룸 정보 얻어오기
		String chatRoomTitle = sqlSession.selectOne("chatMapper.selectChatRoomTitle", workspaceNo);
		
		return sqlSession.update("chatMapper.deleteChatRoom", chatRoomTitle);
	}

	


	

}
