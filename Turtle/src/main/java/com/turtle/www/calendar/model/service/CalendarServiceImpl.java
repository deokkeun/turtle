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
	
	


	/** 메인 페이지 캘린더 남은 일정
	 *
	 */
	@Override
	public List<Calendar> schedule(int projectNo) {
		return dao.schedule(projectNo);
	}

	/** 캘린더 리스트 조회
	 *
	 */
	@Override
	public List<Calendar> selectCalendarList(Map<String, Object> map) {
		return dao.selectCalendarList(map);
	}

	/** 캘린더 일정 추가
	 *
	 */
	@Override
	public int calendarAddEvent(Calendar calendar) {
		return dao.calendarAddEvent(calendar);
	}
	
	
	/** 캘린더 일정 수정
	 *
	 */
	@Override
	public int calendarUpdateEvent(Calendar calendar) {
		return dao.calendarUpdateEvent(calendar);
	}

	/** 캘린더 일정 삭제
	 *
	 */
	@Override
	public int calendarDeleteEvent(Calendar calendar) {
		return dao.calendarDeleteEvent(calendar);
	}

	/** 게시판 일정 추가/수정 전 조회
	 *
	 */
	@Override
	public int selectBoardCalendar(Calendar calendar) {
		return dao.selectBoardCalendar(calendar);
	}
	
	
	
	
	
	
	
}
