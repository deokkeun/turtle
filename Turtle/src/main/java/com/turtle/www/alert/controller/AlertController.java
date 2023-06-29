package com.turtle.www.alert.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.alert.model.service.AlertService;

@Controller
@RequestMapping("/alert")
@SessionAttributes({"loginMember"})
public class AlertController {
	
	@Autowired
	private AlertService service;
	

	public String alertHandler() {
		return null;
		
		
		
	}
	

}
