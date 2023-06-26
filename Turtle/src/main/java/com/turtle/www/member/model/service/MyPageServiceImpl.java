package com.turtle.www.member.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.turtle.www.common.Util;
import com.turtle.www.member.model.dao.MyPageDAO;
import com.turtle.www.member.model.vo.Member;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	private Logger logger = LoggerFactory.getLogger(MyPageServiceImpl.class);


	
	/** 회원탈퇴 서비스 구현
	 *
	 */
	@Override
	public int deleteAccount(Member loginMember) {

		// 1) DB에서 암호화된 비밀번호를 조회하여 입력받은 비밀번호와 비교
		String encPw = dao.selectEncPw(loginMember.getMemberNo());
		
		if(bcrypt.matches(loginMember.getMemberPw(), encPw)) {
			// 2) 비밀번호가 일치하면 회원 번호를 이용해서 탈퇴 진행
			return dao.deleteAccount(loginMember.getMemberNo());
		}
		
		// 3) 비밀번호가 일치하지 않으면 0 리턴
		return 0;
	}



	/** 프로필 이미지 수정 서비스 구현
	 *
	 */
	@Override
	public int updateProfile(Map<String, Object> map) throws IOException {

		MultipartFile uploadImage = (MultipartFile)map.get("uploadImage");
		String delete = (String) map.get("delete"); // 0 (변경, 삭제버튼 안눌러짐) / 1 (삭제, 삭제버튼 눌러짐)
		
		String renameImage = null; // 변경된 파일명 저장
		
		if(delete.equals("0")) {
			
			// 파일명 변경
			renameImage = Util.fileRename(uploadImage.getOriginalFilename());
			
			map.put("profileImage", map.get("webPath") + renameImage);
			
		} else {
			map.put("profileImage", "/resources/images/memberProfile/member.png");
			
		}
		// DAO를 호출해서 프로필 이미지 수정
		int result = dao.updateProfile(map);
		
		logger.debug("DAO 반환 성공");
		// DB 수정 성공 시 메모리에 임시 저장되어있는 파일을 서버에 저장
		if(result > 0 && map.get("profileImage") != null) {
			logger.debug(result + "수정 성공");
			uploadImage.transferTo(new File(map.get("folderPath") + renameImage));
		}
		
		return result;
	}



	/** 현재 비밀번호 일치 여부 확인
	 *
	 */
	@Override
	public int currentPwCheck(int memberNo, String currentPw) {
		
		// 1) DB에서 암호화된 비밀번호를 조회하여 입력받은 비밀번호와 비교
		String encPw = dao.selectEncPw(memberNo);
		
		if(bcrypt.matches(currentPw, encPw)) {
			// 2) 비밀번호가 일치하면 1 리턴
			return 1;
		}
		
		// 3) 비밀번호가 일치하지 않으면 0 리턴
		return 0;
	}



	/** 비밀번호 변경
	 *
	 */
	@Override
	public int newChangePw(Map<String, Object> paramMap) {
		paramMap.put("memberPw", bcrypt.encode((String)paramMap.get("newPw")));
		// 로그인 경우, 비 로그인 경우
		return dao.newChangePw(paramMap);
	}
	

	
	
	
}
