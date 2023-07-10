package com.turtle.www.calendar.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.calendar.model.vo.Calendar;

public interface CalendarService {

	

	
	/** 메인 페이지 캘린더 남은 일정
	 * @param projectNo
	 * @return
	 */
	List<Calendar> schedule(int projectNo);

	
	/** 캘린더 리스트 불러오기
	 * @param map
	 * @return
	 */
	List<Calendar> selectCalendarList(Map<String, Object> map);

	/** 캘린더 일정 추가
	 * @param calendar
	 * @return
	 */
	int calendarAddEvent(Calendar calendar);

	/** 캘린더 일정 삭제
	 * @param calendar
	 * @return
	 */
	int calendarDeleteEvent(Calendar calendar);

	/** 캘린더 일정 수정
	 * @param calendar
	 * @return
	 */
	int calendarUpdateEvent(Calendar calendar);

	/** 게시판 일정 추가/수정 전 조회
	 * @param calendar
	 * @return
	 */
	int selectBoardCalendar(Calendar calendar);

	

}
