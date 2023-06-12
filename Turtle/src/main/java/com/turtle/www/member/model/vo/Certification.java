package com.turtle.www.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Certification {
	private String email; // 이메일
	private String codeNumber; // 인증번호
	private Date issueDate; // 인증 발생일
}
