package com.turtle.www.board.model.websocket;

import java.sql.Date;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.turtle.www.board.model.service.BoardService;
import com.turtle.www.board.model.vo.Board;

public class BoardListWebsocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private BoardService service;
	
	private Set<WebSocketSession> sessions
	= Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	
	// 클라이언트와 연결이 완료되고, 통신할 준비가 되면 수행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
				
		// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션
		System.out.println(session.getId() + " 연결됨");		
				
		sessions.add(session);
		// WebSocketSession을 Set에 추가
	}
	
	// 클라이언트로부터 텍스트 메세지를 전달 받았을 때 수행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("전달된 메시지 : " + message.getPayload());
		
		// Jackson 라이브러리 : Java에서 JSON을 다루기 위한 라이브러리		
		
		// Jackson-databind 라이브러리 :
		// ObjectMapper 객체를 이용해서
		// JSON 데이터를 특정 VO 필드에 맞게 자동 매핑
				
		ObjectMapper objectMapper = new ObjectMapper();
				
		Board board = objectMapper.readValue(message.getPayload(), Board.class);
				
		// 시간세팅
		board.setBoardUpdateDate(new Date(System.currentTimeMillis()));
				
		System.out.println(board);
		
		// 수정된 메모 DB삽입
		
		int result = service.updateBoardTitle(board);
			
		if(result > 0) {
					
			// 같은 방에 접속 중인 클라이언트에게만 메세지 보내기
			// -> Set<WebSocketSession>에서 같은방 클라이언트만 골라내기
					
			for(WebSocketSession s : sessions) {
					
				// WebSocketSession == HttpSession(로그인정보, 워크스페이스번호)을 가로챈 것
				int workspaceNo = (Integer)s.getAttributes().get("workspaceNo");
					
				// WebSocketSession에 담겨있는 워크스페이스넘버와
				// 메시지에 담겨있는 워크스페이스넘버가 같을경우
				// 같은 워크스페이스넘버 클라이언트다.				
				if(workspaceNo == board.getWorkspaceNo())  {
					
					// 같은 워크스페이스넘버 클라이언트에게 JSON형식 메시지를 보냄
					s.sendMessage(new TextMessage(new Gson().toJson(board)));
						
				}
					
			}
		}
	}
	
	// 클라이언트와 연결이 종료되는 수행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessions.remove(session);
		// 웹소켓 연결이 종료되는 경우
		// 종료된 WebSocketSession을 Set에서 제거
		
	}

}
