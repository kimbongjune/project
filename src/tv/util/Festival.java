package tv.util;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class Festival {
	public String GetData(String startDate,String endDate)
	{
    	String xml = "";
		
		try
		{
    	
	        StringBuilder urlBuilder = new StringBuilder("http://openapi.jeonju.go.kr/rest/event/getEventList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=yJGJNeFSKf6%2FD9M%2FC5jh9%2B7RN1XAohFs2%2BTaor9yMLA7vQvTz5lpcw%2BGGmx5siipnI%2F8As4LeIUAxmGrRdxL0Q%3D%3D"); 	/*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 		 	 /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8"));		 /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); 			 /*공연행사명*/
	        urlBuilder.append("&" + URLEncoder.encode("startDay","UTF-8") + "=" + URLEncoder.encode(startDate, "UTF-8")); 	 /*검색할 생성일 범위의 시작*/
	        urlBuilder.append("&" + URLEncoder.encode("endDay","UTF-8") + "=" + URLEncoder.encode(endDate, "UTF-8")); 		 /*검색할 생성일 범위의 종료*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        xml = sb.toString();		
		}catch(Exception e)
		{
			
		}
		return xml;
       
    }
}