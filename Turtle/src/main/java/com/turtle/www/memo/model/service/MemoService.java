package com.turtle.www.memo.model.service;

import java.util.List;

import com.turtle.www.memo.model.vo.Memo;

public interface MemoService {

	
	/** 메모장 리스트 조회 서비스
	 * @param workspaceNo
	 * @return memoList
	 */
	List<Memo> selectMemoList(int workspaceNo);
	

}
