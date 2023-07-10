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

	// 멤버초대 검색
	@Override
	public List<Member> searchmember(String input) {
		return dao.searchmember(input);
	}

	@Override
	public int selectMemberNo(String memberEmail) {
		return dao.selectMemberNo(memberEmail);
	}

	@Override
	public int insertProjectMember(ProjectMember pm) {
		return dao.insertProjectMember(pm);
	}

	// 프로젝트 내 로그인 회원의 프로젝트 멤버정보 조회 서비스 구현
	@Override
	public ProjectMember selectProjectMember(Map<String, Object> map) {
		return dao.selectProjectMember(map);
	}

	// 프로젝트 내 pmNo 리스트 조회 서비스 구현
	@Override
	public List<Integer> selectPmNoList(int projectNo) {
		return dao.selectPmNoList(projectNo);
	}

	@Override
	public String getInviteCode(int projectNo) {
		return dao.getInviteCode(projectNo);
	}

	

	
}
