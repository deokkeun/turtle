package com.turtle.www.member.model.service;

import java.io.IOException;
import java.util.Map;

import com.turtle.www.member.model.vo.Member;

public interface MyPageService {
	
	// 회원탈퇴
	int deleteAccount(Member loginMember);

	// 프로필 이미지 수정
	int updateProfile(Map<String, Object> map) throws IOException;

	// 현재 비밀번호 일치여부 확인
	int currentPwCheck(int memberNo, String currentPw);

	// 비밀번호 변경
	int newChangePw(Map<String, Object> paramMap);

}
