package com.turtle.www.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {
	private int memberNo; // 회원번호
	private String memberEmail; // 회원 이메일
	private String memberPw; // 회원 비밀번호 
	private String memberName; // 회원 이름
	private String memberGit; // 깃 레파지토리 주소
	private String profileImage; // 프로필 사진
	private String enrollDate; // 가입일
	private String memberDeleteFG; // 탈퇴여부
	
	private String socialId; // 소셜 아이디


}
