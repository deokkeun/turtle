package com.turtle.www.projectMember.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.member.model.vo.Member;
import com.turtle.www.projectMember.model.vo.ProjectMember;

@Repository
public class ProjectMemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** pmNo 조회 DAO
	 * @param map
	 * @return pmNo
	 */
	public int selectPmNo(Map<String, Object> map) {
		return sqlSession.selectOne("projectMemberMapper.selectPmNo", map);
	}


	public List<Member> searchmember(String input) {
		return sqlSession.selectList("memberMapper.searchmember", input);
	}


	public int selectMemberNo(String memberEmail) {
		return sqlSession.selectOne("projectMemberMapper.selectMemberNo", memberEmail);
	}


	public int insertProjectMember(ProjectMember pm) {
		return sqlSession.insert("projectMemberMapper.insertProjectMember", pm);
	}


	/** 프로젝트 내 로그인 회원의 프로젝트 멤버정보 조회 dao
	 * @param map
	 * @return projectMember
	 */
	public ProjectMember selectProjectMember(Map<String, Object> map) {
		return sqlSession.selectOne("projectMemberMapper.selectProjectMember", map);
	}


	/** 프로젝트 내 pmNo 리스트 조회 dao
	 * @param projectNo
	 * @return pmNoList
	 */
	public List<Integer> selectPmNoList(int projectNo) {
		return sqlSession.selectList("projectMemberMapper.selectPmNoList", projectNo);
	}


	public String getInviteCode(int projectNo) {
		return sqlSession.selectOne("projectMemberMapper.getInviteCode", projectNo);
	}

	

}
