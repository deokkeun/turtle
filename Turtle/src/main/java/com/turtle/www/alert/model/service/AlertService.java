package com.turtle.www.alert.model.service;

import com.turtle.www.alert.model.vo.Alert;

public interface AlertService {

	/** 알림 삽입 서비스
	 * @param alert
	 * @return result
	 */
	int insertAlert(Alert alert);

}
