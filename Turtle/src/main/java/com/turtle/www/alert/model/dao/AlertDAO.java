package com.turtle.www.alert.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.alert.model.vo.Alert;

@Repository
public class AlertDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 알림 삽입 dao
	 * @param alert
	 * @return result
	 */
	public int insertAlert(Alert alert) {
		
		int result = 0;
		// 알림을 보낼 프로젝트 멤버들 조회
		List<Integer> pmNoList = sqlSession.selectList("alertMapper.selectPmNoList", alert.getProjectNo());
		// 내 pmNo 조회
		int myPmNo = sqlSession.selectOne("alertMapper.selectMyPmNo", alert);
		
		
		for(int pmNo : pmNoList) {
			if(pmNo != myPmNo) {
				alert.setPmNo(pmNo);
				result = sqlSession.insert("alertMapper.insertAlert", alert);
				if(result > 0) {
					result = 0;
				}			
			}
		}
		if(result == 0) {
			result = 1;
		}
		
		return result;
	}

	/** 알림 리스트 조회 dao
	 * @param alert
	 * @return alertList
	 */
	public List<Alert> selectAlertList(Alert alert) {

		return sqlSession.selectList("alertMapper.selectAlertList", alert);
	}

	/** 알림 확인 업데이트 dao
	 * @param alert
	 * @return result
	 */
	public int updateAlertCheckFg(Alert alert) {

		return sqlSession.update("alertMapper.updateAlertCheckFg", alert);
	}

}
