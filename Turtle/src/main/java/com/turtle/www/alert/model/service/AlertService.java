package com.turtle.www.alert.model.service;

import java.util.List;

import com.turtle.www.alert.model.vo.Alert;

public interface AlertService {

	/** 알림 삽입 서비스
	 * @param alert
	 * @return result
	 */
	int insertAlert(Alert alert);

	/** 알림 리스트 조회 서비스
	 * @param alert
	 * @return alertList
	 */
	List<Alert> selectAlertList(Alert alert);

	/** 알림 확인 업데이트 서비스
	 * @param alert
	 * @return result
	 */
	int updateAlertCheckFg(Alert alert);

}
