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
	private String payNo;
	private int projectNo;
	private String payType;
	private Date payRegDate;
	private String payName;
}
