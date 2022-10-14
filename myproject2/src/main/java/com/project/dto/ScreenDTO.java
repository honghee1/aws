package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("screen")
public class ScreenDTO {
	private String screenCode;
	private String cinemaCode;
	private String cinemaName;
	private String screenName;
	private String seatType;
	private String seatCode;
	private String seatTag;
	private int allseat;
	
	private String timeCode;
	private String title;
	private String mcode;
	private String movieDate;
	
	private String startTime;
	private String endTime;
	private String runTime;
	
	public ScreenDTO() {	}
	
	
	
	public String getSeatTag() {
		return seatTag;
	}



	public void setSeatTag(String seatTag) {
		this.seatTag = seatTag;
	}



	public String getRunTime() {
		return runTime;
	}



	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}



	public String getTimeCode() {
		return timeCode;
	}



	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getMcode() {
		return mcode;
	}



	public void setMcode(String mcode) {
		this.mcode = mcode;
	}



	public String getMovieDate() {
		return movieDate;
	}



	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
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



	public String getSeatCode() {
		return seatCode;
	}

	public void setSeatCode(String seatCode) {
		this.seatCode = seatCode;
	}

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	public int getAllseat() {
		return allseat;
	}

	public void setAllseat(int allseat) {
		this.allseat = allseat;
	}

	public String getScreenCode() {
		return screenCode;
	}

	public void setScreenCode(String screenCode) {
		this.screenCode = screenCode;
	}

	public String getCinemaCode() {
		return cinemaCode;
	}

	public void setCinemaCode(String cinemaCode) {
		this.cinemaCode = cinemaCode;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}



	@Override
	public String toString() {
		return "ScreenDTO [screenCode=" + screenCode + ", cinemaCode=" + cinemaCode + ", cinemaName=" + cinemaName
				+ ", screenName=" + screenName + ", seatType=" + seatType + ", seatCode=" + seatCode + ", seatTag="
				+ seatTag + ", allseat=" + allseat + ", timeCode=" + timeCode + ", title=" + title + ", mcode=" + mcode
				+ ", movieDate=" + movieDate + ", startTime=" + startTime + ", endTime=" + endTime + ", runTime="
				+ runTime + "]";
	}
	
	
	
}