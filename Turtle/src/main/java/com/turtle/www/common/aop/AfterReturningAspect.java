package com.turtle.www.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Aspect
@Order(5) // advice 실행 순서, 클 수록 먼저 시작
public class AfterReturningAspect {
	private Logger logger = LoggerFactory.getLogger(BeforeAspect.class);
	
	// @AfterReturning : 기존 @After + 반환값 얻어오기 기능
	
	@AfterReturning(pointcut = "CommonPointcut.implPointcut()", returning = "returnObj")
	public void serviceReturnValue(JoinPoint jp, Object returnObj) {

		logger.info("Return Value : " + returnObj);
		
	}
	

	
}
