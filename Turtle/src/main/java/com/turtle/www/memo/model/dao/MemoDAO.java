package com.turtle.www.memo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.memo.model.vo.Memo;

@Repository
public class MemoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 메모장 리스트 조회 dao
	 * @param workspaceNo
	 * @return memoList
	 */
	public List<Memo> selectMemoList(int workspaceNo) {
		
		return sqlSession.selectList("memoMapper.selectMemoList", workspaceNo);
	}

}
