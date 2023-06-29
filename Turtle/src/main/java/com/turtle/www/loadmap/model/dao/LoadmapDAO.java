package com.turtle.www.loadmap.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.loadmap.model.vo.Loadmap;

@Repository
public class LoadmapDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Loadmap selectLoadmapByworkspaceNo(int workspaceNo) {
		return sqlSession.selectOne("loadmapMapper.selectLoadmapByworkspaceNo", workspaceNo);
	}
	
	
	
	
	
	
	
}
