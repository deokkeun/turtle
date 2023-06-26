package com.turtle.www.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.member.model.vo.Certification;
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
  

	/** [비밀번호]이메일 인증(회원인지 확인)
	 * @param inputEmail
	 * @return
	 */
	public String memberConfirmation(String inputEmail) {
		return sqlSession.selectOne("memberMapper.memberConfirmation", inputEmail);
	}

	/** [비밀번호]인증 이메일 조회
	 * @param sendEmail
	 * @return
	 */
	public int passwordSelectCertification(String sendEmail) {
		return sqlSession.selectOne("memberMapper.passwordSelectCertification", sendEmail);
	}

	/** [비밀번호]인증번호 수정(인증 받은적 있는경우)
	 * @param certification
	 * @return
	 */
	public int passwordUpdateCertification(Certification certification) {
		return sqlSession.update("memberMapper.passwordUpdateCertification", certification);
	}
  
  /** [비밀번호]인증번호 추가(인증 받은적 없는 경우)
	 * @param certification
	 * @return
	 */
	public int passwordInsertCertification(Certification certification) {
		return sqlSession.insert("memberMapper.insertCertification", certification);
	}

	/** [비밀번호]인증번호 확인
	 * @param certificationNumber
	 * @return
	 */
	public int certificationNumber(String certificationNumber) {
		return sqlSession.selectOne("memberMapper.certificationNumber", certificationNumber);
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


	/** 결제 기간(한달) 초과 시 Basic(기본제공)으로 변경
	 * @param memberNo
	 * @return
	 */
	public int paymentDateCheck(int memberNo) {
		return sqlSession.update("memberMapper.paymentDateCheck", memberNo);
	}
	


	

	

}
