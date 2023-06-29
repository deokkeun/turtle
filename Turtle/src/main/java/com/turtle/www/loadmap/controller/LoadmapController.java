package com.turtle.www.loadmap.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.loadmap.model.service.LoadmapService;
import com.turtle.www.loadmap.model.vo.Loadmap;
import com.turtle.www.memo.controller.MemoController;

@Controller
@RequestMapping("/workspace/loadmap")
@SessionAttributes({"projectNo", "workspaceNo"})
public class LoadmapController {
	
	@Autowired
	private LoadmapService service;

	Logger logger = LoggerFactory.getLogger(MemoController.class);
	
	
	
	/** 깃 로드맵 페이지 이동
	 * @return
	 */
	@GetMapping("/{projectNo}/{workspaceNo}")
	public String loadmap(@PathVariable("projectNo") int projectNo,
							@PathVariable("workspaceNo") int workspaceNo) {
		
		
		logger.debug("깃 로드맵" + projectNo);
		logger.debug("깃 로드맵" + workspaceNo);
		
		
		return "workspace/loadmap";
	}
	

	@ResponseBody
	@PostMapping("/upload")
	public String upload(Loadmap loadmap) {
		

		System.out.println("upload Controller");
		
		String res = service.insertGit(loadmap);
		
		System.out.println(res);
		
		return res;
	}
	
	

}
