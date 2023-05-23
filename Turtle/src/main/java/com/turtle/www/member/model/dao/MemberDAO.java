package com.turtle.www.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	@Autowired
//	private Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	

}
