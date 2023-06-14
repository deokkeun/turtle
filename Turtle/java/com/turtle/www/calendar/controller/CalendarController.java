package com.turtle.www.calendar.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@GetMapping("/calendar")
	public String calendar() {
		return "calendar/calendar";
	}
	
	
	@PostMapping("/addEvent")
	public String addEvent(@RequestParam Map<String, Object> paramMap) {
		
		logger.debug("paramMap" + paramMap);
		
		return "calendar/calendar";
	}
	
}
