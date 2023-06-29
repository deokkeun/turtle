package com.turtle.www.loadmap.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.loadmap.model.dao.LoadmapDAO;
import com.turtle.www.loadmap.model.vo.Loadmap;

@Service
public class LoadmapServiceImpl implements LoadmapService{

	@Autowired
	private LoadmapDAO dao;

	
	@Override
	public String insertGit(Loadmap loadmap) {

		// 로드맵 주소 세팅
		List<Map<String, Object>> paths = new ArrayList<>();
		
		System.out.println("if전" + loadmap.getGitRepo());
		
		if(loadmap.getGitRepo().equals("")) {
			System.out.println("if null 아니면" + loadmap.getGitRepo());
			return "fail";
		}
		
		Loadmap beforeLoadmap = dao.selectLoadmapByworkspaceNo(loadmap.getWorkspaceNo());
		
		// 로드맵 조회
		System.out.println("로드맵 조회 : " + beforeLoadmap);
		
		
		
		return "complete";
	}
	
	
	
	
}
