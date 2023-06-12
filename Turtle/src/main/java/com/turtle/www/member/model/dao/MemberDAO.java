package com.turtle.www.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 로그인(회원정보 가져오기) DAO
	 * @param inputMember
	 * @return
	 */
	public Member login(Member inputMember) {
		return sqlSession.selectOne("memberMapper.login", inputMember);
	}

	/** 이메일 중복검사 DAO
	 * @param memberEmail
	 * @return
	 */
	public int emailDupCheck(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}

	/** 회원가입 DAO
	 * @param inputMember
	 * @return
	 */
	public int signUp(Member inputMember) {
		
		int result = sqlSession.insert("memberMapper.signUp", inputMember);
		
		return result;
	}
	
	
	/** 이메일 인증번호 저장 DAO : 처음으로 인증번호를 발급 받음 -> 삽입(INSERT)
	 * @param map
	 * @return
	 */
	public int insertCertification(Map<String, Object> map) {
		return sqlSession.insert("memberMapper.insertCertification", map);
	}

	/** 이메일 인증번호 저장 DAO (UPDATE)
	 * @param map
	 * @return
	 */
	public int updateCertification(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateCertification", map);
	}
	
	/** 이메일 인증번호 일치 확인 DAO
	 * @param map
	 * @return
	 */
	public int checkNumber(Map<String, Object> map) {
		
		return sqlSession.selectOne("memberMapper.checkNumber", map);
	}
	
	
//	@Autowired
//	private Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	

}
