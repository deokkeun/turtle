package com.turtle.www.member.model.service;

import com.turtle.www.member.model.vo.Member;

public interface MemberService {

	/** 로그인(회원정보 가져오기)
	 * @param inputMember
	 * @return
	 */
	Member login(Member inputMember);

	/** 이메일 중복 검사
	 * @param memberEmail
	 * @return
	 */
	int emailDupCheck(String memberEmail);

	/** 회원가입
	 * @param inputMember
	 * @return
	 */
	int signUp(Member inputMember);


}
