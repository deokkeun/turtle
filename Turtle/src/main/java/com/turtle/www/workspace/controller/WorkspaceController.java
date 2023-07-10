package com.turtle.www.workspace.controller;


import java.util.Arrays;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.turtle.www.board.model.service.BoardService;
import com.turtle.www.board.model.vo.Board;
import com.turtle.www.chat.model.service.ChatService;
import com.turtle.www.chat.model.vo.ChatRoom;
import com.turtle.www.chat.model.vo.ChatRoomJoin;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.memo.model.service.MemoService;
import com.turtle.www.memo.model.vo.Memo;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.model.service.ProjectMemberService;
import com.turtle.www.projectMember.model.vo.ProjectMember;
import com.turtle.www.workspace.model.service.WorkspaceService;
import com.turtle.www.workspace.model.vo.Workspace;

@Controller
@RequestMapping("/project")
@SessionAttributes({"loginMember", "projectMember", "project", "workspaceNo", "boardNo", "projectNo", "pmNo"})
public class WorkspaceController {
	
	private Logger logger = LoggerFactory.getLogger(WorkspaceController.class);
	
	@Autowired
	private WorkspaceService service;

//	@Autowired
//	private Project project;
//
	@Autowired
	private BoardService bService;
//
	@Autowired
	private MemoService mService;
	
	@Autowired
	private ChatService cService;
	
	@Autowired
	private ProjectMemberService pmService;
//	
//	@Autowired
//	private Loadmap loadmap;
//	
//	@Autowired
//	private Calendar calendar;
	
	
	// 워크스페이스 생성
	@PostMapping("/createWorkspace")
	public String createWorkspace(@ModelAttribute("projectNo") int projectNo,
							
							@ModelAttribute("loginMember") Member loginMember,
							@ModelAttribute("workspace") Workspace workspace,
                            @RequestParam("workspaceName") String workspaceName,
//                            @RequestParam(value="selected", required=false) List<String> selected,
                            Model model
					) {
		
		logger.info("워크스페이스 생성");
		logger.info(workspaceName);
		
		workspace.setProjectNo(projectNo);
		
		// 워크스페이스 이모지, 워크스페이스 이름
		int workspaceNo = service.createWorkspace(workspace);
		
		model.addAttribute(workspaceNo);
		
		// 민수
		// 생성된 워크스페이스가 로드맵이나 캘린더가 아닐 시 채팅방 생성
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setChatRoomTitle(workspaceName);
		chatRoom.setProjectNo(projectNo);
		chatRoom.setChatRoomType(2);
		
		int chatResult = cService.insertChatRoom(chatRoom);
		// 채팅방 생성 성공시 프로젝트멤버 확인 후 채팅방 조인
		if(chatResult > 0) {
			// 프로젝트 멤버내 pmNo 리스트 조회
			List<Integer> pmNoList = pmService.selectPmNoList(projectNo);
			for(int pmNo : pmNoList) {
				ChatRoomJoin chatRoomJoin = new ChatRoomJoin();
				chatRoomJoin.setChatRoomNo(chatResult);
				chatRoomJoin.setPmNo(pmNo);
				
				int joinResult = cService.insertChatRoomJoin(chatRoomJoin);
				if(joinResult > 0) {
					logger.info(pmNo + "번 pm넘버 : " + chatResult + "번 워크스페이스 채팅방 초대 성공");
				}
				
			}			
			
		}
		
		//워크스페이스 생성시 메모장 생성
		//memytype pmNo workspaceNo
		Memo memo = new Memo();
		memo.setWorkspaceNo(workspaceNo);
		// 생성자 pmNo 받아오기
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("projectNo", projectNo);
		int projectManagerNo = pmService.selectPmNo(map);
		memo.setPmNo(projectManagerNo);
		memo.setMemoType("workspace");

		// 1. 공용 메모장 생성
		int result = mService.insertMemo(memo);
		if(result > 0) {
			logger.info(workspaceNo + "첫번째 공용 메모장 생성");
		}
		int result2 = mService.insertMemo(memo);
		if(result2 > 0) {
			logger.info(workspaceNo + "두번째 공용 메모장 생성");
		}
		// 2. 개인 메모장 생성
		List<Integer> pmNoList = pmService.selectPmNoList(projectNo);
		for(int pmNo : pmNoList) {
			memo.setWorkspaceNo(workspaceNo);
			memo.setPmNo(pmNo);
			memo.setMemoType("personal");
			
			int result3 = mService.insertMemo(memo);
			if(result3 > 0) {
				logger.info(workspaceNo + "번워크스페이스 : " + pmNo +"회원의 첫번째 개인 메모장 생성");
			}
			int result4 = mService.insertMemo(memo);
			if(result4 > 0) {
				logger.info(workspaceNo + "번워크스페이스 : " + pmNo +"회원의 번째 개인 메모장 생성");
			}
		}
		
		
//		return "redirect:/project/" + project.getProjectNo();
		return "redirect:/project/inviteMember";
		
		
	}
	
