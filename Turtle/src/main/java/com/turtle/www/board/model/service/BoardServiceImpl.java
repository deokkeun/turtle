package com.turtle.www.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.board.model.dao.BoardDAO;
import com.turtle.www.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	// 게시글 목록 조회 서비스 구현
	@Override
	public List<Board> selectBoardList(Map<String, Object> map) {
		
		return dao.selectBoardList(map);
	}

	// 게시글 제목 수정 서비스 구현
	@Override
	public int updateBoardTitle(Board board) {

		return dao.updateBoardTitle(board);
	}
	
	

}
