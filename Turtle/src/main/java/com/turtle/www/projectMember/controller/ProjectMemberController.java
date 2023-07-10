package com.turtle.www.projectMember.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
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
@SessionAttributes({"loginMember", "project", "pmEmail"})
public class ProjectMemberController {
	
	private Logger logger = LoggerFactory.getLogger(ProjectMemberController.class);
	
	@Autowired
	private ProjectMemberService service;
	
	@Autowired
	private ChatService cService;
	
	@Autowired
	private WorkspaceService wService;
	
	@Autowired
	private MemoService mService;
	
	
	// 초대코드 이메일 전송
	@Autowired
    private JavaMailSender mailSender;
	
	
	
	@GetMapping("/createProject")
	public String createProject() {return "project/createProject";}
	
	
	@GetMapping("/createWorkspace")
	public String createWorkspace() {return "project/createWorkspace";}
	
	
	@GetMapping("/inviteMember")
	public String inviteMember() {return "project/inviteMember";}

	
	@ResponseBody
	@GetMapping(value="/searchmember", produces="text/plain;charset=UTF-8")
	public String searchmember(HttpServletRequest req, 
								HttpServletResponse resp, 
								@RequestParam("input") String input
								) throws Exception{
				
	
		List<Member> mlist = service.searchmember(input);

		return new Gson().toJson(mlist);
		
	}
	
