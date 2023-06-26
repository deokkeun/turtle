package com.turtle.www.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.board.model.dao.BoardDAO;
import com.turtle.www.board.model.vo.Board;
import com.turtle.www.board.model.vo.BoardDetail;

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

	// 게시글 추가 서비스 구현
	@Override
	public int insertBoard(Board board) {

		return dao.insertBoard(board);
	}

	// 게시글 삭제 서비스 구현
	@Override
	public int deleteBoard(Board board) {

		return dao.deleteBoard(board);
	}

	// 게시글 조회 서비스 구현
	@Override
	public Board selectBoard(int boardNo) {

		return dao.selectBoard(boardNo);
	}

	// 게시글 상세조회 서비스 구현
	@Override
	public List<BoardDetail> selectBoardDetail(int boardNo) {

		return dao.selectBoardDetail(boardNo);
	}
	
	
	
}
