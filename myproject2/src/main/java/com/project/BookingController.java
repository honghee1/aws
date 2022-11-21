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
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mysql.cj.Session;
import com.project.Service.BookingService;
import com.project.Service.KakaoPayService;
import com.project.Service.ScreenService;
import com.project.Service.movieService;
import com.project.dto.BookingDTO;
import com.project.dto.MovieDTO;
import com.project.dto.ScreenDTO;


@Controller
@SessionAttributes({"tid","order"})
public class BookingController {
	private movieService movieservice;
	private ScreenService screenservice;
	private BookingService bookingservice;
	private KakaoPayService KakaoPayService;

	public BookingController(movieService movieservice, ScreenService screenservice, BookingService bookingservice,KakaoPayService KakaoPayService) {
		super();
		this.movieservice = movieservice;
		this.screenservice = screenservice;
		this.bookingservice = bookingservice;
		this.KakaoPayService = KakaoPayService;
	}

	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YY/MM/dd"); // 날짜 데이터 포멧 설정

	@RequestMapping("/reserveView.do")
	public String reserveView(Model model) {
		// 추가할것 : 지점별 영화가 몇개있는지 추가 ex 서울(4)
		// 연령별 이미지 추가

		// 현재 날짜 기본 설정값 초기화
		String sdate = LocalDate.now().format(formatter);
		System.out.println(sdate);
		// 영화 리스트 불러오는 부분
		List<MovieDTO> movielist = movieservice.selectAllMovieSchedule();

		// 1번째 리스트 mcode -> html에 최초 화면 제공용
		String mcode = movielist.get(0).getMcode();
		System.out.println(mcode + "----" + sdate);
		// sdate 임시 재설정
		/* sdate = "22/07/02"; */
		// 해당 영화 상영 지점 출력
		List<ScreenDTO> screenlist = screenservice.selectScreenList(mcode, sdate);
		
		model.addAttribute("movielist", movielist);
		model.addAttribute("screenlist", screenlist);
		model.addAttribute("title", "영화 예매 :: Hello Movie Cinema");
		model.addAttribute("page", "es/reserveView.jsp");
		return "main_index";
	}

	@RequestMapping("/screenListView.do")
	public ResponseEntity<List<ScreenDTO>> screenListView(String mcode, Model model) {
		String sdate = LocalDate.now().format(formatter);

		// sdate 임시 재설정
		/* sdate = "22/07/02"; */

		System.out.println("screenListView, mcode : " + mcode);
		System.out.println("movieListView, sdate : " + sdate);

		List<ScreenDTO> screenlist = screenservice.selectScreenList(mcode, sdate);
		System.out.println("screenlist" + screenlist);
		return ResponseEntity.ok(screenlist);
	}

	@RequestMapping("/movieListView.do")
	public ResponseEntity<List<BookingDTO>> MovieListView(String cinemaCode, String screenCode, String sdate,
			String mcode, Model model) {

		// sdate 임시 재설정
		/* sdate = "22/07/02"; */

		System.out.println("movieListView, cinemaCode : " + cinemaCode);
		System.out.println("movieListView, sdate : " + sdate);
		System.out.println("movieListView, mcode : " + mcode);

		List<BookingDTO> movielist = bookingservice.selectMovieList(cinemaCode, sdate, mcode);
		System.out.println(movielist);
		// 좌석 잔여 개수 구하는 부분
		for (int i = 0; i < movielist.size(); i++) {
			List<String> bookedSeat = bookingservice.selectBookedSeat(movielist.get(i).getTimeCode());
			String allSeat = bookingservice.selectAllSeat(screenCode);
			movielist.get(i).setRemainseat(String.valueOf(bookedSeat.size()));
			movielist.get(i).setAllseat(allSeat);
		}
		System.out.println(movielist);
		model.addAttribute("movielist", movielist);
		return ResponseEntity.ok(movielist);
	}

	@RequestMapping("/seatCreate.do")
	public String seatCreate(String cinemacode,String screenCode, String timeCode, String mcode, Model model) {
		System.out.println("seatView.do, screenCode : " + screenCode);
		System.out.println("seatView.do, screenCode : " + cinemacode);
		ScreenDTO seatdto = bookingservice.selectSeatType(screenCode);
		List<String> bookedSeat = bookingservice.selectBookedSeat(timeCode);
		String tag = "";
		String str = seatdto.getSeatTag();
		System.out.println(str);
		tag = "<input type='hidden' name='screenCode' value='" + screenCode + "'>"
				+ "<input type='hidden' name='timeCode' value='" + timeCode + "'>"
				+ "<input type='hidden' name='mcode' value='" + mcode + "'>"
				+ "<input type='hidden' name='cinemacode' value='" + cinemacode + "'>"
				+ "<input type='hidden' name='price' value='0'>";
		str = str.replace("/", "<div class='empty'></div>");
		str = str.replace("^", "<br>");
		int seat = 1;

		while (str.contains("*")) {
			if (bookedSeat.contains(String.valueOf(seat))) {
				str = str.replaceFirst("\\*", "<input type='button' value='" + seat + "' class='seat' disabled >");
			} else {
				str = str.replaceFirst("\\*", "<input type='button' value='" + seat + "' class='seat'>");
			}
			seat++;
		}

		tag += str;
		/* return ResponseEntity.ok(1); */
		model.addAttribute("tag", tag);
		model.addAttribute("title", "인원/좌석 선택 :: Hello Movie Cinema");
		model.addAttribute("page", "es/seatView.jsp");
		return "main_index";
	}

