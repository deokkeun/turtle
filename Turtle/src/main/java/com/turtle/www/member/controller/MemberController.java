package com.turtle.www.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.turtle.www.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
// @SessionAttributes({"loginMember"})
public class MemberController {

	@Autowired
	private MemberService service;
	
//	@Autowired
//	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	
	
	
	
}
