package com.turtle.www.chat.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.chat.model.vo.ChatMessage;
import com.turtle.www.chat.model.vo.ChatRoom;
import com.turtle.www.chat.model.vo.ChatRoomJoin;
import com.turtle.www.project.model.vo.Project;

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

	
	/** 채팅방 생성
	 * @param chatRoom
	 * @return result
	 */
	int insertChatRoom(ChatRoom chatRoom);

	/** 채팅방 조인
	 * @param chatRoomJoin
	 * @return result
	 */
	int insertChatRoomJoin(ChatRoomJoin chatRoomJoin);

	/** 공용 채팅방 번호 리스트 조회
	 * @param projectNo
	 * @return publicChatRoomList
	 */
	List<Integer> selectPublicChatRoomNoList(int projectNo);

	/** 워크스페이스 삭제시 채팅방 삭제
	 * @param workspaceNo
	 * @return result
	 */
	int deleteChatRoom(int workspaceNo);

	


}
