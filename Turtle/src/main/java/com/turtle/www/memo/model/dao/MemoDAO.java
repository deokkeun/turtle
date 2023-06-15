package com.turtle.www.memo.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.memo.model.vo.Memo;

@Repository
public class MemoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 메모장 리스트 조회 dao
	 * @param map
	 * @return memoList
	 */
	public List<Memo> selectMemoList(Map<String, Object> map) {
		
		return sqlSession.selectList("memoMapper.selectMemoList", map);
	}

	/** 메모장 수정 dao
	 * @param memo
	 * @return result
	 */
	public int updateMemo(Memo memo) {

		return sqlSession.update("memoMapper.updateMemo", memo);
	}

}
