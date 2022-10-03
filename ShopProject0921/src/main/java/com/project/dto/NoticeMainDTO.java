package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("ntMain")
public class NoticeMainDTO {
	private String noticeno;
	private String title;
	private String content;
	private String wdate;
	private String writer;
	private String photopath;

	public NoticeMainDTO() {
	}

	public NoticeMainDTO(String noticeno, String title, String content, String wdate, String writer, String photopath) {
		super();
		this.noticeno = noticeno;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.writer = writer;
		this.photopath = photopath;
	}

	public String getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPhotopath() {
		return photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}

	@Override
	public String toString() {
		return "NoticeMainDTO [noticeno=" + noticeno + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", writer=" + writer + ", photopath=" + photopath + "]";
	}

}
