package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnADTO {
	private int qno;
	private String qnaTitle;
	private String qnaArea;
	private String userEmail;
	private int qnaQuiryType;
	private String qnaQuiry;
	private String qnaContent;
	private String response;
	private String qnaDate;

	public QnADTO() {
	}
	
	
	
	public String getQnaQuiry() {
		return qnaQuiry;
	}



	public void setQnaQuiry(String qnaQuiry) {
		this.qnaQuiry = qnaQuiry;
	}



	public String getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getResponse() {
		return response;
	}
	
	public void setResponse(String response) {
		this.response = response;
	}


	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaArea() {
		return qnaArea;
	}

	public void setQnaArea(String qnaArea) {
		this.qnaArea = qnaArea;
	}

	public String getuserEmail() {
		return userEmail;
	}

	public void setuserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getQnaQuiryType() {
		return qnaQuiryType;
	}

	public void setQnaQuiryType(int qnaQuiryType) {
		this.qnaQuiryType = qnaQuiryType;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}



	@Override
	public String toString() {
		return "QnADTO [qno=" + qno + ", qnaTitle=" + qnaTitle + ", qnaArea=" + qnaArea + ", userEmail=" + userEmail
				+ ", qnaQuiryType=" + qnaQuiryType + ", qnaQuiry=" + qnaQuiry + ", qnaContent=" + qnaContent
				+ ", response=" + response + ", qnaDate=" + qnaDate + "]";
	}

	

	

	
}
