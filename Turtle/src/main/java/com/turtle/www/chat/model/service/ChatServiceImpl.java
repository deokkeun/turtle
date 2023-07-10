package com.turtle.www.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.chat.model.dao.ChatDAO;
import com.turtle.www.chat.model.vo.ChatMessage;
import com.turtle.www.chat.model.vo.ChatRoom;
import com.turtle.www.chat.model.vo.ChatRoomJoin;
import com.turtle.www.common.Util;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO dao;
	
	// 채팅방 리스트 조회 서비스 구현
	@Override
	public List<ChatRoom> selectChatRoomList(Map<String, Object> map) {

		return dao.selectChatRoomList(map);
	}
	
	
	// 채팅 메세지 목록 조회 서비스 구현
	@Override
	public List<ChatMessage> selectChatMessageList(int chatRoomNo) {
		return dao.selectChatMessageList(chatRoomNo);
	}



	// 채팅 메세지 삽입 서비스 구현
	@Override
	public int insertMessage(ChatMessage chatMessage) {
		
		chatMessage.setChatMessage(Util.newLineHandling(chatMessage.getChatMessage()));
		
		return dao.insertMessage(chatMessage);
	}


	// 채팅방 생성 서비스 구현
	@Override
	public int insertChatRoom(ChatRoom chatRoom) {
		return dao.insertChatRoom(chatRoom);
	}


	// 채팅방 조인 서비스 구현
	@Override
	public int insertChatRoomJoin(ChatRoomJoin chatRoomJoin) {
		return dao.insertChatRoomJoin(chatRoomJoin);
	}


	// 공용 채팅방 번호 리스트 조회 서비스 구현
	@Override
	public List<Integer> selectPublicChatRoomNoList(int projectNo) {
		return dao.selectPublicChatRoomNoList(projectNo);
	}


	// 워크스페이스 삭제시 채팅방 삭제
	@Override
	public int deleteChatRoom(int workspaceNo) {
		return dao.deleteChatRoom(workspaceNo);
	}



	
	
	
}