	@PostMapping(value = "/inviteMember", produces="text/plain;charset=UTF-8" )
	public String inviteMember(HttpSession session,
							@RequestParam(value="selectEmail", required=false) List<String> selectEmail) {
		
		logger.info("프로젝트멤버 초대");
		
		
		Project project = (Project)session.getAttribute("project");
		
		String inviteCode = project.getInviteCode();
		
		
		if(selectEmail != null) {
			
			for(String toMail : selectEmail) {
				
				logger.info(toMail);
				
				String acceptLink = "http://3.36.176.197:8080/www-1.0.0-BUILD-SNAPSHOT/project/inviteMember/" + toMail + "/" + inviteCode + "/accept";
				String rejectLink = "http://3.36.176.197:8080/www-1.0.0-BUILD-SNAPSHOT/project/inviteMember/" + toMail + "/" + inviteCode + "/reject";
//			    String acceptLink = "http://localhost:8080/www/project/inviteMember/" + toMail + "/" + inviteCode + "/accept";
//			    String rejectLink = "http://localhost:8080/www/project/inviteMember/" + toMail + "/" + inviteCode + "/reject";
			    String acceptButton = "<a href=\"" + acceptLink + "\">수락</a>";
			    String rejectButton = "<a href=\"" + rejectLink + "\">거절</a>";
				
				/* 이메일 보내기 */
		        String setFrom = "admin@gmail.com"; //보내는 이메일
		        String title = project.getProjectName() + "에 함께하실 멤버로 초대합니다!";
		        String content = 
		        		"<p>안녕하세요!</p>" + 
		        		"<p>저희 팀의 " + project.getProjectName() + " 프로젝트에 함께하실 멤버로 초대합니다.</p>" +
		        		" <p>프로젝트에 참여하시면 다음과 같은 혜택을 누릴 수 있습니다:</p>" + 
		        		"<ul> " +
		        		    "<li>프로젝트 공유 및 협업 기능 활용</li>" + 
		        		    "<li>작업 일정 및 업무 할당 관리</li>" +
		        		    "<li>팀원과의 실시간 채팅</li>" +
		        		    "<li>파일 공유 및 버전 관리</li>" +
		        		"</ul>" +
		        		"<p>아래 수락 버튼을 클릭하여 프로젝트에 가입해주세요:</p>" +
		        		"<h3>초대 코드: <span style='color:red'>" + inviteCode + "</span></h3>" +
		        	    "<h2>" + acceptButton + " | " +  rejectButton + "</h2>" +
		        		"<p>프로젝트에 가입하시면 위의 혜택을 누리며, 우리 팀의 성공을 함께 이룰 수 있습니다.</p>" + 
		        		"<p>감사합니다!</p>";
				
		        int result = 0;
		        
		        try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom, "관리자"); // 보내는 사람 지정
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		         
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
				
			}
		}
		return "redirect:/project/inviteMember";
		
	}

	
	@GetMapping("/inviteMember/{memberEmail}/{inviteCode}/accept")
	public String acceptInvitation(HttpSession session,  @PathVariable("memberEmail") String memberEmail,
			@PathVariable("inviteCode") String inviteCode,
            Model model) { 
		
		acceptPostInvitation(inviteCode, memberEmail, session, model);
		
		return "project/acceptForm";
		
	}
	
	
	@PostMapping("/inviteMember/{memberEmail}/{inviteCode}/accept")
	public void acceptPostInvitation(@PathVariable("inviteCode") String inviteCode,
	                               @PathVariable("memberEmail") String memberEmail,
	                               HttpSession session, Model model) {
	    logger.info("초대메일 수락");
	    
	    Project project = (Project) session.getAttribute("project");
	    model.addAttribute("project", project);
	    model.addAttribute("pmEmail", memberEmail);
	    
	    int memberNo = service.selectMemberNo(memberEmail);
	    
	    
	    	ProjectMember pm = new ProjectMember();
	    	pm.setProjectNo(project.getProjectNo());
	    	pm.setMemberNo(memberNo);
	    	
	    	int result = service.insertProjectMember(pm);
	    	
	    	if (result > 0) {
	    		logger.info("pm 삽입 성공");
	    		// 민수
	    		// 멤버 추가시 기존 공용 채팅방에 조인
	    		// 1. 공용 채팅방 번호 확인
	    		List<Integer> publicChatRoomNoList = cService.selectPublicChatRoomNoList(project.getProjectNo());
	    		// 2. 각각의 공용 채팅방 번호 안에 pmNo 조인
	    		for(int publicChatRoomNo : publicChatRoomNoList) {
	    			ChatRoomJoin chatRoomJoin = new ChatRoomJoin();
	    			chatRoomJoin.setChatRoomNo(publicChatRoomNo);
	    			chatRoomJoin.setPmNo(pm.getPmNo());
	    			
	    			int joinResult = cService.insertChatRoomJoin(chatRoomJoin);
	    			if(joinResult > 0) {
						logger.info(pm.getPmNo() + "번 pm넘버 : " + publicChatRoomNo + "번 채팅방 초대 성공");
					}
	    		}	    			    		
	    		// 개인 채팅방 생성
	    		// 1. 프로젝트 내 pmNo 리스트 조회(수락멤버 제외)
	    		List<Integer> pmNoList = service.selectPmNoList(project.getProjectNo());
	    		for(int pmNo : pmNoList) {
	    			if(pmNo != pm.getPmNo()) {
	    				// 수락멤버가 아니면 개인 채팅방 생성
	    				ChatRoom chatRoom = new ChatRoom();
	    	    		chatRoom.setProjectNo(project.getProjectNo());
	    	    		chatRoom.setChatRoomType(3);
	    	    		
	    	    		int chatResult = cService.insertChatRoom(chatRoom);
	    	    		// 채팅방 생성 성공시 나와 프로젝트 멤버 채팅방 조인
	    	    		if(chatResult > 0) {
	    	    			// 수락한 사람 조인
	    	    			ChatRoomJoin chatRoomJoin = new ChatRoomJoin();
	    					chatRoomJoin.setChatRoomNo(chatResult);
	    					chatRoomJoin.setPmNo(pm.getPmNo());
	    					
	    					int joinResult = cService.insertChatRoomJoin(chatRoomJoin);
	    					if(joinResult > 0) {
	    						logger.info( pm.getPmNo() + "번 pm넘버 : " + chatResult + "번 개인 채팅방 초대 성공");
	    					}
	    					
	    					// 기존에 있던 사람 조인
	    					ChatRoomJoin chatRoomJoin2 = new ChatRoomJoin();
	    					chatRoomJoin2.setChatRoomNo(chatResult);
	    					chatRoomJoin2.setPmNo(pmNo);
	    					
	    					int joinResult2 = cService.insertChatRoomJoin(chatRoomJoin2);
	    					if(joinResult2 > 0) {
	    						logger.info( pmNo + "번 pm넘버 : " + chatResult + "번 개인 채팅방 초대 성공");
	    					}
	    	    		}
	    			}
	    		}
	    		
	    		// 초대수락한 회원의 개인 메모장 생성
	    		Memo memo = new Memo();
	    		
	    		// 워크스페이스 조회
	    		List<Workspace> workspaceList = wService.selectWorkspaceList(project.getProjectNo());
	    			
    			for(Workspace workspace : workspaceList) {
    				
	    			memo.setWorkspaceNo(workspace.getWorkspaceNo());
	    			memo.setPmNo(pm.getPmNo());
	    			memo.setMemoType("personal");
    			
	    			int result1 = mService.insertMemo(memo);
	    			if(result1 > 0) {
	    				logger.info(workspace.getWorkspaceNo() + "번워크스페이스 : " + pm.getPmNo() +"회원의 첫번째 개인 메모장 생성");
	    			}
	    			int result2 = mService.insertMemo(memo);
	    			if(result2 > 0) {
	    				logger.info(workspace.getWorkspaceNo() + "번워크스페이스 : " + pm.getPmNo() +"회원의 두번째 개인 메모장 생성");
	    			}
    			}
    		}
	    	
	    	// 경로 + 이미 있으면 삽입 x
	    
	}
	
	
	@GetMapping("/inviteMember/{memberEmail}/{inviteCode}/reject")
	public String rejectInvitation(HttpSession session,  @PathVariable("memberEmail") String memberEmail,
			@PathVariable("inviteCode") String inviteCode,
            Model model) { 
		
		rejectPostInvitation(inviteCode, memberEmail, session);
		
		return "project/rejectForm";
		
		
	}


	@PostMapping("/inviteMember/{memberEmail}/{inviteCode}/reject")
	public void rejectPostInvitation(@PathVariable("inviteCode") String inviteCode,
								@PathVariable("memberEmail") String memberEmail,
								HttpSession session) {
		
		logger.info("초대메일 거절");
		

		
	    
	}


//	@PostMapping("chatList")
//	public String chatList() {
//		
//		
//		
//		
//		return "/common/main";
//		
//	}

}