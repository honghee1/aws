package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("notice")
public class NoticeDTO {
	private String noticeno;
	private String title;
	private String writer;
	private String content;
	private String wdate;

	public NoticeDTO() {
	}

	public NoticeDTO(String noticeno, String title, String writer, String content, String wdate) {
		super();
		this.noticeno = noticeno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.wdate = wdate;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", wdate=" + wdate + "]";
	}

}
