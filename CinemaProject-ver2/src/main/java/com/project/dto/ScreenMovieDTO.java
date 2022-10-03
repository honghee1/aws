package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("screenmovie")
public class ScreenMovieDTO {
    private String mcode;
	private String screencode;
	private String startdate;
	private String enddate;
	public ScreenMovieDTO(String mcode, String screencode, String startdate, String enddate) {
		super();
		this.mcode = mcode;
		this.screencode = screencode;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	public ScreenMovieDTO() {
		super();
	}
	public String getmcode() {
		return mcode;
	}
	public void setmcode(String mcode) {
		this.mcode = mcode;
	}
	public String getScreencode() {
		return screencode;
	}
	public void setScreencode(String screencode) {
		this.screencode = screencode;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "ScreenMovieDTO [mcode=" + mcode + ", screencode=" + screencode + ", startdate=" + startdate
				+ ", enddate=" + enddate + "]";
	}
                                
}
