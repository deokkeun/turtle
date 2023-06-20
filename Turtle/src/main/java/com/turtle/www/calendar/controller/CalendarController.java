package com.turtle.www.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.turtle.www.calendar.model.service.CalendarService;
import com.turtle.www.calendar.model.vo.Calendar;
import com.turtle.www.member.model.vo.Member;
import com.turtle.www.projectMember.model.service.ProjectMemberService;

@Controller
@RequestMapping("/calendar")
@SessionAttributes({"loginMember", "workspaceNo"})
public class CalendarController {
	
	Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private CalendarService service;
	
	@Autowired
	private ProjectMemberService pmService;	
	
	
	/** 캘린더 페이지 이동
	 * @param loginMember
	 * @return
	 */
	@GetMapping("/calendar/{projectNo}/{workspaceNo}")
	public String calendarPage(@ModelAttribute("loginMember") Member loginMember,
								Model model,
								HttpServletResponse resp,
								@PathVariable("projectNo") int projectNo,
								@PathVariable("workspaceNo") int workspaceNo) {

		Map<String, Object> map = new HashMap<>();
		
		// memberNo와 projectNo로 pmNo확인
		int memberNo = loginMember.getMemberNo();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int pmNo = pmService.selectPmNo(map);
		
		map.put("pmNo", pmNo);
		map.put("workspaceNo", workspaceNo);
		
		// 캘린더 리스트 조회
		List<Calendar> calendarList = service.selectCalendarList(map);

		model.addAttribute("workspaceNo", workspaceNo); // session에 올림
		model.addAttribute("calendarList", calendarList);
		model.addAttribute("pmNo", pmNo);
		
		
		logger.debug(loginMember.getMemberNo() + "페이지 이동");
		
		return "calendar/calendar";
	}
	
	/** 캘린더 데이터 가져오기(loadingEvents)
	 * @param loginMember
	 * @return
	 */
	@ResponseBody
	@PostMapping("/calendar/{projectNo}/{workspaceNo}")
	public String calendar(@ModelAttribute("loginMember") Member loginMember,
							Model model,
							@PathVariable("projectNo") int projectNo,
							@PathVariable("workspaceNo") int workspaceNo) {

		logger.debug(loginMember.getMemberNo() + "데이터가져오기 컨트롤러 전");
		Map<String, Object> map = new HashMap<>();
		
		// memberNo와 projectNo로 pmNo확인
		int memberNo = loginMember.getMemberNo();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int pmNo = pmService.selectPmNo(map);
		
		map.put("pmNo", pmNo);
		map.put("workspaceNo", workspaceNo);
		
		
		// 캘린더 리스트 조회
		List<Calendar> calendarList = service.selectCalendarList(map);
		
	      JSONObject jsonObj = new JSONObject();
		  JSONArray jsonArr = new JSONArray();
		  
		  HashMap<String, Object> hash = new HashMap<String, Object>();		
			
			for(int i=0; i < calendarList.size(); i++) {
				hash.put("id", calendarList.get(i).getCalNo()); // id
				hash.put("title", calendarList.get(i).getCalTitle()); //제목
				hash.put("start", calendarList.get(i).getStartDate()); //시작일자
				hash.put("end", calendarList.get(i).getEndDate()); //종료일자
				hash.put("content", calendarList.get(i).getCalContent()); //내용
				hash.put("color", calendarList.get(i).getCalColor()); //색상
				
				
				jsonObj = new JSONObject(hash); //중괄호 {key:value , key:value, key:value}
				jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
			}
			
			logger.info("jsonArrCheck: {}", jsonArr);
		
		model.addAttribute("workspaceNo", workspaceNo); // session에 올림
		model.addAttribute("calendarList", calendarList);
		model.addAttribute("pmNo", pmNo);
		
		
		return new Gson().toJson(jsonArr);
	}
	
}
