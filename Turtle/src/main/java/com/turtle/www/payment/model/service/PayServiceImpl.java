package com.turtle.www.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.payment.model.dao.PayDAO;
import com.turtle.www.payment.model.vo.Pay;

@Service
public class PayServiceImpl implements PayService{

	@Autowired
	private PayDAO dao;

	/** 워크스페이스 개수 조회
	 *
	 */
	@Override
	public int workspaceCount(int projectNo) {
		return dao.workspaceCount(projectNo);
	}

	/** 프로젝트 참여자 수 조회 
	 *
	 */
	@Override
	public int projectMemberCount(int projectNo) {
		return dao.projectMemberCount(projectNo);
	}

	/** 결제 유형 상태 확인
	 *
	 */
	@Override
	public Pay paymentType(int projectNo) {
		return dao.paymentType(projectNo);
	}
	
	
	
	
}
