package com.turtle.www.calendar.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.turtle.www.calendar.model.vo.Calendar;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@GetMapping("/calendar")
	public String calendar() {
		return "calendar/calendar";
	}
	
	@ResponseBody
	@PostMapping("/addEvent")
	public String addEvent(@RequestParam Object allData) {
		
		logger.debug("allData" + allData);
		ObjectMapper mapper = new ObjectMapper();
		
		List<Calendar> eventList = new ArrayList<>();
		
		
		
		return new Gson().toJson(allData);
	}
	
}
