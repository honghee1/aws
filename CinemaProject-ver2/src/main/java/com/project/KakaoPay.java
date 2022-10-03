package com.project;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class KakaoPay {
	
	@RequestMapping("/kakaopay222.do")
	@ResponseBody
	public String kakaopay222(){
		try {
			URL host = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) host.openConnection( );
			
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK 20b628f2f4f18d1afe51ffa334c781a6");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			
			String param = "cid=TC0ONETIME&partner_order_id=order_id&partner_user_id=user_id&item_name=movie&quantity=1&total_amount"
					+ "=10000&tax_free_amount=8000&approval_url=http://localhost:9999/approval.do&cancel_url=http://localhost:9999/cancel.do&fail_url=http://localhost:9999/fail.do";
			
			OutputStream os = con.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			dos.writeBytes(param);
			dos.close();
			
			int result = con.getResponseCode();
			
			InputStream is;
			// 정상 통신 = 200 코드
			if(result == 200) {
				is = con.getInputStream();
			}else {
				is = con.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			return br.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "result";
		
	}

}
