package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("booking")
public class BookingDTO {
	private String bookingCode;
	private String email;
	private String movieDate;
	private String screenCode;
	private String screenName;
	private String cinemaName;
	private String movieCode;
	private String seatType;
	private String seatNo;
	private int totalPrice;
	
	private String timeCode;
	private String title;
	private String mcode;
	private String startTime;
	private String endTime;
	
	private String allseat;
	private String remainseat;
	
	public BookingDTO() {
	}
	
	
	
	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	

	public String getMovieDate() {
		return movieDate;
	}



	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}



	public String getBookingCode() {
		return bookingCode;
	}
	
	public void setBookingCode(String bookingCode) {
		this.bookingCode = bookingCode;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTimeCode() {
		return timeCode;
	}
	
	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
	}
	
	public String getScreenCode() {
		return screenCode;
	}
	
	public void setScreenCode(String screenCode) {
		this.screenCode = screenCode;
	}
	
	public String getMovieCode() {
		return movieCode;
	}
	
	public void setMovieCode(String movieCode) {
		this.movieCode = movieCode;
	}
	
	public String getSeatType() {
		return seatType;
	}
	
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	
	public String getSeatNo() {
		return seatNo;
	}
	
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	
	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getAllseat() {
		return allseat;
	}

	public void setAllseat(String allseat) {
		this.allseat = allseat;
	}

	public String getRemainseat() {
		return remainseat;
	}

	public void setRemainseat(String remainseat) {
		this.remainseat = remainseat;
	}



	@Override
	public String toString() {
		return "BookingDTO [bookingCode=" + bookingCode + ", email=" + email + ", movieDate=" + movieDate
				+ ", screenCode=" + screenCode + ", screenName=" + screenName + ", cinemaName=" + cinemaName
				+ ", movieCode=" + movieCode + ", seatType=" + seatType + ", seatNo=" + seatNo + ", totalPrice="
				+ totalPrice + ", timeCode=" + timeCode + ", title=" + title + ", mcode=" + mcode + ", startTime="
				+ startTime + ", endTime=" + endTime + ", allseat=" + allseat + ", remainseat=" + remainseat + "]";
	}

	
	
}
