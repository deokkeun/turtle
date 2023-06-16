//package com.turtle.www.calendar.model.websocket;
//
//import java.sql.Date;
//import java.util.Collections;
//import java.util.HashSet;
//import java.util.Set;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;
//import com.turtle.www.calendar.model.service.CalendarService;
//import com.turtle.www.calendar.model.vo.Calendar;
//
//public class CalendarWebsocketHandler extends TextWebSocketHandler{
//
//	@Autowired
//	private CalendarService service;
//	
//
//	private Set<WebSocketSession> sessions
//		= Collections.synchronizedSet(new HashSet<WebSocketSession>());
//	// synchronizedSet : 동기화된 Set 반환
//	// -> 멀티스레드 환경에서 하나의 컬렉션 요소에 여러 스레드가 접근하면 충돌이 발생할 수 있으므로
//	// 동기화(충돌이 안나도록 줄세움)을 진행
//	
//
//
//	// 클라이언트와 연결이 완료되고, 통신할 준비가 되면 수행
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션
//		System.out.println(session.getId() + "연결됨");
//		
//		sessions.add(session);
//		// WebSocketSession을 Set에 추가
//	}
//	
//	
//	// 클라이언트로부터 텍스트 메세지를 전달 받았을 때 수행
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		// TextMessage : 웹소켓을 이용해 텍스트로 전달된 메세지가 담겨있는 객체
//		
//		// payload : 전송되는 데이터
//		
//		// message.getPayload()
//		
//		System.out.println("전달된 메세지 : " + message.getPayload());
//		
//		// Jackson 라이브러리 : Java에서 JSON을 다루기 위한 라이브러리
//		
//		// Jackson-databind 라이브러리 :
//		// ObjectMapper 객체를 이용해서
//		// JSON 데이터를 특정 VO 필드에 맞게 자동 매핑
//		
//		ObjectMapper objectMapper = new ObjectMapper();
//		
//		Calendar calendar = objectMapper.readValue(message.getPayload(), Calendar.class);
//		
//		// 시간세팅
//		calendar.setCalRegDate(new Date(System.currentTimeMillis()));
//		
//		System.out.println(calendar);
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		// 일정 DB 삽입
//		int result = service.insertEvent(calendar);
//		
//		if(result> 0) {
//		
//			// 같은 방에 접속 중인 클라이언트에게만 메세지 보내기
//			// -> Set<WebSocketSession>에서 같은방 클라이언트만 골래니기
//			
//			for(WebSocketSession s : sessions) {
//				// WebSocketSession == HttpSession(로그인정보, 채팅방번호)을 가로챈 것
//				int chatRoomNo = (Integer)s.getAttributes().get("chatRoomNo");
//				
//				// WebSocketSession에 담겨있는 채팅방번호와
//				// 메세지에 담겨있는 채팅방 번호가 같을 경우
//				// 같은방 클라이언트다.
//				if(chatRoomNo == chatMessage.getChatRoomNo()) {
//					
//					// 같은방 클라리언트에게 JSON형식 메세지를 보냄
//					s.sendMessage(new TextMessage(new Gson().toJson(chatMessage)));
//					
//				}
//				
//			}
//		}
//		
//		
//	}
//
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//}
