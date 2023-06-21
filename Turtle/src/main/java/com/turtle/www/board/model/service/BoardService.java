package com.turtle.www.board.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.board.model.vo.Board;

public interface BoardService {

	/** 게시글 목록 조회 서비스
	 * @param map
	 * @return boardList
	 */
	List<Board> selectBoardList(Map<String, Object> map);

	/** 게시글 제목 수정 서비스
	 * @param board
	 * @return result
	 */
	int updateBoardTitle(Board board);

	

}
