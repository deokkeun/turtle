package com.turtle.www.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.board.model.vo.Board;

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

}
