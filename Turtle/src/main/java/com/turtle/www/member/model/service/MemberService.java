package com.turtle.www.member.model.service;

import java.util.Map;

import com.turtle.www.member.model.vo.Member;

public interface MemberService {

	/** 로그인(회원정보 가져오기) 서비스
	 * @param inputMember
	 * @return
	 */
	Member login(Member inputMember);

	/** 이메일 중복 검사 서비스
	 * @param memberEmail
	 * @return
	 */
	int emailDupCheck(String memberEmail);
 
	/** 회원가입 서비스
	 * @param inputMember
	 * @return
	 */
	int signUp(Member inputMember);

	
	/** 이메일 인증 번호 전송 서비스
	 * @param map
	 * @return
	 */
	int insertCertification(Map<String, Object> map);

	/** 이메일 인증번호 일치 확인 서비스
	 * @param map
	 * @return
	 */
	int checkNumber(Map<String, Object> map);


}
