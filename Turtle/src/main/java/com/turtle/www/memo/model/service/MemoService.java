package com.turtle.www.memo.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.memo.model.vo.Memo;

public interface MemoService {

	
	/** 메모장 리스트 조회 서비스
	 * @param map
	 * @return memoList
	 */
	List<Memo> selectMemoList(Map<String, Object> map);

	/** 메모장 수정 서비스
	 * @param memo
	 * @return result
	 */
	int updateMemo(Memo memo);
	

}
