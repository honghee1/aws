package com.project.Service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.springframework.stereotype.Service;


@Service
public class KakaoPayService {
	
	

	public String kakaopayReady(String ticketInfo,String Title,String bookingcode) {
		try{
		JSONObject BookingReadyInfo = new JSONObject(ticketInfo);
		/* String bookingcode = bookingservice.selectBookingCode(); */
		String item_name = "영화 예매 - " + Title;
		URL host = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection con = (HttpURLConnection) host.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "KakaoAK 7c80bdaf6195fbde0c8f9cb6da9451e1");

		con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8;");
		con.setDoOutput(true);
		System.out.println("item_name : " + item_name + "count : " + 1 + "price : " + BookingReadyInfo.get("totalprice"));
		String item = URLEncoder.encode(item_name, "UTF-8");
		
		
		
		/* aws ec2 서버용
		 * String param = "cid=TC0ONETIME&partner_order_id=order_id" +
		 * "&partner_user_id=user_id&item_name=" + item + "&quantity=" +
		 * String.valueOf(1) + "&total_amount=" + jObject.get("totalprice") +
		 * "&tax_free_amount=" + jObject.get("totalprice") +
		 * "&approval_url=http://15.165.77.144:8080/approval.do?bookingCode=" + "32" +
		 * "&cancel_url=http://15.165.77.144:8080/cancel.do&fail_url=http://15.165.77.144:8080/cancel.do";
		 */

		String seatlist = "";
		for (int i = 0; i < BookingReadyInfo.getJSONArray("seatlist").length(); i++) {
			seatlist = BookingReadyInfo.getJSONArray("seatlist").getString(i) + ",";
		}
		String param = "cid=TC0ONETIME&partner_order_id=order_id" + "&partner_user_id=user_id&item_name=" + item
				+ "&quantity=" + String.valueOf(1) + "&total_amount=" + (String) BookingReadyInfo.get("totalprice")
				+ "&tax_free_amount=" + (String) BookingReadyInfo.get("totalprice")
				+ "&cancel_url=http://localhost:9999/cancel.do&fail_url=http://localhost:9999/cancel.do"
				+ "&approval_url=http://localhost:9999/approval.do";

		OutputStream os = con.getOutputStream();
		DataOutputStream dos = new DataOutputStream(os);
		dos.writeBytes(param);
		dos.close();
		int result = con.getResponseCode();

		InputStream is;
		// 정상 통신 = 200 코드
		if (result == 200) {
			is = con.getInputStream();
		} else {
			is = con.getErrorStream();
		}

		
		InputStreamReader isr = new InputStreamReader(is, "UTF-8");
		BufferedReader br = new BufferedReader(isr);
		JSONObject kakaopayResponse = new JSONObject(br.readLine());
		
		System.out.println((String) kakaopayResponse.get("tid"));
		
		
		System.out.println(kakaopayResponse.toString());
		return kakaopayResponse.toString();
	} catch (MalformedURLException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	return "result";
		
	}
	
	public String kakaopayapproval(String pg_token,String tid,String totalprice) {
			String Kakaopayresult = "";
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET"); // http 메서드
			conn.setRequestProperty("Authorization", "KakaoAK 7c80bdaf6195fbde0c8f9cb6da9451e1");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8;"); // header
			conn.setRequestProperty("auth", "myAuth"); // header의 auth 정보
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true

			System.out.println("tid= "+ tid);
			String param = "tid="+tid
					+ "&pg_token=" + pg_token + "&cid=TC0ONETIME&partner_order_id=order_id"
					+ "&partner_user_id=user_id&total_amount="+totalprice;
			OutputStream os = conn.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			dos.writeBytes(param);
			dos.close();

			int result = conn.getResponseCode();

			InputStream is;
			if (result == 200) {
				is = conn.getInputStream();
			} else {
				is = conn.getErrorStream();
			}

			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			BufferedReader br = new BufferedReader(isr);

			Kakaopayresult = (String)br.readLine();
			System.out.println("------------------"+Kakaopayresult);
			return Kakaopayresult;
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	

}
