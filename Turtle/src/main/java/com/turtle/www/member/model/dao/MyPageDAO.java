package com.turtle.www.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 현재 로그인한 회원의 암호화된 비밀번호 조회 DAO
	 * @param memberNo
	 * @return
	 */
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", memberNo);
	}
	
	/** 현재 비밀번호 일치 여부 확인
	 * @param currentPw
	 * @return
	 */
	public String currentPwCheck(String currentPw) {
		return sqlSession.selectOne("myPageMapper.currentPwCheck", currentPw);
	}


	/** 회원 탈퇴 DAO
	 * @param memberNo
	 * @return
	 */
	public int deleteAccount(int memberNo) {
		return sqlSession.update("myPageMapper.deleteAccount", memberNo);
	}

	
	/** 프로필 이미지 수정
	 * @param map
	 * @return result
	 */
	public int updateProfile(Map<String, Object> map) {
		return sqlSession.update("myPageMapper.updateProfile", map);
	}

	/** 비밀번호 변경(로그인, 비로그인)
	 * @param paramMap
	 * @return
	 */
	public int newChangePw(Map<String, Object> paramMap) {
		return sqlSession.update("myPageMapper.newChangePw", paramMap);
	}



}
