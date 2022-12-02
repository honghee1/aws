package com.project.dto;

import javax.validation.constraints.NotBlank;

import org.apache.ibatis.type.Alias;

@Alias("movie")
public class MovieDTO {
	private String mcode;
	
	@NotBlank(message = "제목을 입력해주세요.")
	private String title;
	
	@NotBlank(message = "영제목을 입력해주세요.")
	private String titleEng;
	
	@NotBlank(message = "감독을 입력해주세요.")
	private String directorNm;
	private String directorEnNm;
	
	@NotBlank(message = "한명 이상의 배우를 입력해주세요.")
	private String actorNm;
	private String actorEnNm;
	
	@NotBlank(message = "제작사를 입력해주세요.")
	private String company;
	
	@NotBlank(message = "국가를 입력해주세요.")
	private String nation;
	
	@NotBlank(message = "하나이상의 장르를 입력해주세요.")
	private String genre;
	
	@NotBlank(message = "관람등급 입력해주세요.")
	private String rating;
	
	@NotBlank(message = "상영시간을 입력해주세요.")
	private String runtime;
	
	@NotBlank(message = "개봉일을 입력해주세요.")
	private String repRlsDate;
	
	@NotBlank(message = "하나이상의 키워드를 입력해주세요.")
	private String keywords;
	
	@NotBlank(message = "줄거리를 입력해주세요.")
	private String plotText;
	
	private String kmdbUrl;
	
	private String trailer;
	
	@NotBlank(message = "상영시작일을 지정해주세요.")
	private String startdate;
	@NotBlank(message = "상영종료일을 지정해주세요.")
	private String enddate;
	
	private String user_rating;
	
	private String path;
	private String fileName;
	private String type;
	private int fno;
	
	public MovieDTO() {
	}
	
	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleEng() {
		return titleEng;
	}

	public void setTitleEng(String titleEng) {
		this.titleEng = titleEng;
	}

	public String getDirectorNm() {
		return directorNm;
	}

	public void setDirectorNm(String directorNm) {
		this.directorNm = directorNm;
	}

	public String getDirectorEnNm() {
		return directorEnNm;
	}

	public void setDirectorEnNm(String directorEnNm) {
		this.directorEnNm = directorEnNm;
	}

	public String getActorNm() {
		return actorNm;
	}

	public void setActorNm(String actorNm) {
		this.actorNm = actorNm;
	}

	public String getActorEnNm() {
		return actorEnNm;
	}

	public void setActorEnNm(String actorEnNm) {
		this.actorEnNm = actorEnNm;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getRepRlsDate() {
		return repRlsDate;
	}

	public void setRepRlsDate(String repRlsDate) {
		this.repRlsDate = repRlsDate;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getPlotText() {
		return plotText;
	}

	public void setPlotText(String plotText) {
		this.plotText = plotText;
	}

	public String getKmdbUrl() {
		return kmdbUrl;
	}

	public void setKmdbUrl(String kmdbUrl) {
		this.kmdbUrl = kmdbUrl;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getUser_rating() {
		return user_rating;
	}
	
	public void setUser_rating(String user_rating) {
		this.user_rating = user_rating;
	}

	@Override
	public String toString() {
		return "MovieDTO [mcode=" + mcode + ", title=" + title + ", titleEng=" + titleEng + ", directorNm=" + directorNm
				+ ", directorEnNm=" + directorEnNm + ", actorNm=" + actorNm + ", actorEnNm=" + actorEnNm + ", company="
				+ company + ", nation=" + nation + ", genre=" + genre + ", rating=" + rating + ", runtime=" + runtime
				+ ", repRlsDate=" + repRlsDate + ", keywords=" + keywords + ", plotText=" + plotText + ", kmdbUrl="
				+ kmdbUrl + ", trailer=" + trailer + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", user_rating=" + user_rating + ", path=" + path + ", fileName=" + fileName + ", type=" + type
				+ ", fno=" + fno + "]";
	}


	
	

	

	
	
	
}
