package com.turtle.www.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.calendar.model.dao.CalendarDAO;
import com.turtle.www.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAO dao;

	/** 캘린더 리스트 조회
	 *
	 */
	@Override
	public List<Calendar> selectCalendarList(Map<String, Object> map) {
		return dao.selectCalendarList(map);
	}
	
	
	
	
	
	
	
}
