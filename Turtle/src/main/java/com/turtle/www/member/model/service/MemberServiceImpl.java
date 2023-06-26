package com.turtle.www.member.model.service;

import java.util.Map;

import javax.mail.Multipart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.turtle.www.member.model.dao.MemberDAO;
import com.turtle.www.member.model.vo.Certification;
import com.turtle.www.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	private Object session;
	
	
	
	/** 로그인 서비스 구현(회원정보 가져오기)
	 *
	 */
	@Override
	public Member login(Member inputMember) {
		
		Member loginMember = dao.login(inputMember);
		
		// ** Bcrypt 암호화를 사용하기 위해 이를 지원하는 Spring-security 모듈 추가 **
		logger.debug(inputMember.getMemberPw() + " / " + bcrypt.encode(inputMember.getMemberPw()));
		
		// ** Bcrypt 암호화를 사용하기 위해 이를 지원하는 Spring-security 모듈 추가 **
		// loginMember == null : 일치하는 이메일 없다
		if(loginMember != null) { // 일치하는 이메일을 가진 회원 정보가 있을 경우
//							입력된 비밀번호(평문), 조회된 비밀번호(암호화) 비교 -> 같으면 true
			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) { // 비밀번호가 일치할 경우
				loginMember.setMemberPw(null); // 비교 끝났으면 비밀번호 지우기
			} else { // 비밀번호가 일치하지 않을 경우
				loginMember = null;	
			}
		}
		return loginMember;
		// Connection을 얻어오거나/반환하거나
		// 트랜잭션 처리를 하는 구문을 작성하지 않아도
		// Spring에서 제어를 하기 때문에 Service구문이 간단해진다.
	}

  
  
  //   -------------------------------------------------------------------------------------
  
	// [비밀번호]이메일 인증(회원인지 확인)
	@Override
	public String memberConfirmation(String inputEmail) {
		return dao.memberConfirmation(inputEmail);
	}

	// [비밀번호]인증 이메일 조회
	@Override
	public int passwordSelectCertification(String sendEmail) {
		return dao.passwordSelectCertification(sendEmail);
	}

	// [비밀번호]인증번호 추가(인증 없는경우)
	@Override
	public int passwordInsertCertification(String sendEmail) throws Exception{
		
		Certification certification = new Certification();
		int result = 0;

			// 메일 송/수신 옵션 설정(1명 보내기)
			MimeMessage message = mailSender.createMimeMessage();
			message.setFrom(new InternetAddress("deokk91@gmail.com", "TURTLE")); 	// 송신자(보내는 사람) 지정
			message.addRecipient(RecipientType.TO, new InternetAddress(sendEmail)); // 수신자(받는사람) 지정
			message.setSubject("TURTLE 비밀번호를 찾기위한 인증번호 입니다."); // 이메일 제목 지정
			
			// 메일 콘텐츠 설정
			Multipart mParts = new MimeMultipart();
			MimeBodyPart mTextPart = new MimeBodyPart();

			// 인증번호 생성
			String cNumber = authenticationNumber();
			
			// 메일에 출력할 텍스트
			StringBuffer sb = new StringBuffer(); // 가변성 문자열 저장 객체
			sb.append("<h3>TURTLE 비밀번호를 찾기위한 인증번호 입니다.</h3>\n");
			sb.append("<h3>인증 번호 : <span style='color:#2678f3'>"+ cNumber +"</span></h3>\n");
			
			String mailContent = sb.toString(); // 문자열로 반환
			
			// 메일 콘텐츠 - 내용 , 메일인코딩, "html" 추가 시 HTML 태그가 해석됨
			mTextPart.setText(mailContent, "UTF-8", "html");
			mParts.addBodyPart(mTextPart);
			
			// 메일 콘텐츠 지정
			message.setContent(mParts);

			certification.setEmail(sendEmail);
			certification.setCodeNumber(cNumber);
			
			// 인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간  -> DB 삽입
			result = dao.passwordInsertCertification(certification);
			
			if(result > 0) {
//				메일 전송
				mailSender.send(message);				
			} else {
				logger.debug("memberServiceImpl - 이메일 인증 DB 추가 실패");
			}
			
		return result;
	}


	// [비밀번호]인증번호 수정(인증 받은적 있는경우)
	@Override
	public int passwordUpdateCertification(String sendEmail) throws Exception {

		Certification certification = new Certification();
		
		int result = 0;

			// 메일 송/수신 옵션 설정(1명 보내기)
			MimeMessage message = mailSender.createMimeMessage();
			message.setFrom(new InternetAddress("deokk91@gmail.com", "TURTLE")); 	// 송신자(보내는 사람) 지정
			message.addRecipient(RecipientType.TO, new InternetAddress(sendEmail)); // 수신자(받는사람) 지정
			message.setSubject("TURTLE 비밀번호를 찾기위한 인증번호 입니다."); // 이메일 제목 지정
			
			// 메일 콘텐츠 설정
			Multipart mParts = new MimeMultipart();
			MimeBodyPart mTextPart = new MimeBodyPart();

			// 인증번호 생성
			String cNumber = authenticationNumber();
			
			// 메일에 출력할 텍스트
			StringBuffer sb = new StringBuffer(); // 가변성 문자열 저장 객체
			sb.append("<h3>TURTLE 비밀번호를 찾기위한 인증번호 입니다.</h3>\n");
			sb.append("<h3>인증 번호 : <span style='color:#2678f3'>"+ cNumber +"</span></h3>\n");
			
			String mailContent = sb.toString(); // 문자열로 반환
			
			// 메일 콘텐츠 - 내용 , 메일인코딩, "html" 추가 시 HTML 태그가 해석됨
			mTextPart.setText(mailContent, "UTF-8", "html");
			mParts.addBodyPart(mTextPart);
			
			// 메일 콘텐츠 지정
			message.setContent(mParts);

			certification.setEmail(sendEmail);
			certification.setCodeNumber(cNumber);
			
			// 인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간  -> DB 삽입
			result = dao.passwordUpdateCertification(certification);
			
			if(result > 0) {
//				메일 전송
				mailSender.send(message);				
			} else {
				logger.debug("memberServiceImpl - 이메일 인증 DB 추가 실패");
			}
				
		return result;
	}

	// [비밀번호]인증번호 생성
	public String authenticationNumber() {
		// 인증번호 6자리 생성코드(영어 대/소문 + 숫자)
		String cNumber = "";
		for(int i = 0; i < 6; i++) {
			int sel1 = (int)(Math.random() * 3);
			
				if(sel1 == 0) {
					int num = (int)(Math.random() * 10);
					cNumber += num;
					
				} else {
					char ch = (char)(Math.random() * 26 + 65);
					int sel2 = (int)(Math.random() * 2);
					if(sel2 == 0) {
						ch = (char)(ch + ('a' - 'A'));
					}
					cNumber += ch;
				}
		}
		return cNumber;
	}

	/** [비밀번호]인증번호 확인
	 * @author deokkeun
	 */
	@Override
	public int certificationNumber(String certificationNumber) {
		return dao.certificationNumber(certificationNumber);
	}

	
	
	/** 결제 기간(한달) 초과 시 Basic(기본제공)으로 변경
	 *
	 */
	@Override
	public int paymentDateCheck(int memberNo) {
		return dao.paymentDateCheck(memberNo);
	}
	
  
  //  -------------------------------------------------------------------------------------




	/** 이메일 중복 검사 서비스 구현
	 *
	 */
	@Override
	public int emailDupCheck(String memberEmail) {
		
		return dao.emailDupCheck(memberEmail);
	}



	/** 회원가입 서비스 구현
	 *
	 */
	@Override
	public int signUp(Member inputMember) {
		logger.debug("암호화 전 : " + inputMember.getMemberPw() + " / 암호화 후 : " + bcrypt.encode(inputMember.getMemberPw()));
		
		inputMember.setMemberPw(bcrypt.encode(inputMember.getMemberPw())); 
		
		int result = dao.signUp(inputMember);
		
		return result;
	}




	// 이메일 인증번호 전송 서비스 구현
	@Override
	public int insertCertification(Map<String, Object> map) {
		
		  // 1) 입력한 이메일과 일치하는 값이 있으면 수정(UPDATE)
	     int result = dao.updateCertification(map);
	     
	     // 2) 일치하는 이메일이 없는경우 -> 처음으로 인증번호를 발급 받음 -> 삽입(INSERT)
	     if( result == 0 ) {
	        result = dao.insertCertification(map);
	     }
		
		
		return result;
	}
	
	
	// 이메일 인증번호 일치 확인 서비스 구현
	@Override
	public int checkNumber(Map<String, Object> map) {
		return dao.checkNumber(map);
	}

	

}
