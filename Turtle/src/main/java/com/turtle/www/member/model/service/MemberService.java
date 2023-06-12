package com.turtle.www.member.model.service;

import com.turtle.www.member.model.vo.Member;

public interface MemberService {

	/** 로그인(회원정보 가져오기)
	 * @param inputMember
	 * @return
	 */
	Member login(Member inputMember);

	/** 이메일 인증(회원인지 확인)
	 * @return
	 */
	String emailDupCheck(String inputEmail);

	
	/** 인증 이메일 조회
	 * @param sendEmail
	 * @return
	 */
	int selectCertification(String sendEmail);
	
	/** 인증번호 추가(인증 없는경우)
	 * @param toEmail
	 * @return 
	 * @throws Exception 
	 */
	int insertCertification(String sendEmail) throws Exception;

	/** 인증번호 수정(인증 받은적 있는경우)
	 * @param sendEmail
	 * @param mode 
	 * @return
	 */
	int updateCertification(String sendEmail) throws Exception;
	
	/** 인증번호 확인
	 * @param certificationNumber
	 * @return
	 */
	int certificationNumber(String certificationNumber);


}
