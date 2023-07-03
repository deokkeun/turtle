package com.turtle.www.loadmap.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.turtle.www.loadmap.model.service.LoadmapService;
import com.turtle.www.loadmap.model.vo.GitCommit;
import com.turtle.www.loadmap.model.vo.Loadmap;
import com.turtle.www.memo.controller.MemoController;

@Controller
@RequestMapping("/workspace/loadmap")
@SessionAttributes({"projectNo", "workspaceNo", "gitCommitList", "loadmap"})
public class LoadmapController {
	
	@Autowired
	private LoadmapService service;

	Logger logger = LoggerFactory.getLogger(MemoController.class);
	
	
	
	/** 깃 로드맵 페이지 이동
	 * @return
	 */
	@GetMapping("/{projectNo}/{workspaceNo}")
	public String loadmap(@PathVariable("projectNo") int projectNo,
							@PathVariable("workspaceNo") int workspaceNo,
							Model model) {
		
		System.out.println("projectNo" + projectNo);
		
		Loadmap loadmap = service.selectLoadmap(workspaceNo);
		if(loadmap!=null) {
			List<GitCommit> gitCommitList = service.selectGitCommitListByLoadmapNo(loadmap.getLoadmapNo());
			model.addAttribute("gitCommitList" , gitCommitList);
			List<String> fileJson = new ArrayList<>();
		}
		
		model.addAttribute("loadmap",loadmap);
		System.out.println("---------------- loadmap ------------------" + loadmap);
		
		return "workspace/loadmap";
	}
	

	@ResponseBody
	@PostMapping("/upload")
	public String upload(Loadmap loadmap) {
		
		String res = service.insertGit(loadmap);
		
		
		System.out.println("----------------------------------upload----------------------------------");
		System.out.println(res);
		
		return new Gson().toJson(res);
	}
	

	
	@ResponseBody
	@PostMapping(value = "/workspace/loadmap/commitList", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public GitCommit commitList(@RequestBody Loadmap loadmap) {
		
		GitCommit newCommit = service.selectNewCommitList(loadmap);

		
		System.out.println("----------------------------------newCommit----------------------------------");
		System.out.println(newCommit);
		
		
		return newCommit;
	}
	
	

}
