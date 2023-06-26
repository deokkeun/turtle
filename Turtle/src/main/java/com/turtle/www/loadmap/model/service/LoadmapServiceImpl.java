package com.turtle.www.loadmap.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.loadmap.model.dao.LoadmapDAO;

@Service
public class LoadmapServiceImpl implements LoadmapService{

	@Autowired
	private LoadmapDAO dao;
	
	
	
	
}
