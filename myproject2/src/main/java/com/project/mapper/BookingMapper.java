package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.BookingDTO;
import com.project.dto.ScreenDTO;


@Mapper
public interface BookingMapper {

	List<BookingDTO> selectMovieList(Map<String, Object> map);
	
	ScreenDTO selectSeatType(String screenCode);

	int insertBooking(Map<String, Object> map);

	String selectSeatcode(Map<String, Object> map);
	
	String selectBookingcode();

	void insertBookedSeat(Map<String, Object> map);

	List<String> selectBookedSeat(String timeCode);

	String selectAllSeat(String screenCode);

	BookingDTO selectMovieTime(String timeCode);

	List<BookingDTO> selectBookingResult(String bookingCode);


}
