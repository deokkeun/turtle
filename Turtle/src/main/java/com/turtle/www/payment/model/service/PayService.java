package com.turtle.www.payment.model.service;

import com.turtle.www.payment.model.vo.Pay;

public interface PayService {

	/** 워크스페이스 개수 조회
	 * @param projectNo
	 * @return
	 */
	int workspaceCount(int projectNo);

	/** 프로젝트 참여자 수 조회 
	 * @param projectNo
	 * @return
	 */
	int projectMemberCount(int projectNo);

	
	/** 결제 유형 상태 확인
	 * @param projectNo
	 * @return
	 */
	Pay paymentType(int projectNo);

}
