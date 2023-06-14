package com.turtle.www.etc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/etc")
@Controller
public class EtcController {
	
	@GetMapping("/terms")
	public String etcPage() {
		
		return "etc/terms";
	}
}