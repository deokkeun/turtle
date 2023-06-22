package com.turtle.www.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.turtle.www.project.model.service.ProjectService;
import com.turtle.www.project.model.vo.Project;

@Controller
@RequestMapping("/project")
@SessionAttributes({"loginMember"})
public class ProjectController {
	
	private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
//	@Autowired
//	private ProjectService service;
		
	/** 프로젝트 생성 기능
	 * @param project
	 * @param req
	 * @param ra
	 * @return
	 */
//	@PostMapping("/createProject")
//	public String createProject(@ModelAttribute() Project project,
//								HttpServletRequest req,
//								RedirectAttributes ra) {
//		
//		logger.info("프로젝트 생성");
//		
//		// 멤버 번호 추가
//		
//		// 초대코드 생성
//		
//		
//		
//		int result = service.createProject(project);
//		
//		String message = null;
//		String path = null;
//		
//		if(result > 0) { // 프로젝트 생성 성공
//			path = "redirect:/";
//			
//		}else {
//			message = "프로젝트 생성에 실패하였습니다.";
//			path = "redirect:/project/createProject";
//		}
//		
//		ra.addFlashAttribute("message", message);
//		
//		return path;
//		
//		
//	}
	
	

}
