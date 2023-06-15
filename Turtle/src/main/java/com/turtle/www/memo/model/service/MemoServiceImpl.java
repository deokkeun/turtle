package com.turtle.www.memo.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.memo.model.dao.MemoDAO;
import com.turtle.www.memo.model.vo.Memo;

@Service
public class MemoServiceImpl implements MemoService {
	
	@Autowired
	private MemoDAO dao;
	
	// 메모장 리스트 조회 서비스 구현
	@Override
	public List<Memo> selectMemoList(Map<String, Object> map) {
		
		return dao.selectMemoList(map);
	}

	// 메모장 수정 서비스 구현
	@Override
	public int updateMemo(Memo memo) {

		return dao.updateMemo(memo);
	}

	
}
