package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("screen")
public class ScreenDTO {
	private String screenCode;
	private String cinemaCode;
	private String cinemaName;
	private String screenName;
	
	public ScreenDTO() {	}
	
	public ScreenDTO(String screenCode, String cinemaCode, String cinemaName, String screenName) {
		super();
		this.screenCode = screenCode;
		this.cinemaCode = cinemaCode;
		this.cinemaName = cinemaName;
		this.screenName = screenName;
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
		return "ScreenDTO [screenCode=" + screenCode + ", cinemaCode=" + cinemaCode + ", cinemaName=" + cinemaName + ", screenName=" + screenName
				+ "]";
	}
	
	
	
}