package com.turtle.www.memo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.member.model.vo.Member;
import com.turtle.www.memo.model.service.MemoService;
import com.turtle.www.memo.model.vo.Memo;

@SessionAttributes({"loginMember"})
@RequestMapping("/workspace")
@Controller
public class MemoController {
	
	Logger logger = LoggerFactory.getLogger(MemoController.class);

	@Autowired
	private MemoService service;
	
	// 메모장 리스트 조회
	@GetMapping("/memo/{workspaceNo}")
	public String memoList(@ModelAttribute("loginMember") Member loginMember,
							Model model,
							@PathVariable("workspaceNo") int workspaceNo) {
		
		List<Memo> memoList = service.selectMemoList(workspaceNo);

		model.addAttribute("memoList", memoList);
		
		return "workspace/memo";
	}
}
