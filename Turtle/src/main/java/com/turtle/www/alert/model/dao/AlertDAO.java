package com.turtle.www.alert.model.dao;

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

		return sqlSession.insert("alertMapper.insertAlert", alert);
	}

}
