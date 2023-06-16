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
	
	
	
	
	
	
	
}