	/*
	 * @RequestMapping("/seatView.do") public String seatView(Model model, String
	 * screencode,String tag) { System.out.println(tag); model.addAttribute("title",
	 * "인원/좌석 선택 :: Hello Movie Cinema"); model.addAttribute("page",
	 * "es/seatView.jsp"); return "main_index"; }
	 */

	@RequestMapping("/booking.do")
	public ResponseEntity<String> booking(String[] seatList, String id) {
		String screenCode = seatList[0];
		String timeCode = seatList[1];
		String mcode = seatList[2];
		int totalPrice = Integer.parseInt(seatList[3]);
		String data = "";

		// seat 데이터 확인부
		for (int i = 4; i < seatList.length; i++) {
			data += seatList[i] + ", ";
		}
		System.out.println("booking.do, seatList : " + data);
		System.out.println(screenCode);
		System.out.println(timeCode);
		System.out.println(mcode);
		System.out.println(totalPrice);

		// 데이터 임시 설정
		id = "test";
//		totalPrice = 10000;

		Map<String, Object> bookingresult = bookingservice.insertReservation(screenCode, timeCode, mcode, seatList, id,
				totalPrice);
		bookingresult.get("result");
		JSONObject bookingdata = new JSONObject();
		bookingdata.put("BookingCode", bookingresult.get("bookingCode"));
		bookingdata.put("result", bookingresult.get("result"));
		bookingdata.put("count", bookingresult.get("count"));
		bookingdata.put("timeCode", timeCode);
		bookingdata.put("totalPrice", totalPrice);
		String bookingresultdata = bookingdata.toString();
		return ResponseEntity.ok(bookingresultdata);
	}

	@RequestMapping("/kakaopay.do")
	@ResponseBody
	public String kakaopay(@RequestBody String ticketInfo,Model model,HttpSession session) {
		try {
			JSONObject BookingReadyInfo = new JSONObject(ticketInfo);
			String bookingcode = bookingservice.selectBookingCode();
			String Title = movieservice.selectMovieTitle(BookingReadyInfo.get("mcode"));
			String result = KakaoPayService.kakaopayReady(ticketInfo,Title,bookingcode);
			JSONObject tid = new JSONObject(result);
			BookingReadyInfo.put("tid",tid.get("tid"));
			model.addAttribute("tid",BookingReadyInfo.toString());
			System.out.println(BookingReadyInfo);
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
			
	}

	@RequestMapping("/approval.do")
	public void approval(String pg_token, HttpServletResponse response, @ModelAttribute("tid") String tid) {
				JSONObject ticketData = new JSONObject(tid);
				System.out.println(ticketData);
			try {
				String bookingCode = bookingservice.selectBookingCode();
				
				String bookingResult = bookingservice.insertBookingReadyInfo(ticketData,bookingCode);
				System.out.println(bookingResult);
				if(bookingResult.equals("fail")) {
					response.getWriter().write("<script>alert('결제 실패 다시 시도해 주시길 바랍니다');location.href='main.do';</script>");
				}else {
					String KakaopayResult = KakaoPayService.kakaopayapproval(pg_token,(String)ticketData.get("tid"),(String)ticketData.get("totalprice"));
					
					System.out.println(KakaopayResult);
					if(KakaopayResult.equals("fail")) {
						System.out.println("5");
						bookingservice.deleteBookingData(bookingCode);
						response.getWriter().write("<script>alert('결제 실패 다시 시도해 주시길 바랍니다');location.href='main.do';</script>");
					}else {
						System.out.println("6");
						response.getWriter().write(
								  "<script>opener.document.location.href='parchaseResult.do?bookingCode=" + bookingCode+
								  "'; window.close(); </script>");
					}
					 
				}
					
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
	}

	@RequestMapping("/cancel.do")
	public void cancel(Model model, HttpServletResponse response) {
		// kakaopay 실패/취소 시 진입
		System.out.println("cancel 진입");

		try {
			response.getWriter()
					.write("<script>opener.document.location.href='parchaseFail.do'; window.close(); </script>");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/parchaseResult.do")
	public String purchaseResult(String bookingCode, Model model) throws ParseException {
		System.out.println("purchaseResult 진입, bookingCode : " + bookingCode);
		List<BookingDTO> list = bookingservice.selectBookingResult(bookingCode);
		System.out.println(list);

		// 날짜 형태 변환부 ----년 --월 --일
		String strDate = list.get(0).getMovieDate().substring(0, 10);
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		Date formatDate = dtFormat.parse(strDate);
		String strNewDtFormat = newDtFormat.format(formatDate);
		list.get(0).setMovieDate(strNewDtFormat);

		System.out.println("result 부 날짜 형태 : " + list.get(0).getMovieDate());
		model.addAttribute("resultlist", list);
		model.addAttribute("title", "결제 성공 :: Hello Movie Cinema");
		model.addAttribute("page", "es/purchaseResult.jsp");
		return "main_index";
	}

	@RequestMapping("/parchaseFail.do")
	public String payfail(Model model, HttpServletResponse response) {

		model.addAttribute("title", "결제 실패 :: Hello Movie Cinema");
		model.addAttribute("page", "es/purchaseFail.jsp");
		return "main_index";
	}
}
