package com.turtle.www.payment.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;

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

	
	/** 결제 정보(전체) 불러오기(결제 타입)
	 * @param projectNo
	 * @return
	 */
	Pay paymentType(int projectNo);

	
	/** iamport 토큰값 가져오기
	 * @return
	 */
	String getToken() throws Exception;

	/** 결제 정보 저장 (토큰값 이용)
	 * @param pay
	 * @return
	 */
	int insertPay(Pay pay);

	/** 결제 정보 불러오기
	 * @param impUid
	 * @param token
	 * @return
	 */
	String paymentInfo(String impUid, String token) throws IOException, ParseException;

	/** 결제 취소 (토큰값 이용)
	 * @param token
	 * @param impUid
	 * @param amount
	 * @param string
	 */
	void paymentCancle(String token, String impUid, String amount, String string) throws IOException, ParseException;

	/** 결제 내역 (마이페이지)
	 * @param map
	 * @return
	 */
	List<Pay> payList(Map<String, Object> map);

	/** 결제타입 초기화(Basic)
	 * 
	 */
//	void changePaymentType();

}
