package com.turtle.www.board.controller;

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

import com.turtle.www.board.model.service.BoardService;
import com.turtle.www.board.model.vo.Board;
import com.turtle.www.board.model.vo.BoardDetail;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.projectMember.model.service.ProjectMemberService;

@SessionAttributes({"loginMember", "workspaceNo"})
@RequestMapping("/board")
@Controller
public class BoardController {

	Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	@Autowired
	private ProjectMemberService pmService;
	
	// 게시글 리스트 조회
	@GetMapping("/boardList/{projectNo}/{workspaceNo}")
	public String boardList(@ModelAttribute("loginMember") Member loginMember,
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
		
		List<Board> boardList = service.selectBoardList(map);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("projectNo", projectNo);		
		model.addAttribute("workspaceNo", workspaceNo); // session에 올림
		model.addAttribute("pmNo", pmNo);
		
		
		return "board/boardList";
	}
	
	// 게시글 상세조회
	@GetMapping("/boardDetail/{projectNo}/{workspaceNo}/{boardNo}")
	public String selectBoardDetail(@ModelAttribute("loginMember") Member loginMember,
									Model model,
									@PathVariable("projectNo") int projectNo,
									@PathVariable("workspaceNo") int workspaceNo,
									@PathVariable("boardNo") int boardNo) {
		
		// memberNo와 projectNo로 pmNo확인
		int memberNo = loginMember.getMemberNo();
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int pmNo = pmService.selectPmNo(map);
		
		map.put("pmNo", pmNo);
		map.put("workspaceNo", workspaceNo);
		
		Board board = service.selectBoard(boardNo);
		
		List<BoardDetail> boardDetailList = service.selectBoardDetail(boardNo);
		
		model.addAttribute("board", board);
		model.addAttribute("boardDetailList", boardDetailList);
		model.addAttribute("projectNo", projectNo);		
		model.addAttribute("workspaceNo", workspaceNo); // session에 올림
		model.addAttribute("pmNo", pmNo);
		
		return "board/boardDetail";
	}
	
	// 게시글 정렬 조회
	@ResponseBody
	@GetMapping("/selectBoardSort")
	public List<Board> selectBoardSort(int workspaceNo) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("workspaceNo", workspaceNo);
		
		return service.selectBoardList(map);
	}
	
}
