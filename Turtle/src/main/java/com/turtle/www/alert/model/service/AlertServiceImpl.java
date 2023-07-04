package com.turtle.www.alert.model.service;

import java.util.List;

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

	// 알림 리스트 조회 서비스 구현
	@Override
	public List<Alert> selectAlertList(Alert alert) {

		return dao.selectAlertList(alert);
	}

	// 알림 확인 업데이트 서비스 구현
	@Override
	public int updateAlertCheckFg(Alert alert) {

		return dao.updateAlertCheckFg(alert);
	}
	
	

}
