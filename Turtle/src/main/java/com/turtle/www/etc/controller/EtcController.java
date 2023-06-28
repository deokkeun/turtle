package com.turtle.www.etc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/etc")
@Controller
public class EtcController {
	
	@GetMapping("/terms")
	public String termPage() {
		
		return "etc/terms";
	}
	
	@GetMapping("/pricing")
	public String pricingPage() {
		
		return "etc/pricing";
	}
	
	@GetMapping("/faq")
	public String faqPage() {
		
		return "etc/faq";
	}
	@GetMapping("/main-faq")
	public String mainfaqPage() {
		
		return "etc/main-faq";
	}
}
