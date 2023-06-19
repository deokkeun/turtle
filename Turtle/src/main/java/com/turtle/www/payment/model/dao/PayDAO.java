package com.turtle.www.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
