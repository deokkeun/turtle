package com.turtle.www.member.model.service;

import com.turtle.www.member.model.vo.Member;

public interface MemberService {

	/** 로그인(회원정보 가져오기)
	 * @param inputMember
	 * @return
	 */
	Member login(Member inputMember);

}
