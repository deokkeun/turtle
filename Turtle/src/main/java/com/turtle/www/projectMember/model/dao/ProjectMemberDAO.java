package com.turtle.www.projectMember.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
