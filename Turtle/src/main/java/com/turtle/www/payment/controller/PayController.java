package com.turtle.www.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.calendar.controller.CalendarController;

@Controller
@RequestMapping("/payment")
//@SessionAttributes({"loginMember"})
public class PayController {
	
	Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@GetMapping("/pay")
	public String pay() {
		return "payment/pay";
	}
	
	
	
	
	

}
