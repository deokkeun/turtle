package com.turtle.www.common;

import java.text.SimpleDateFormat;

public class Util {
	   // 파일명 변경 메소드
	   public static String fileRename(String originFileName) {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	      String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

	      int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

	      String str = "_" + String.format("%05d", ranNum);

	      String ext = originFileName.substring(originFileName.lastIndexOf("."));

	      return date + str + ext;
	   }
	   
	   // 크로스 사이트 스트립트 공격을 방지 하기 위한 메소드
	   public static String XSSHandling(String content) {
	      if(content != null) {
	         content = content.replaceAll("&", "&amp;");
	         content = content.replaceAll("<", "&lt;");
	         content = content.replaceAll(">", "&gt;");
	         content = content.replaceAll("\"", "&quot;");
	      }
	      return content;
	   }

	   // 크로스 사이트 스트립트 해제
	   public static String XSSClear(String content) {
	      if(content != null) {
	         content = content.replaceAll("&amp;", "&");
	         content = content.replaceAll("&lt;", "<" );
	         content = content.replaceAll("&gt;", ">");
	         content = content.replaceAll("&quot;", "\"");
	      }
	      return content;
	   }
	   
	   // 개행문자 처리 
	   public static String newLineHandling(String content) {
	      return content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	   }
	   
	   // 개행문자 해제
	   public static String newLineClear(String content) {
	      return content.replaceAll("<br>", "\n");
	   }
	     
}