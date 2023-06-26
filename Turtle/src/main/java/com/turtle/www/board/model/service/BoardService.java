package com.turtle.www.board.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.board.model.vo.Board;
import com.turtle.www.board.model.vo.BoardDetail;

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

	/** 게시글 추가 서비스
	 * @param board
	 * @return result
	 */
	int insertBoard(Board board);

	/** 게시글 삭제 서비스
	 * @param board
	 * @return result
	 */
	int deleteBoard(Board board);

	
	/** 게시글 조회 서비스
	 * @param boardNo
	 * @return board
	 */
	Board selectBoard(int boardNo);

	/** 게시글 상세조회 서비스
	 * @param boardNo
	 * @return boardDetailList
	 */
	List<BoardDetail> selectBoardDetail(int boardNo);

	

}
