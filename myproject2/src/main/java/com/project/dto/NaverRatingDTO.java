package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("naverRating")
public class NaverRatingDTO {
	private String MCODE;
	private String naver_mtitle;
	private String pubDate;
	private String user_rating;
	public NaverRatingDTO(String mCODE, String naver_mtitle, String pubDate, String user_rating) {
		super();
		MCODE = mCODE;
		this.naver_mtitle = naver_mtitle;
		this.pubDate = pubDate;
		this.user_rating = user_rating;
	}
	public NaverRatingDTO() {
		super();
	}
	@Override
	public String toString() {
		return "NaverRatingDTO [MCODE=" + MCODE + ", naver_mtitle=" + naver_mtitle + ", pubDate=" + pubDate
				+ ", user_rating=" + user_rating + "]";
	}
	public String getMCODE() {
		return MCODE;
	}
	public void setMCODE(String mCODE) {
		MCODE = mCODE;
	}
	public String getNaver_mtitle() {
		return naver_mtitle;
	}
	public void setNaver_mtitle(String naver_mtitle) {
		this.naver_mtitle = naver_mtitle;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getUser_rating() {
		return user_rating;
	}
	public void setUser_rating(String user_rating) {
		this.user_rating = user_rating;
	}
}
