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


	

}
