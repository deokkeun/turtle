package com.turtle.www.board.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.board.model.vo.Board;

public interface BoardService {

	/** 게시글 목록 조회
	 * @param map
	 * @return boardList
	 */
	List<Board> selectBoardList(Map<String, Object> map);

	

}
