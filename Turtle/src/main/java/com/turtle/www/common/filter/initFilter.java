package com.turtle.www.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebFilter(filterName="initFilter", urlPatterns="/*")
public class initFilter extends HttpFilter implements Filter {
       
	private Logger logger = LoggerFactory.getLogger(initFilter.class);
	
	// 필터가 생성될 때 실행
	public void init(FilterConfig fConfig) throws ServletException {
		// trace - debug - info - warn - error
		
		// debug : 개발의 흐름 파악 (이게 실행이 되었는지, 파라미터가 현재 무엇인지 확인할 때)
		// info : 메소드 실행 파악
		logger.info("초기화 필터 생성");
	}
		
	// 필터가 파괴될 때 실행(서버는 켜져있는데 백엔드 코드가 수정되었을 때)
	public void destroy() {
		logger.info("초기화 필터 파괴");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// application 내장 객체 얻어오기
		ServletContext application = request.getServletContext();
		
		// 최상위 주소 얻어오기
		String contextPath =  ( (HttpServletRequest)request ).getContextPath();
									// 다운캐스팅
		// 세팅
		application.setAttribute("contextPath", contextPath);
		
		chain.doFilter(request, response);
	}

}
