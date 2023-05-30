package com.turtle.www.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 로그인(회원정보 가져오기)
	 * @param inputMember
	 * @return
	 */
	public Member login(Member inputMember) {
		return sqlSession.selectOne("memberMapper.login", inputMember);
	}
	
//	@Autowired
//	private Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	

}
