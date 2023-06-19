package com.turtle.www.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.payment.model.dao.PayDAO;

@Service
public class PayServiceImpl implements PayService{

	@Autowired
	private PayDAO dao;
	
	
	
	
}
