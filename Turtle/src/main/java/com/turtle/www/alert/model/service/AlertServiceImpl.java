package com.turtle.www.alert.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.alert.model.dao.AlertDAO;

@Service
public class AlertServiceImpl implements AlertService  {
	
	@Autowired
	private AlertDAO dao;

}
