package com.project.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int insertReservation(String screenCode, String timeCode, String mcode, String[] seatList, String id, int totalPrice) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("screenCode", screenCode);
		map.put("timeCode", timeCode);
		map.put("mcode", mcode);
		map.put("id", id);
		map.put("totalPrice", totalPrice);
		int result = 0;
		mapper.insertBooking(map);
		String bookingCode = mapper.selectBookingcode();
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
			
			result++;
		}
		
		return result;
	}

	public List<BookingDTO> selectMovieList(String screenCode, String sdate, String mcode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("screenCode", screenCode);
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

}
