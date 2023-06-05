package com.turtle.www.projectMember.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.projectMember.model.dao.ProjectMemberDAO;

@Service
public class ProjectMemberServiceImpl implements ProjectMemberService {

	@Autowired
	private ProjectMemberDAO dao;

	// pmNo 조회 서비스 구현
	@Override
	public int selectPmNo(Map<String, Object> map) {

		return dao.selectPmNo(map);
	}
	
	
}