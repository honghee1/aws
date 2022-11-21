package com.project.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.project.dto.BookingDTO;
import com.project.dto.ScreenDTO;
import com.project.mapper.BookingMapper;

@Service
public class BookingService {
	private BookingMapper mapper;

	public BookingService(BookingMapper mapper) {
		this.mapper = mapper;
	}

	public Map<String, Object> insertReservation(String screenCode, String timeCode, String mcode, String[] seatList, String id, int totalPrice) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> bookingresult = new HashMap<String, Object>();
		String bookingCode = mapper.selectBookingcode();
		map.put("screenCode", screenCode);
		map.put("timeCode", timeCode);
		map.put("mcode", mcode);
		map.put("id", id);
		map.put("totalPrice", totalPrice);
		map.put("bookingCode", bookingCode);
		int result = mapper.insertBooking(map);
		int count = 0;
		System.out.println("Booking bookingCode : " + bookingCode);
		System.out.println("Booking 테이블 등록 완료");
			
		for(int i=4;i<seatList.length;i++) {
			
			map.put("seatNo", seatList[i]);
			
			String seatCode = mapper.selectSeatcode(map);
			System.out.println("Booking screenCode : " + map.get("screenCode"));
			System.out.println("Booking seatNo : " + map.get("seatNo"));
			System.out.println("Booking seatCode : " + seatCode);
			
			
			map.put("seatCode", seatCode);
			map.put("bookingCode", bookingCode);
			
			mapper.insertBookedSeat(map);
			System.out.println("Booked_Seat 테이블 등록 완료");
			
			map.remove("seatNo");
			map.remove("seatCode");
			map.remove("bookingCode");
			
			count++;
			
		}
		bookingresult.put("bookingCode", bookingCode);
		bookingresult.put("result", result);
		bookingresult.put("count", count);
		System.out.println();
		return bookingresult;
	}

	public List<BookingDTO> selectMovieList(String cinemaCode, String sdate, String mcode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cinemaCode", cinemaCode);
		map.put("sdate", sdate);
		map.put("mcode", mcode);
		System.out.println("map:"+map);
		return mapper.selectMovieList(map);
	}

	public ScreenDTO selectSeatType(String screenCode) {
		return mapper.selectSeatType(screenCode);
	}

	public List<String> selectBookedSeat(String timeCode) {
		return mapper.selectBookedSeat(timeCode);
	}

	public String selectAllSeat(String screenCode) {
		return mapper.selectAllSeat(screenCode);
	}

	public BookingDTO selectMovieTime(String timeCode) {
		return mapper.selectMovieTime(timeCode);
	}

	public String selectBookingCode() {
		return mapper.selectBookingcode();
	}

	public List<BookingDTO> selectBookingResult(String bookingCode) {
		return mapper.selectBookingResult(bookingCode);
	}

	public String insertBookingReadyInfo(JSONObject ticketData,String bookingcode) {
		
			System.out.println("123asd");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("screenCode",ticketData.get("screenCode"));
		map.put("timeCode", ticketData.get("timeCode"));
		map.put("mcode", ticketData.get("mcode"));
		map.put("id", ticketData.get("id"));
		map.put("totalPrice", ticketData.get("totalprice"));
		map.put("bookingCode", bookingcode);
		System.out.println(map);
		mapper.insertBooking(map);
		System.out.println("123asd1231231231");
		System.out.println("Booking bookingCode : " + bookingcode);
		System.out.println("Booking 테이블 등록 완료");
		JSONArray seatlist = ticketData.getJSONArray("seatlist");
		System.out.println("1a2sd3"+seatlist);
			for(int i=0;i<seatlist.length();i++) {
			
			map.put("seatNo", seatlist.get(i));
			
			String seatCode = mapper.selectSeatcode(map);
			System.out.println("screenCode : " + map.get("screenCode"));
			System.out.println("Booking seatNo : " + map.get("seatNo"));
			System.out.println("Booking seatCode : " + seatCode);
			System.out.println("Booking bookingcode : " + bookingcode);
			
			
			map.put("seatCode", seatCode);
			map.put("bookingCode", bookingcode);
			
			mapper.insertBookedSeat(map); 
			System.out.println("Booked_Seat 테이블 등록 완료");
			
			map.remove("seatNo");
			map.remove("seatCode");
			map.remove("bookingCode");
			
			
		}
		
			return bookingcode;
		
	}


	public void deleteBookingData(String bookingCode) {
		 mapper.deleteBookingData(bookingCode); 
	}

}
