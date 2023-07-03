package com.turtle.www.alert.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.turtle.www.alert.model.service.AlertService;
import com.turtle.www.alert.model.vo.Alert;

@Controller
@RequestMapping("/alert")
@SessionAttributes({"loginMember"})
public class AlertController {
	
	@Autowired
	private AlertService service;
	
	@ResponseBody
	@GetMapping("/selectAlertList")
	public List<Alert> selectAlertList(Alert alert) {
		
		return service.selectAlertList(alert);		
	}
	
	@ResponseBody
	@GetMapping("/updateAlertCheckFg")
	public int updateAlertCheckFg(Alert alert) {
		
		return service.updateAlertCheckFg(alert);
	}

}
