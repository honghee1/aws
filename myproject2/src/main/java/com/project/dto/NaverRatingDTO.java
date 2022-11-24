package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("naverRating")
public class NaverRatingDTO {
	private String mcode;
	private String naver_mtitle;
	private String pubDate;
	private String user_rating;
	public NaverRatingDTO(String mcode, String naver_mtitle, String pubDate, String user_rating) {
		super();
		this.mcode = mcode;
		this.naver_mtitle = naver_mtitle;
		this.pubDate = pubDate;
		this.user_rating = user_rating;
	}
	public NaverRatingDTO() {
		super();
	}
	@Override
	public String toString() {
		return "NaverRatingDTO [mcode=" + mcode + ", naver_mtitle=" + naver_mtitle + ", pubDate=" + pubDate
				+ ", user_rating=" + user_rating + "]";
	}
	public String getmcode() {
		return mcode;
	}
	public void setmcode(String mcode) {
		this.mcode = mcode;
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
