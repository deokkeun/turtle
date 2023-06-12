package com.turtle.www.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.member.model.vo.Certification;
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


	

	

}
