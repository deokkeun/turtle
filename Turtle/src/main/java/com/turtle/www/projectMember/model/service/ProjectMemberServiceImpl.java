package com.turtle.www.projectMember.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.member.model.vo.Member;
import com.turtle.www.projectMember.model.dao.ProjectMemberDAO;
import com.turtle.www.projectMember.model.vo.ProjectMember;

@Service
public class ProjectMemberServiceImpl implements ProjectMemberService {

	@Autowired
	private ProjectMemberDAO dao;

	// pmNo 조회 서비스 구현
	@Override
	public int selectPmNo(Map<String, Object> map) {

		return dao.selectPmNo(map);
	}

	@Override
	public List<Member> searchmember(String input) {
		// TODO Auto-generated method stub
		return dao.searchmember(input);
	}

}
