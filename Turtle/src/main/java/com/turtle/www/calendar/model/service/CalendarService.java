package com.turtle.www.calendar.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.www.calendar.model.vo.Calendar;

public interface CalendarService {

	List<Calendar> selectCalendarList(Map<String, Object> map);


}
