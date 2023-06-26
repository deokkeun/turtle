package com.turtle.www.payment.model.dao;

import java.util.List;
import java.util.Map;

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

	/** 결제 정보(전체) 불러오기(결제 타입)
	 * @param projectNo
	 * @return
	 */
	public Pay paymentType(int projectNo) {
		return sqlSession.selectOne("payMapper.paymentType", projectNo);
	}

	/** 결제 정보 저장
	 * @param pay
	 * @return
	 */
	public int insertPay(Pay pay) {
		return sqlSession.insert("payMapper.insertPay", pay);
	}

	/** 결제 내역 (마이페이지)
	 * @param projectNo
	 * @return
	 */
	public List<Pay> payList(Map<String, Object> map) {
		return sqlSession.selectList("payMapper.payList", map);
	}
	
	
}
