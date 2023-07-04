package com.turtle.www.workspace.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.board.model.service.BoardService;
import com.turtle.www.board.model.vo.Board;
import com.turtle.www.memo.model.service.MemoService;
import com.turtle.www.memo.model.vo.Memo;
import com.turtle.www.projectMember.model.service.ProjectMemberService;

@Controller
@RequestMapping("/workspace")
@SessionAttributes({"loginMember", "workspaceNo", "boardNo", "projectNo", "pmNo"})
public class WorkspaceController {
	
//	@Autowired
//	private WorkspaceService service;
//	
//	@Autowired
//	private Project project;
//
	@Autowired
	private BoardService bService;
//
	@Autowired
	private MemoService mService;
//	
//	@Autowired
//	private Loadmap loadmap;
//	
//	@Autowired
//	private Calendar calendar;
//	
	
	public String createWorkspace() {
		
		return null;
		
	}
	
	@GetMapping("/{projectNo}/{workspaceNo}")
	public String enterWorkspace(@PathVariable("projectNo") int projectNo,
									@PathVariable("workspaceNo") int workspaceNo,
									@ModelAttribute("pmNo") int pmNo,
									Model model) {
			model.addAttribute("workspaceNo", workspaceNo);
			
			// 메모장 담기
			Map<String, Object> map = new HashMap<>();
			map.put("pmNo", pmNo);
			map.put("workspaceNo", workspaceNo);
			
			List<Memo> memoList = mService.selectMemoList(map);
			
			model.addAttribute("memoList", memoList);
			
			// 게시글 리스트 담기
			List<Board> boardList = bService.selectBoardList(map);
			model.addAttribute("boardList", boardList);
			
		return "workspace/workspace";
	}
	
}
