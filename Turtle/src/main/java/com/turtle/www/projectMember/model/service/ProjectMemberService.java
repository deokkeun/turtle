package com.turtle.www.projectMember.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.member.model.vo.Member;
import com.turtle.www.projectMember.model.vo.ProjectMember;

public interface ProjectMemberService {

	
	/** pmNo 조회 서비스
	 * @param map
	 * @return pmNo
	 */
	int selectPmNo(Map<String, Object> map);

	List<Member> searchmember(String input);

}
