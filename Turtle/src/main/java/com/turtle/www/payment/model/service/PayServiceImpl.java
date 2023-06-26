package com.turtle.www.payment.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.turtle.www.payment.model.dao.PayDAO;
import com.turtle.www.payment.model.vo.Pay;

@Service
public class PayServiceImpl implements PayService{

	@Autowired
	private PayDAO dao;
	
	private String impKey = "impKey";

	private String impSecret = "impSecret";

	
	

	/** 워크스페이스 개수 조회
	 *
	 */
	@Override
	public int workspaceCount(int projectNo) {
		return dao.workspaceCount(projectNo);
	}

	/** 프로젝트 참여자 수 조회 
	 *
	 */
	@Override
	public int projectMemberCount(int projectNo) {
		return dao.projectMemberCount(projectNo);
	}

	/** 결제 정보(전체) 불러오기(결제 타입)
	 *
	 */
	@Override
	public Pay paymentType(int projectNo) {
		return dao.paymentType(projectNo);
	}

	/** iamport 토큰값 가져오기
	 *
	 */
	@Override
	public String getToken() throws Exception {

		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", impKey);
		json.addProperty("imp_secret", impSecret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();


		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}

	
	
	/** 결제 정보 저장
	 *
	 */
	@Override
	public int insertPay(Pay pay) {
		return dao.insertPay(pay);
	}
	
    
	/** 결제 정보 불러오기
	 *
	 */
	public String paymentInfo(String imp_uid, String access_token) throws IOException, ParseException {
		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", access_token);
		conn.setDoOutput(true);

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		JSONParser parser = new JSONParser();

		JSONObject p = (JSONObject) parser.parse(br.readLine());
		
		String response = p.get("response").toString();
		
		p = (JSONObject) parser.parse(response);
		
		String amount = p.get("amount").toString();
		
		return amount;
	}
	

	/** 결제 취소
	 *
	 */
	@Override
	public void paymentCancle(String access_token, String imp_uid, String amount, String reason) throws IOException, ParseException {

		System.out.println("imp_uid = " + imp_uid);
		HttpsURLConnection conn = null;
		
		URL url = new URL("https://api.iamport.kr/payments/cancel");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");

		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);

		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();

		json.addProperty("reason", reason);
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", amount);
		json.addProperty("checksum", amount);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));			
		
		
		
	}

	/** 결제 내역 (마이페이지)
	 *
	 */
	@Override
	public List<Pay> payList(Map<String, Object> map) {	
		return dao.payList(map);
	}

	
	
	
	
}
