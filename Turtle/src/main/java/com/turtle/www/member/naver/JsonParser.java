package com.turtle.www.member.naver;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.turtle.www.member.model.vo.Member;

public class JsonParser {
	
	public Member changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		Member member = new Member();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

		map.put("socialEmail", jsonObject.get("email"));
		map.put("memberName", jsonObject.get("name"));
		
		
		//dto에 넣기
		member.setSocialEmail(map.get("socialEmail").toString());
		member.setMemberName(map.get("memberName").toString());
		
		System.out.println("json member: " + member);
		return member;
	}

}
