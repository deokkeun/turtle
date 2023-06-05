package com.turtle.www.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.chat.model.service.ChatService;
import com.turtle.www.chat.model.vo.ChatRoom;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.projectMember.model.service.ProjectMemberService;

@SessionAttributes({"loginMember"})
@RequestMapping("/chat")
@Controller
public class ChatController {
	
	Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatService cService;
	@Autowired
	private ProjectMemberService pmService;
	
	// 채팅방 목록 조회
	@GetMapping("/chatRoomList")
	public String chatRoomList(@ModelAttribute("loginMember") Member loginMember, 
			Model model,
			int projectNo) {
		
		System.out.println(projectNo);
		logger.info("projectNo : " + projectNo);
		// memberNo와 projectNo로 pmNo확인
		int memberNo = loginMember.getMemberNo();
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int pmNo = pmService.selectPmNo(map);
		
		logger.info("memberNo " + memberNo + "의 " + projectNo + "번 프로젝트 안 PmNo : " + pmNo);
		
		// 받아온 pmNo로 채팅방 리스트 조회
		map.put("pmNo", pmNo);
		List<ChatRoom> chatRoomList = cService.selectChatRoomList(map);
		
		model.addAttribute("chatRoomList", chatRoomList);
		
		//워크스페이스 채팅방 리스트 조회		
		//개인 채팅방용 프로젝트 멤버 조회
		
		return "chat/chatRoomList";
	}
	
	
}
