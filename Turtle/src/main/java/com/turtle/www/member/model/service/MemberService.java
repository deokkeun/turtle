package com.turtle.www.member.model.service;

import java.util.Map;

import com.turtle.www.member.model.vo.Member;

public interface MemberService {

	
	/** 로그인(회원정보 가져오기) 서비스
	 * @param inputMember
	 * @return
	 */
	Member login(Member inputMember);

	/** [비밀번호]이메일 인증(회원인지 확인)
	 * @return
	 */
	String memberConfirmation(String inputEmail);
	
	/** [비밀번호]인증 이메일 조회
	 * @param sendEmail
	 * @return
	 */
	int passwordSelectCertification(String sendEmail);
	
	/** [비밀번호]인증번호 수정(인증 받은적 있는경우)
	 * @param sendEmail
	 * @param mode 
	 * @return
	 */
	int passwordUpdateCertification(String sendEmail) throws Exception;
	
	/** [비밀번호]인증번호 추가(인증 없는경우)
	 * @param toEmail
	 * @return 
	 * @throws Exception 
	 */
	int passwordInsertCertification(String sendEmail) throws Exception;

	/** [비밀번호]인증번호 확인
	 * @param certificationNumber
	 * @return
	 */
	int certificationNumber(String certificationNumber);

	/** 이메일 중복 검사 서비스
	 * @param memberEmail
	 * @return
	 */
	int emailDupCheck(String memberEmail);
 
	/** 회원가입 서비스
	 * @param inputMember
	 * @return
	 */
	int signUp(Member inputMember);

	/** 이메일 인증 번호 전송 서비스
	 * @param map
	 * @return
	 */
	int insertCertification(Map<String, Object> map);

	/** 이메일 인증번호 일치 확인 서비스
	 * @param map
	 * @return
	 */
	int checkNumber(Map<String, Object> map);

	/** 결제 기간(한달) 초과 시 Basic(기본제공)으로 변경
	 * @param memberNo
	 * @return
	 */
	int paymentDateCheck(int memberNo);



}
