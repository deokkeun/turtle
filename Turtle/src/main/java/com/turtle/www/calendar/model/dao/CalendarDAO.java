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
		return sqlSession.update("calendarMapper.calendarUpdateEvent", calendar);
	}
	
	
	
	
	
	
	
}
