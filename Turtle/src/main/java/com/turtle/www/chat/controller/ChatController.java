package com.turtle.www.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.turtle.www.chat.model.service.ChatService;

@RequestMapping("/chat")
@Controller
public class ChatController {
	

	
	@GetMapping("/chatRoomList")
	public String chatRoomList() {
		
		return "chat/chatRoomList";
	}
	
	
}
