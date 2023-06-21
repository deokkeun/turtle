package com.turtle.www.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.payment.model.vo.Pay;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 워크스페이스 개수 조회
	 * @param projectNo
	 * @return
	 */
	public int workspaceCount(int projectNo) {
		return sqlSession.selectOne("payMapper.workspaceCount", projectNo);
	}

	/** 프로젝트 참여자 수 조회 
	 * @param projectNo
	 * @return
	 */
	public int projectMemberCount(int projectNo) {
		return sqlSession.selectOne("payMapper.projectMemberCount", projectNo);
	}

	/** 결제 유형 상태 확인
	 * @param projectNo
	 * @return
	 */
	public Pay paymentType(int projectNo) {
		return sqlSession.selectOne("payMapper.paymentType", projectNo);
	}
	
	
}
