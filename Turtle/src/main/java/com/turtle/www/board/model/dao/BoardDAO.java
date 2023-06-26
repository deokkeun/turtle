package com.turtle.www.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.board.model.vo.Board;
import com.turtle.www.board.model.vo.BoardDetail;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 게시글 목록 조회 dao
	 * @param map
	 * @return boardList
	 */
	public List<Board> selectBoardList(Map<String, Object> map) {

		return sqlSession.selectList("boardMapper.selectBoardList", map);
	}

	/** 게시글 제목 수정 dao
	 * @param board
	 * @return result
	 */
	public int updateBoardTitle(Board board) {

		return sqlSession.update("boardMapper.updateBoardTitle", board);
	}

	/** 게시글 추가 DAO
	 * @param board
	 * @return result
	 */
	public int insertBoard(Board board) {
		
		int result = 0;
		
		// boardSort로 기존 boardSort들 하나씩 밀어주기
		result = sqlSession.update("boardMapper.addBoardSort", board);
		
		if(result > 0) {
			// 밀어준 후 게시글 추가
			result = sqlSession.insert("boardMapper.insertBoard", board);
			
			if (result > 0) result = board.getBoardNo();
			
		}

		return result;
	}

	/** 게시글 삭제 DAO
	 * @param board
	 * @return result
	 */
	public int deleteBoard(Board board) {
		
		return sqlSession.update("boardMapper.deleteBoard", board);
	}

	/** 게시글 조회 DAO
	 * @param boardNo
	 * @return board
	 */
	public Board selectBoard(int boardNo) {

		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	/** 게시글 상세조회 DAO
	 * @param boardNo
	 * @return boardDetailList
	 */
	public List<BoardDetail> selectBoardDetail(int boardNo) {

		return sqlSession.selectList("boardMapper.selectBoardDetail", boardNo);
	}

}
