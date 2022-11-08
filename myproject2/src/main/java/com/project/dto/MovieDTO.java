package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("movie")
public class MovieDTO {
	private String mcode;
	private String title;
	private String titleEng;
	private String directorNm;
	private String directorEnNm;
	private String actorNm;
	private String actorEnNm;
	private String company;
	private String nation;
	private String genre;
	private String rating;
	private String runtime;
	private String repRlsDate;
	private String keywords;
	private String plotText;
	private String kmdbUrl;
	private String trailer;
	
	private String startdate;
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
