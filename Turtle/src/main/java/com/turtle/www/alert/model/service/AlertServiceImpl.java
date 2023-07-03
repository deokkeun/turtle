package com.turtle.www.alert.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.alert.model.dao.AlertDAO;
import com.turtle.www.alert.model.vo.Alert;

@Service
public class AlertServiceImpl implements AlertService  {
	
	@Autowired
	private AlertDAO dao;

	// 알림 삽입 서비스 구현
	@Override
	public int insertAlert(Alert alert) {

		return dao.insertAlert(alert);
	}
	
	

}
