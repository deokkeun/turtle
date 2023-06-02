package com.turtle.www.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class ThrowingAspect {
	private Logger logger = LoggerFactory.getLogger(BeforeAspect.class);
	
	// @AfterTrowing : 기존 @After + 던져지는 예외 얻어오기 기능
	
	@AfterThrowing(pointcut = "CommonPointcut.implPointcut()", throwing = "exceptionObj")
	public void serviceReturnValue(JoinPoint jp, Exception exceptionObj) {
		
		String str = "<<exception>> : " + exceptionObj.getStackTrace()[0];
		
		str += " - " + exceptionObj.getMessage()  + "\n";
		
		logger.error(str);
		
	}
}
