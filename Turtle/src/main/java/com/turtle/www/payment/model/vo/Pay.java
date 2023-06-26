package com.turtle.www.payment.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Pay {
	private String payNo; // 주문번호
	private int projectNo; // 프로젝트 번호
	private String payType; // 결제 타입
	private Date payRegDate; // 결제일
	private String payName; // 결제자
	private int memberNo; // 회원번호
	private int price; // 가격
	private String impUid; // 거래 고유번호(취소, 환불)
	private Date expireDate; // 결제만료일
	private String expireType; // 결제만료 타입
}
