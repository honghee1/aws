package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("cinema")
public class CinemaDTO {
	private String cinemacode;
	private String cinemaname;
	public CinemaDTO(String cinemacode, String cinemaname) {
		super();
		this.cinemacode = cinemacode;
		this.cinemaname = cinemaname;
	}
	public CinemaDTO() {
		super();
	}
	@Override
	public String toString() {
		return "CinemaDTO [cinemacode=" + cinemacode + ", cinemaname=" + cinemaname + "]";
	}
	public String getCinemacode() {
		return cinemacode;
	}
	public void setCinemacode(String cinemacode) {
		this.cinemacode = cinemacode;
	}
	public String getcinemaname() {
		return cinemaname;
	}
	public void setcinemaname(String cinemaname) {
		this.cinemaname = cinemaname;
	}
}
