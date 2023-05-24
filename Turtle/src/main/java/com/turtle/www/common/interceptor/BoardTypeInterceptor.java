//package com.turtle.www.common.interceptor;
//
//import java.util.List;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import edu.kh.comm.board.model.service.BoardService;
//import edu.kh.comm.board.model.vo.BoardType;
//
//
//// **************************** 클래스명 용도에 맞게 변경하기 ****************************
//public class BoardTypeInterceptor implements HandlerInterceptor {
//
//	/* 인터셉터가 요청을 가로채는 시기
//	 * 
//	 * 1. preHandle (전처리) : 컨트롤러 수행 전
//	 * 
//	 * 2. postHandler (후처리) : 컨트롤러 수행 후 (컨트롤러 수행 결과 참조 가능)
//	 * 
//	 * 3. afterCompletion (View 단 처리 후) : 보통은 자원 반환(close())을 수행
//	 * 
//	 * ** 단, 비동기 요청(자바 내부의 별도 쓰레드 요청)은 가로채지 않음
//	 * 
//	 * */
//	
//	private Logger logger = LoggerFactory.getLogger(BoardTypeInterceptor.class);
//	
//	// BoardService 의존성 주입 받기(DI)
//	@Autowired
//	private BoardService boardService;
//	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//		
//		// logger.info("전처리 수행");
//		
//		// application scope에 "boardTypeList"가 없을 경우
//		// 이를 조회하는 Service 호출 후 결과를 세팅
//		
//		// application scope 객체 얻어오기
//		ServletContext application = request.getServletContext();
//		
//		// application scope에 "boardTypeList"가 없을 경우
//		
//		if(application.getAttribute("boardTypeList") == null) {
//			
//			List<BoardType> boardTypeList = boardService.selectBoardType();
//			
//			application.setAttribute("boardTypeList", boardTypeList);
//		}
//		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//
//		logger.info("후처리 수행");
//		
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		
//		logger.info("View단 처리 완료 후 수행");
//		
//		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
//	}
//
//	
//	
//	
//}
