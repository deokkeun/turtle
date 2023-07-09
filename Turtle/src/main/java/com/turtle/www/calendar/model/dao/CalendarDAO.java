package com.turtle.www.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.calendar.model.vo.Calendar;

@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/** 메인 페이지 캘린더 남은 일정
	 * @param projectNo
	 * @return
	 */
	public List<Calendar> schedule(int projectNo) {
		return sqlSession.selectList("calendarMapper.schedule", projectNo);
	}
	
	/** 캘린더 조회 리스트 dao
	 * @param map
	 * @return
	 */
	public List<Calendar> selectCalendarList(Map<String, Object> map) {
		return sqlSession.selectList("calendarMapper.selectCalendarList", map);
	}


	/** 캘린더 일정 추가 dao
	 * @param calendar
	 * @return
	 */
	public int calendarAddEvent(Calendar calendar) {
		
		if(calendar.getBoardNo() != 0) {
			int workspaceNo = sqlSession.selectOne("calendarMapper.selectWorkspaceNo", calendar);
			calendar.setWorkspaceNo(workspaceNo);
		}
		
		
		return sqlSession.insert("calendarMapper.calendarAddEvent", calendar);
	}


	/** 캘린더 일정 삭제 dao
	 * @param calendar
	 * @return
	 */
	public int calendarDeleteEvent(Calendar calendar) {
		return sqlSession.update("calendarMapper.calendarDeleteEvent", calendar);
	}


	/** 캘린더 일정 수정 dao
	 * @param calendar
	 * @return
	 */
	public int calendarUpdateEvent(Calendar calendar) {
		
		if(calendar.getBoardNo() != 0) {
			int workspaceNo = sqlSession.selectOne("calendarMapper.selectWorkspaceNo", calendar);
			calendar.setWorkspaceNo(workspaceNo);
		}
		
		return sqlSession.update("calendarMapper.calendarUpdateEvent", calendar);
	}


	/** 게시판 일정 추가/수정 전 조회
	 * @param calendar
	 * @return
	 */
	public int selectBoardCalendar(Calendar calendar) {
		return sqlSession.selectOne("calendarMapper.selectBoardCalendar", calendar);
	}


	
	
	
}
