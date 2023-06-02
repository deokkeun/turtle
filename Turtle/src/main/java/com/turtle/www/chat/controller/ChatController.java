package com.turtle.www.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.turtle.www.chat.model.service.ChatService;
import com.turtle.www.member.model.vo.Member;

@RequestMapping("/chat")
@Controller
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	// 채팅방 목록 조회
	@GetMapping("/chatRoomList")
	public String chatRoomList(@ModelAttribute("loginMember") Member loginMember ,Model model) {
		
		
		
		//워크스페이스 채팅방 리스트 조회		
		//개인 채팅방용 프로젝트 멤버 조회
		
		return "chat/chatRoomList";
	}
	
	
}