	// 선택한 템플릿 내용 받아오기
	@PostMapping("/createTemplate")
	public void createTemplate(@ModelAttribute("project") Project project,
						@ModelAttribute("loginMember") Member loginMember,
						@RequestParam(value="selected", required=false) String[] selected,
						@RequestParam(value="workspace", required=false) String[] template,
			            @RequestParam(value="wokrspaceName", required=false) String[] templateName) {
		
		logger.info("템플릿 생성");
		
		// 선택한 템플릿
		System.out.print("template" + Arrays.asList(template)); // ex) [게시판, 캘린더, 스티커, 깃]
		System.out.print("templateName" + Arrays.asList(templateName)); // 설정한 이름 ex) [공지사항, 일정표, 스티커 메모장, 깃 로드맵]
		System.out.print("selected" + Arrays.asList(selected)); // 설정한 이름 ex) [공지사항, 일정표, 스티커 메모장, 깃 로드맵]
		
		// 선택한 템플릿 생성 구문
		for(int i = 0; i < template.length; i++) {
			
			logger.info("template : " + template[i]);
			logger.info("templateName : " + templateName[i]);
			
			logger.info(selected[i]);
			

		}	
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
	
	@ResponseBody
	@PostMapping("/deleteWorkspace")
	public String deleteWorkspace(@RequestParam("workspaceNo") int workspaceNo, ProjectMember projectMember) {
		logger.info("워크스페이스 삭제");
		
		int result = 0;
		
		if(projectMember.getProjectManager().equals("Y")) {
			
			result = service.deleteWorkspace(workspaceNo);
			if(result > 0) {
				// 삭제 되었다면 채팅방도 삭제
				result = cService.deleteChatRoom(workspaceNo);
				if(result > 0) {
					logger.info(workspaceNo + "번 채팅방 삭제");
				}
			}
			
		}else {
			result = 2;
		}
		
		return new Gson().toJson(result);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/renameWorkspace", method = RequestMethod.POST)
	public String renameWorkspace(@RequestParam("workspaceNo") int workspaceNo,
								@RequestParam("workspaceName") String workspaceName, @ModelAttribute() ProjectMember projectMember) {
		logger.info("============================");
		logger.info("워크스페이스 이름 변경");
		System.out.println(workspaceNo);
		logger.info(workspaceName);
		logger.info(projectMember.getProjectManager());
		int result = 0;
		
		Workspace workspace = new Workspace();
		workspace.setWorkspaceNo(workspaceNo);
		workspace.setWorkspaceName(workspaceName);
	
		if(projectMember.getProjectManager().equals("Y")) {
			
			result = service.renameWorkspace(workspace);
			System.out.println(result);
			
		}else {
			result = 2;
		}
		
		return new Gson().toJson(result);
	}
	
}
