package com.turtle.www.calendar.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.turtle.www.calendar.model.vo.Calendar;
import com.turtle.www.member.model.vo.Member;

@Controller
@RequestMapping("/calendar")
@SessionAttributes({"loginMember"})
public class CalendarController {
	
	Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@GetMapping("/calendar")
	public String calendar(@ModelAttribute("loginMember") Member loginMember) {
		
		logger.debug(loginMember.getMemberNo() + "");
		
		return "calendar/calendar";
	}
	
	@ResponseBody
	@PostMapping("/addEvent")
	public String addEvent(@RequestParam Map<String, Object> allData) {
		
		logger.debug("allData" + allData);
		Calendar calendar = new Calendar();
	
		logger.debug("allData" + Integer.parseInt((String) allData.get("memberNo")));
		logger.debug("allData" + ((String) allData.get("title")));
		logger.debug("allData" + ((String) allData.get("title")));
		
		
		List<Calendar> eventList = new ArrayList<>();
		
		
		
		return new Gson().toJson(allData);
	}
	
}
