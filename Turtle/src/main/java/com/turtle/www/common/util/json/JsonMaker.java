package com.turtle.www.common.util.json;

import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonMaker {
	
	private static ObjectMapper mapper = new ObjectMapper();
	
	//객체를 넣으면 제이슨으로 파싱
	public static String json(Object object) {
		String objectToJson;
		try {
			
			objectToJson = mapper.writeValueAsString(object);
			
		} catch (JsonProcessingException e) {
			throw new RuntimeException("제이슨 파싱 에러");
		}


		return objectToJson;
	}

	//제이슨을 넣으면 Map으로 반환
	public static Map<String, Object> map(String json) throws Exception {

		Map<String, Object> jsonMap = null;
		try {
			
			jsonMap = mapper.readValue(json,  new TypeReference<Map<String,Object>>(){});

			
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		
		}

		
		return jsonMap;
	}
	

}