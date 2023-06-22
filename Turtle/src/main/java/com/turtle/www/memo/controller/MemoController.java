package com.turtle.www.memo.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.member.model.vo.Member;
import com.turtle.www.memo.model.service.MemoService;
import com.turtle.www.memo.model.vo.Memo;
import com.turtle.www.projectMember.model.service.ProjectMemberService;

@SessionAttributes({"loginMember", "workspaceNo"})
@RequestMapping("/workspace/memo")
@Controller
public class MemoController {
	
	Logger logger = LoggerFactory.getLogger(MemoController.class);

	@Autowired
	private MemoService service;
	@Autowired
	private ProjectMemberService pmService;	
	
	// 메모장 리스트 조회
	@GetMapping("/{projectNo}/{workspaceNo}")
	public String memoList(@ModelAttribute("loginMember") Member loginMember,
							Model model,
							@PathVariable("projectNo") int projectNo,
							@PathVariable("workspaceNo") int workspaceNo) {
		
		// memberNo와 projectNo로 pmNo확인
		int memberNo = loginMember.getMemberNo();
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int pmNo = pmService.selectPmNo(map);
		
		map.put("pmNo", pmNo);
		map.put("workspaceNo", workspaceNo);
		
		List<Memo> memoList = service.selectMemoList(map);

		
		model.addAttribute("workspaceNo", workspaceNo); // session에 올림
		model.addAttribute("memoList", memoList);
		model.addAttribute("pmNo", pmNo);
		
		return "workspace/memo";
	}
	
	// 개인 메모장 수정
	@ResponseBody
	@GetMapping("/updateMemo")
	public int updatePersonalMemo(Memo memo) {
		
		return service.updateMemo(memo);
	}
}
