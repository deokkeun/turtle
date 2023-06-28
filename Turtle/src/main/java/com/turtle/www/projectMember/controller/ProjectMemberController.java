package com.turtle.www.projectMember.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.project.controller.ProjectController;
import com.turtle.www.project.model.vo.Project;
import com.turtle.www.projectMember.model.service.ProjectMemberService;
import com.turtle.www.projectMember.model.vo.ProjectMember;

@Controller
@RequestMapping("/project")
@SessionAttributes({"loginMember", "project", "mlist"})
public class ProjectMemberController {
	
	// 초대코드 이메일 전송
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	private ProjectMemberService service;
	
	private Logger logger = LoggerFactory.getLogger(ProjectMemberController.class);
	
	
	@GetMapping("/createProject")
	public String createProject() {return "project/createProject";}
	
	@GetMapping("/createWorkspace")
	public String createWorkspace() {return "project/createWorkspace";}
	
	
	
	@ResponseBody
	@GetMapping(value="/searchmember", produces="text/plain;charset=UTF-8")
	public String searchmember(HttpServletRequest req, HttpServletResponse resp, @RequestParam("input") String input, Model model) throws Exception{
				
	
		List<Member> mlist = service.searchmember(input);
		model.addAttribute(mlist);
			
		return new Gson().toJson(mlist);
		
	}
	
	
	@PostMapping("inviteMember")
	public String inviteMember(@ModelAttribute("projectNo") Project projectNo,
								@ModelAttribute("mlist") List<Member> mlist
			) {
		
		for (int i = 0; i < mlist.size(); i++) {
			Member member = mlist.get(i);
			System.out.println(member);
		}
		
		
		
		return null;
		
	}

}
