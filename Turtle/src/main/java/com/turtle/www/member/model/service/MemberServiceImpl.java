package com.turtle.www.member.model.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.turtle.www.member.model.dao.MemberDAO;
import com.turtle.www.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	
	/** 로그인 서비스 구현(회원정보 가져오기)
	 *
	 */
	@Override
	public Member login(Member inputMember) {
		
		Member loginMember = dao.login(inputMember);
		
		// ** Bcrypt 암호화를 사용하기 위해 이를 지원하는 Spring-security 모듈 추가 **
		// loginMember == null : 일치하는 이메일 없다
		if(loginMember != null) { // 일치하는 이메일을 가진 회원 정보가 있을 경우
//							입력된 비밀번호(평문), 조회된 비밀번호(암호화) 비교 -> 같으면 true
			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) { // 비밀번호가 일치할 경우
				loginMember.setMemberPw(null); // 비교 끝났으면 비밀번호 지우기
			} else { // 비밀번호가 일치하지 않을 경우
				loginMember = null;	
			}
		}
		return loginMember;
		// Connection을 얻어오거나/반환하거나
		// 트랜잭션 처리를 하는 구문을 작성하지 않아도
		// Spring에서 제어를 하기 때문에 Service구문이 간단해진다.
	}

	
	
	
	
	
	
	

}
