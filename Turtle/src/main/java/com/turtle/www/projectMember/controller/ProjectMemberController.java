package com.turtle.www.projectMember.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.projectMember.model.service.ProjectMemberService;
import com.turtle.www.projectMember.model.vo.ProjectMember;

@Controller
@RequestMapping("/project")
public class ProjectMemberController {
	
	
	@Autowired
	private ProjectMemberService service;
	
	
	@GetMapping("/createProject")
	public String createFroject() {return "project/createFroject";}
	
	@GetMapping("/createWorkspace")
	public String createWorkspace() {return "project/createWorkspace";}
	
	
	
	@ResponseBody
	@GetMapping(value="/searchmember", produces="text/plain;charset=UTF-8")
	public String searchmember(HttpServletRequest req, HttpServletResponse resp, @RequestParam("input") String input) throws Exception{
				
	
		List<Member> mlist = service.searchmember(input);
			
		return new Gson().toJson(mlist);
		
	}
	
	
	/** 메모 업데이트 멤버 정보 조회
	 * @param memoNo
	 * @return projectMember
	 */
	@ResponseBody
	@GetMapping("/selectMemoProjectMember")
	public String selectMemoProjectMember(int memoNo) {
		
		ProjectMember projectMember = service.selectMemoProjectMember(memoNo);
		
		return new Gson().toJson(projectMember);
	}

}
